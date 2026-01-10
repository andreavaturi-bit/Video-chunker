# ⚡ Istruzioni Rapide - Video Chunker

## 🚀 Installazione in 3 Passi

### 1️⃣ Scarica
- Vai su https://github.com/andreavaturi-bit/Video-chunker
- Clicca "Code" → "Download ZIP"
- Estrai in una cartella (es. `C:\Video-chunker`)

### 2️⃣ Installa
- Fai doppio click su **`setup.bat`**
- Attendi il completamento (installa Node.js + FFmpeg + dipendenze)

### 3️⃣ Usa
- Fai doppio click su **`start.bat`**
- Si apre il browser su http://localhost:3000
- Trascina il video e scarica i chunks!

---

## 📖 Uso Quotidiano

### Avvio
```
Doppio click su start.bat
```

### Carica Video
- Trascina il file nell'area tratteggiata, OPPURE
- Clicca e seleziona il file

### Scarica Chunks
- Singolarmente: clicca "Scarica" su ogni chunk
- Tutti insieme: clicca "Scarica tutti i chunks"

---

## 🔧 Comandi Utili

### Avvio Manuale
```cmd
cd C:\Video-chunker
npm start
```

### Reinstallare Dipendenze
```cmd
cd C:\Video-chunker
npm install
```

### Pulire i Chunks Vecchi
```cmd
# Elimina manualmente la cartella:
C:\Video-chunker\output\
```

---

## ⚠️ Requisiti Minimi

- **Sistema**: Windows 7 o superiore
- **RAM**: 4 GB (8 GB raccomandati per video grandi)
- **Spazio Disco**: Almeno 2x la dimensione del video più grande
- **Connessione**: Non richiesta (funziona offline)

---

## 🐛 Problemi Comuni

| Problema | Soluzione |
|----------|-----------|
| Server non si avvia | Esegui di nuovo `setup.bat` |
| FFmpeg not found | Esegui di nuovo `setup.bat` |
| Porta 3000 occupata | Modifica `PORT` in `server.js` |
| Browser non si apre | Apri manualmente `http://localhost:3000` |

---

## 📚 Documentazione Completa

Per istruzioni dettagliate, risoluzione problemi avanzata e configurazione:
- Leggi **`GUIDA_INSTALLAZIONE_WINDOWS.md`**
- Leggi **`README.md`**

---

## ✨ Caratteristiche

✅ Video di qualsiasi dimensione  
✅ Chunks sotto i 200 MB  
✅ Nessun upload online  
✅ Privacy totale  
✅ Veloce (processing locale)  
✅ Gratuito  
✅ Funziona offline  

---

**Fatto con ❤️ per semplificare l'upload di video su Gemini**
