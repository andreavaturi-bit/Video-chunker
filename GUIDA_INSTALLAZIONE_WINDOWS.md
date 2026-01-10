# 🚀 Guida Completa di Installazione - Video Chunker per Windows

## 📋 Panoramica

Questa guida ti aiuterà a installare e utilizzare **Video Chunker** sul tuo PC Windows. L'applicazione funzionerà completamente in locale, senza bisogno di connessione internet e senza caricare i tuoi video online.

---

## ⚡ Metodo 1: Installazione Automatica (RACCOMANDATO)

### Passo 1: Scaricare il Repository

1. Vai su: https://github.com/andreavaturi-bit/Video-chunker
2. Clicca sul pulsante verde **"Code"**
3. Seleziona **"Download ZIP"**
4. Salva il file ZIP sul tuo PC
5. Estrai il contenuto in una cartella (es. `C:\Video-chunker`)

### Passo 2: Eseguire l'Installazione Automatica

1. Apri la cartella dove hai estratto i file
2. **Fai doppio click** sul file `setup.bat`
3. Si aprirà una finestra del terminale che installerà automaticamente:
   - ✅ Node.js (se non già presente)
   - ✅ FFmpeg (versione portable)
   - ✅ Tutte le dipendenze necessarie

4. Attendi che appaia il messaggio **"Setup completato!"**
5. Premi un tasto qualsiasi per chiudere la finestra

### Passo 3: Avviare l'Applicazione

1. Nella stessa cartella, **fai doppio click** sul file `start.bat`
2. Si aprirà automaticamente il browser su `http://localhost:3000`
3. L'applicazione è pronta all'uso! 🎉

---

## 🛠️ Metodo 2: Installazione Manuale

Se preferisci installare manualmente o l'installazione automatica non funziona:

### Requisiti

#### 1. Installare Node.js

1. Vai su: https://nodejs.org/
2. Scarica la versione **LTS** (Long Term Support)
3. Esegui l'installer e segui la procedura guidata
4. Accetta tutte le impostazioni predefinite
5. Verifica l'installazione:
   - Apri il **Prompt dei comandi** (cerca "cmd" nel menu Start)
   - Digita: `node --version`
   - Dovresti vedere qualcosa come `v20.x.x`

#### 2. Installare FFmpeg

**Opzione A: Installazione Automatica (consigliata)**
- Lo script `setup.bat` scarica FFmpeg automaticamente

**Opzione B: Installazione Manuale**
1. Vai su: https://www.gyan.dev/ffmpeg/builds/
2. Scarica **ffmpeg-release-essentials.zip**
3. Estrai il contenuto
4. Copia la cartella `bin` nella cartella del progetto e rinominala in `ffmpeg`
5. Verifica che esista il file: `C:\Video-chunker\ffmpeg\ffmpeg.exe`

### Installazione delle Dipendenze

1. Apri il **Prompt dei comandi**
2. Naviga nella cartella del progetto:
   ```cmd
   cd C:\Video-chunker
   ```
3. Installa le dipendenze:
   ```cmd
   npm install
   ```

### Avvio Manuale

1. Nel Prompt dei comandi, dalla cartella del progetto:
   ```cmd
   npm start
   ```
2. Apri il browser e vai su: `http://localhost:3000`

---

## 📖 Come Usare Video Chunker

### 1. Avviare l'Applicazione

- **Metodo rapido**: Doppio click su `start.bat`
- **Metodo manuale**: Apri cmd, vai nella cartella e digita `npm start`

### 2. Caricare un Video

1. Nell'interfaccia web, vedrai un'area con bordo tratteggiato
2. **Opzione A**: Clicca sull'area e seleziona il video dal tuo PC
3. **Opzione B**: Trascina il file video direttamente nell'area

### 3. Attendere il Processing

- Vedrai una barra di progresso durante il caricamento
- Il server analizzerà il video e lo spezzetterà automaticamente
- Il tempo richiesto dipende dalla dimensione del video

### 4. Scaricare i Chunks

Una volta completato il processing:
- Vedrai la lista di tutti i chunks generati
- Ogni chunk mostrerà nome e dimensione
- **Scarica singoli chunks**: clicca sul pulsante "Scarica" di ogni chunk
- **Scarica tutti insieme**: clicca sul pulsante "Scarica tutti i chunks"

### 5. Usare i Chunks su Gemini

- Ogni chunk è pronto per essere caricato su Gemini
- I chunks sono tutti sotto i 200 MB
- Mantengono la qualità originale del video

---

## 📁 Dove Trovare i File

### Cartelle del Progetto

```
C:\Video-chunker\
├── setup.bat              # Script di installazione automatica
├── start.bat              # Script di avvio rapido
├── server.js              # Server Node.js
├── package.json           # Configurazione dipendenze
├── public\
│   └── index.html        # Interfaccia web
├── ffmpeg\               # FFmpeg portable (dopo setup)
├── uploads\              # File temporanei (eliminati dopo processing)
└── output\               # Chunks generati (organizzati per sessione)
```

### Chunks Generati

I chunks vengono salvati in:
```
C:\Video-chunker\output\session-XXXXX\
```

Ogni sessione ha un ID univoco. I chunks rimangono salvati finché non li elimini manualmente.

---

## 🔧 Configurazione Avanzata

### Modificare la Dimensione dei Chunks

Se vuoi modificare il limite di 200 MB:

