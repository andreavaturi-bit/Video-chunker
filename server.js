const express = require('express');
const multer = require('multer');
const ffmpeg = require('fluent-ffmpeg');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = 3000;

// Crea le directory necessarie
const UPLOAD_DIR = path.join(__dirname, 'uploads');
const OUTPUT_DIR = path.join(__dirname, 'output');

[UPLOAD_DIR, OUTPUT_DIR].forEach(dir => {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
});

// Configurazione multer per l'upload
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, UPLOAD_DIR);
    },
    filename: (req, file, cb) => {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, uniqueSuffix + '-' + file.originalname);
    }
});

const upload = multer({ storage: storage });

// Serve i file statici dalla cartella public
app.use(express.static('public'));
app.use('/output', express.static(OUTPUT_DIR));

// Endpoint per l'upload e il chunking del video
app.post('/upload', upload.single('video'), async (req, res) => {
    if (!req.file) {
        return res.status(400).json({ error: 'Nessun file caricato' });
    }

    const inputPath = req.file.path;
    const originalName = path.parse(req.file.originalname).name;
    const extension = path.parse(req.file.originalname).ext;
    const sessionId = Date.now();
    const outputFolder = path.join(OUTPUT_DIR, `session-${sessionId}`);

    // Crea la cartella di output per questa sessione
    if (!fs.existsSync(outputFolder)) {
        fs.mkdirSync(outputFolder, { recursive: true });
    }

    try {
        // Ottieni informazioni sul video
        const videoInfo = await getVideoInfo(inputPath);
        const fileSizeBytes = fs.statSync(inputPath).size;
        const maxChunkSize = 200 * 1024 * 1024; // 200 MB in bytes

        // Calcola la durata di ogni chunk
        const duration = videoInfo.duration;
        const estimatedBitrate = (fileSizeBytes * 8) / duration; // bits per second
        const chunkDuration = Math.floor((maxChunkSize * 8) / estimatedBitrate);

        // Se il file è già sotto i 200 MB, copialo semplicemente
        if (fileSizeBytes <= maxChunkSize) {
            const outputPath = path.join(outputFolder, `${originalName}_chunk_001${extension}`);
            fs.copyFileSync(inputPath, outputPath);

            // Pulisci il file di upload
            fs.unlinkSync(inputPath);

            return res.json({
                success: true,
                sessionId: sessionId,
                chunks: [`${originalName}_chunk_001${extension}`],
                message: 'Video già sotto i 200 MB, nessuna divisione necessaria'
            });
        }

        // Spezzetta il video
        const chunks = await splitVideo(
            inputPath,
            outputFolder,
            originalName,
            extension,
            chunkDuration
        );

        // Pulisci il file di upload
        fs.unlinkSync(inputPath);

        res.json({
            success: true,
            sessionId: sessionId,
            chunks: chunks,
            message: `Video diviso in ${chunks.length} parti`
        });

    } catch (error) {
        console.error('Errore durante il processing:', error);

        // Pulisci in caso di errore
        if (fs.existsSync(inputPath)) {
            fs.unlinkSync(inputPath);
        }

        res.status(500).json({
            error: 'Errore durante il processing del video',
            details: error.message
        });
    }
});

// Funzione per ottenere informazioni sul video
function getVideoInfo(inputPath) {
    return new Promise((resolve, reject) => {
        ffmpeg.ffprobe(inputPath, (err, metadata) => {
            if (err) {
                reject(err);
            } else {
                resolve({
                    duration: metadata.format.duration,
                    size: metadata.format.size,
                    bitrate: metadata.format.bit_rate
                });
            }
        });
    });
}

// Funzione per spezzettare il video
function splitVideo(inputPath, outputFolder, originalName, extension, chunkDuration) {
    return new Promise(async (resolve, reject) => {
        try {
            const videoInfo = await getVideoInfo(inputPath);
            const totalDuration = videoInfo.duration;
            const chunks = [];
            let currentTime = 0;
            let chunkIndex = 1;

            const processNextChunk = () => {
                if (currentTime >= totalDuration) {
                    resolve(chunks);
                    return;
                }

                const outputFileName = `${originalName}_chunk_${String(chunkIndex).padStart(3, '0')}${extension}`;
                const outputPath = path.join(outputFolder, outputFileName);

                ffmpeg(inputPath)
                    .setStartTime(currentTime)
                    .setDuration(chunkDuration)
                    .output(outputPath)
                    .videoCodec('copy')
                    .audioCodec('copy')
                    .on('end', () => {
                        // Verifica la dimensione del chunk
                        const chunkSize = fs.statSync(outputPath).size;
                        const maxSize = 200 * 1024 * 1024;

                        if (chunkSize > maxSize) {
                            console.warn(`Chunk ${chunkIndex} è ${(chunkSize / (1024 * 1024)).toFixed(2)} MB, potrebbe essere troppo grande`);
                        }

                        chunks.push(outputFileName);
                        currentTime += chunkDuration;
                        chunkIndex++;
                        processNextChunk();
                    })
                    .on('error', (err) => {
                        reject(err);
                    })
                    .run();
            };

            processNextChunk();
        } catch (error) {
            reject(error);
        }
    });
}

// Endpoint per scaricare tutti i chunks come ZIP (opzionale)
app.get('/download-all/:sessionId', async (req, res) => {
    const sessionId = req.params.sessionId;
    const outputFolder = path.join(OUTPUT_DIR, `session-${sessionId}`);

    if (!fs.existsSync(outputFolder)) {
        return res.status(404).json({ error: 'Sessione non trovata' });
    }

    const files = fs.readdirSync(outputFolder);

    res.json({
        sessionId: sessionId,
        files: files
    });
});

// Endpoint per pulire le sessioni vecchie (opzionale)
app.delete('/cleanup/:sessionId', (req, res) => {
    const sessionId = req.params.sessionId;
    const outputFolder = path.join(OUTPUT_DIR, `session-${sessionId}`);

    if (fs.existsSync(outputFolder)) {
        fs.rmSync(outputFolder, { recursive: true, force: true });
        res.json({ success: true, message: 'Sessione pulita' });
    } else {
        res.status(404).json({ error: 'Sessione non trovata' });
    }
});

app.listen(PORT, () => {
    console.log(`🎬 Video Chunker Server avviato su http://localhost:${PORT}`);
    console.log(`📁 Upload directory: ${UPLOAD_DIR}`);
    console.log(`📂 Output directory: ${OUTPUT_DIR}`);
});
