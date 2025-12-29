# 🎬 Video Chunker per Gemini

Mini-app web che permette di caricare video di qualsiasi dimensione e li spezzetta automaticamente in blocchi da meno di 200 MB, perfetti per essere caricati su Gemini.

## ✨ Caratteristiche

- 📹 **Supporta video di qualsiasi dimensione** - Non ci sono limiti!
- 🎯 **Chunks sotto i 200 MB** - Perfetti per Gemini
- 🚀 **Interfaccia semplice** - Drag & drop o click per caricare
- ⚡ **Veloce ed efficiente** - Usa FFmpeg per lo splitting professionale
- 💾 **Download facile** - Scarica singoli chunks o tutti insieme

## 🚀 Installazione SUPER FACILE per Windows

### ⚡ Installazione automatica (consigliata)

1. **Scarica o clona questo repository**

2. **Fai doppio click su `setup.bat`**
   - Lo script installerà TUTTO automaticamente:
     - ✅ Node.js (se non presente)
     - ✅ FFmpeg portable
     - ✅ Tutte le dipendenze necessarie

3. **Fatto!** Quando vedi "Setup completato", sei pronto!

### ▶️ Avvio dell'applicazione

**Fai doppio click su `start.bat`**

Il browser si aprirà automaticamente su http://localhost:3000 e sei pronto per spezzettare i tuoi video! 🎉

---

## 📋 Installazione Manuale (Opzionale)

Se preferisci installare manualmente o usi Linux/macOS:

### Requisiti

1. **Node.js** (versione 14 o superiore)
   - Scarica da: https://nodejs.org/

2. **FFmpeg** (obbligatorio per lo splitting video)
   - **Windows**: Lo script automatico lo scarica per te!
   - **macOS**: `brew install ffmpeg`
   - **Linux**: `sudo apt-get install ffmpeg` (Ubuntu/Debian) o `sudo yum install ffmpeg` (CentOS/RHEL)

### Passi manuali

1. **Installa le dipendenze**:
   ```bash
   npm install
   ```

2. **Avvia il server**:
   ```bash
   npm start
   ```

3. **Apri il browser** e vai su:
   ```
   http://localhost:3000
   ```

## 📖 Come usare

1. **Apri l'applicazione** nel browser (http://localhost:3000)

2. **Carica il tuo video**:
   - Clicca sull'area di upload, oppure
   - Trascina e rilascia il file video

3. **Attendi il processing**:
   - Il video verrà caricato
   - Verrà automaticamente spezzettato in chunks da meno di 200 MB

4. **Scarica i chunks**:
   - Scarica i singoli chunks uno alla volta, oppure
   - Clicca "Scarica tutti i chunks" per scaricarli tutti insieme

5. **Usa i chunks su Gemini**:
   - Ogni chunk può essere caricato su Gemini senza problemi!

## 🛠️ Come funziona

L'applicazione usa **FFmpeg** per:
1. Analizzare il video originale
2. Calcolare la durata ottimale di ogni chunk in base al bitrate
3. Spezzettare il video usando stream copy (veloce, senza ricodifica)
4. Generare chunks che rispettano il limite di 200 MB

I chunks mantengono:
- ✅ Qualità video originale
- ✅ Qualità audio originale
- ✅ Codec originali
- ✅ Nessuna perdita di dati

## 📁 Struttura del progetto

```
video-chunker/
├── setup.bat          # 🔧 Script di setup automatico per Windows
├── start.bat          # ▶️ Script di avvio per Windows
├── server.js          # Server Express con logica di chunking
├── package.json       # Dipendenze del progetto
├── public/
│   └── index.html    # Interfaccia web
├── ffmpeg/           # FFmpeg portable (scaricato da setup.bat)
├── uploads/          # File temporanei (creata automaticamente)
├── output/           # Chunks generati (creata automaticamente)
└── README.md         # Questo file
```

## 🔧 Configurazione

Puoi modificare il limite di dimensione dei chunks editando `server.js`:

```javascript
const maxChunkSize = 200 * 1024 * 1024; // 200 MB in bytes
```

## ⚠️ Note importanti

- I file caricati vengono eliminati automaticamente dopo il processing
- I chunks generati rimangono nella cartella `output/` finché non li elimini manualmente
- Per video molto grandi, il processing può richiedere alcuni minuti
- Assicurati di avere spazio sufficiente su disco

## 🧹 Pulizia

Le sessioni vengono salvate in `output/session-XXXXX/`. Per pulire:

```bash
# Manualmente
rm -rf output/*
rm -rf uploads/*

# Oppure usando l'API
curl -X DELETE http://localhost:3000/cleanup/SESSION_ID
```

## 🐛 Risoluzione problemi

**Il server non si avvia**:
- Verifica che Node.js sia installato: `node --version`
- Verifica che le dipendenze siano installate: `npm install`

**Errore "FFmpeg not found"**:
- Installa FFmpeg seguendo le istruzioni nella sezione Requisiti
- Verifica l'installazione: `ffmpeg -version`

**Il video non viene processato**:
- Controlla che il file sia un formato video valido
- Verifica i log del server nella console
- Assicurati di avere spazio su disco sufficiente

## 📝 Licenza

MIT

## 🤝 Contributi

Contributi, issues e feature requests sono benvenuti!

---

Fatto con ❤️ per semplificare l'upload di video su Gemini