1. Apri il file `server.js` con un editor di testo (es. Notepad++)
2. Cerca la riga:
   ```javascript
   const maxChunkSize = 200 * 1024 * 1024; // 200 MB in bytes
   ```
3. Modifica il valore (es. per 150 MB):
   ```javascript
   const maxChunkSize = 150 * 1024 * 1024; // 150 MB in bytes
   ```
4. Salva il file
5. Riavvia il server

### Cambiare la Porta

Se la porta 3000 è già in uso:

1. Apri `server.js`
2. Cerca:
   ```javascript
   const PORT = 3000;
   ```
3. Cambia in un'altra porta (es. 8080):
   ```javascript
   const PORT = 8080;
   ```
4. Salva e riavvia
5. Accedi su `http://localhost:8080`

---

## 🧹 Pulizia e Manutenzione

### Eliminare i Chunks Vecchi

I chunks occupano spazio su disco. Per eliminarli:

**Metodo 1: Manuale**
1. Vai nella cartella `C:\Video-chunker\output\`
2. Elimina le cartelle delle sessioni che non ti servono più

**Metodo 2: Elimina tutto**
1. Elimina l'intera cartella `output`
2. Verrà ricreata automaticamente al prossimo utilizzo

### Eliminare i File Temporanei

I file in `uploads\` vengono eliminati automaticamente dopo il processing, ma puoi comunque svuotare manualmente la cartella se necessario.

---

## 🐛 Risoluzione Problemi

### Il server non si avvia

**Problema**: Errore "Node.js not found"
- **Soluzione**: Installa Node.js da https://nodejs.org/

**Problema**: Errore "Cannot find module"
- **Soluzione**: Esegui `npm install` nella cartella del progetto

**Problema**: Porta 3000 già in uso
- **Soluzione**: Cambia la porta in `server.js` (vedi sezione Configurazione Avanzata)

### FFmpeg non funziona

**Problema**: Errore "FFmpeg not found"
- **Soluzione 1**: Esegui di nuovo `setup.bat`
- **Soluzione 2**: Scarica FFmpeg manualmente e mettilo nella cartella `ffmpeg\`
- **Soluzione 3**: Installa FFmpeg a livello di sistema e aggiungilo al PATH

**Problema**: Errore durante lo splitting
- **Verifica**: Il file video è corrotto?
- **Verifica**: Hai spazio su disco sufficiente?
- **Verifica**: Il formato video è supportato?

### Il browser non si apre automaticamente

- **Soluzione**: Apri manualmente il browser e vai su `http://localhost:3000`

### Il video non viene processato

**Problema**: Upload si blocca
- **Causa**: Video troppo grande per la RAM
- **Soluzione**: Chiudi altre applicazioni per liberare memoria

**Problema**: Processing fallisce
- **Verifica**: Controlla i log nella finestra del terminale
- **Verifica**: Il formato video è supportato da FFmpeg
- **Verifica**: Hai spazio su disco sufficiente (almeno 2x la dimensione del video)

### Errori comuni e soluzioni

| Errore | Causa | Soluzione |
|--------|-------|-----------|
| `EADDRINUSE` | Porta già in uso | Cambia porta o chiudi l'altra applicazione |
| `ENOENT` | File non trovato | Verifica i percorsi dei file |
| `ENOMEM` | Memoria insufficiente | Chiudi altre applicazioni |
| `ENOSPC` | Spazio disco insufficiente | Libera spazio su disco |

---

## 💡 Suggerimenti e Best Practices

### Per Prestazioni Ottimali

1. **Chiudi altre applicazioni** durante il processing di video grandi
2. **Usa un SSD** se possibile (molto più veloce di HDD)
3. **Mantieni almeno 10 GB liberi** sul disco
4. **Non spegnere il PC** durante il processing

### Per Video Molto Grandi (>5 GB)

1. Assicurati di avere **spazio disco sufficiente** (almeno 2x la dimensione del video)
2. Il processing può richiedere **diversi minuti**
3. Non chiudere la finestra del browser durante il processing
4. Monitora i log nella finestra del terminale per verificare il progresso

### Formati Video Supportati

FFmpeg supporta praticamente tutti i formati video, inclusi:
- MP4, AVI, MOV, MKV, WMV, FLV
- WebM, OGV, 3GP, M4V
- E molti altri...

### Sicurezza e Privacy

- ✅ **Tutti i video rimangono sul tuo PC**
- ✅ **Nessun dato viene inviato online**
- ✅ **Funziona completamente offline**
- ✅ **Nessun tracking o telemetria**

---

## 🆘 Supporto

Se riscontri problemi non coperti da questa guida:

1. Verifica i log nella finestra del terminale
2. Controlla il file `server.log` nella cartella del progetto
3. Cerca l'errore su Google o Stack Overflow
4. Apri un issue su GitHub: https://github.com/andreavaturi-bit/Video-chunker/issues

---

## 📝 Note Finali

### Vantaggi dell'Esecuzione Locale

- ⚡ **Velocità**: Nessun upload/download su internet
- 🔒 **Privacy**: I tuoi video non lasciano mai il tuo PC
- 💰 **Gratuito**: Zero costi operativi
- 🚫 **Offline**: Funziona senza connessione internet
- ∞ **Illimitato**: Nessun limite di dimensione o numero di video

### Quando Usare Video Chunker

- Video troppo grandi per essere caricati direttamente su Gemini
- Video che superano i 200 MB
- Quando vuoi mantenere la privacy dei tuoi video
- Quando hai una connessione internet lenta

---

**Buon chunking! 🎬✨**
