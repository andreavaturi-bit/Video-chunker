# 🚀 Guida: Eseguire Video Chunker in Background

## 🎯 Problema

Quando avvii Video Chunker con `start_fixed.bat`, devi tenere aperta la finestra del terminale. Se la chiudi, il server si ferma.

## ✅ Soluzioni Disponibili

Ho creato diversi file per risolvere questo problema. Scegli la soluzione che preferisci!

---

## 📋 Soluzione 1: Avvio Nascosto (RACCOMANDATO)

### File: `start_hidden.vbs`

**Come funziona**:
- Avvia il server completamente nascosto (nessuna finestra)
- Apre automaticamente il browser
- Mostra un messaggio di conferma

**Come usare**:
1. **Fai doppio click** su `start_hidden.vbs`
2. Il server si avvia in background (nessuna finestra)
3. Il browser si apre automaticamente
4. Vedi un messaggio di conferma

**Per fermare il server**:
- Fai doppio click su `stop_server.bat`

**Vantaggi**:
- ✅ Nessuna finestra da tenere aperta
- ✅ Avvio automatico del browser
- ✅ Messaggio di conferma
- ✅ Facile da usare

**Svantaggi**:
- ⚠️ Non vedi i log del server
- ⚠️ Devi usare `stop_server.bat` per fermarlo

---

## 📋 Soluzione 2: Avvio Minimizzato

### File: `start_minimized.bat`

**Come funziona**:
- Avvia il server in una finestra minimizzata
- La finestra rimane nella barra delle applicazioni
- Apre automaticamente il browser

**Come usare**:
1. **Fai doppio click** su `start_minimized.bat`
2. Il server si avvia minimizzato
3. Il browser si apre automaticamente
4. La finestra rimane nella barra delle applicazioni

**Per fermare il server**:
- Clicca sulla finestra minimizzata e premi `CTRL+C`
- Oppure usa `stop_server.bat`

**Vantaggi**:
- ✅ Finestra minimizzata (non ingombra)
- ✅ Puoi vedere i log se necessario
- ✅ Facile da fermare

**Svantaggi**:
- ⚠️ La finestra è ancora presente (anche se minimizzata)

---

## 📋 Soluzione 3: Scorciatoie sul Desktop

### File: `create_shortcuts.bat`

**Come funziona**:
- Crea 3 scorciatoie sul desktop
- Accesso rapido a tutte le funzioni

**Come usare**:
1. **Fai doppio click** su `create_shortcuts.bat`
2. Verranno create 3 scorciatoie sul desktop:
   - **Video Chunker - Avvia**: avvia il server in background
   - **Video Chunker - Apri**: apre l'interfaccia web
   - **Video Chunker - Ferma**: ferma il server

**Vantaggi**:
- ✅ Accesso rapidissimo dal desktop
- ✅ Icone personalizzate
- ✅ Non devi più cercare i file .bat

**Come usare le scorciatoie**:
1. **Doppio click su "Video Chunker - Avvia"**: avvia il server
2. **Doppio click su "Video Chunker - Apri"**: apre l'interfaccia (o avvia il server se non è attivo)
3. **Doppio click su "Video Chunker - Ferma"**: ferma il server

---

## 📋 Soluzione 4: Aprire l'Interfaccia Senza Riavviare

### File: `open_interface.bat`

**Come funziona**:
- Apre l'interfaccia web nel browser
- Se il server non è attivo, ti chiede se vuoi avviarlo
- Non avvia un nuovo server se è già in esecuzione

**Come usare**:
1. **Fai doppio click** su `open_interface.bat`
2. Se il server è già attivo, apre solo il browser
3. Se il server non è attivo, ti chiede se vuoi avviarlo

**Vantaggi**:
- ✅ Non avvia server duplicati
- ✅ Perfetto per riaprire l'interfaccia dopo aver chiuso il browser
- ✅ Controllo intelligente dello stato del server

---

## 🎯 Quale Soluzione Scegliere?

### Per Uso Quotidiano (RACCOMANDATO):

1. **Esegui una volta** `create_shortcuts.bat` per creare le scorciatoie
2. **Usa le scorciatoie** sul desktop:
   - Al mattino: doppio click su "Video Chunker - Avvia"
   - Durante il giorno: doppio click su "Video Chunker - Apri" per riaprire l'interfaccia
   - Alla sera: doppio click su "Video Chunker - Ferma"

### Per Uso Occasionale:

- Usa `start_hidden.vbs` per avvio rapido
- Usa `stop_server.bat` per fermare

### Per Debug/Sviluppo:

- Usa `start_fixed.bat` (finestra visibile con log)

---

## 🛠️ File di Utilità

### `stop_server.bat`

**Cosa fa**: Ferma tutti i processi Node.js (quindi il server)

**Quando usarlo**:
- Quando hai avviato il server con `start_hidden.vbs`
- Quando vuoi fermare il server rapidamente
- Quando il server è bloccato

**Come usare**:
- Fai doppio click su `stop_server.bat`

---

## 📖 Workflow Consigliato

### Setup Iniziale (Una Volta):

1. Esegui `create_shortcuts.bat`
2. Verifica che le scorciatoie siano sul desktop

### Uso Quotidiano:

**Mattina / Quando inizi a lavorare**:
1. Doppio click su "Video Chunker - Avvia" (desktop)
2. Il browser si apre automaticamente
3. Sei pronto per spezzettare video!

**Durante il giorno**:
- Se chiudi il browser, doppio click su "Video Chunker - Apri"
- Il server è già attivo, si riapre solo il browser

**Sera / Quando finisci**:
1. Doppio click su "Video Chunker - Ferma" (desktop)
2. Il server si ferma

---

## ⚙️ Avvio Automatico con Windows (Opzionale)

Se vuoi che Video Chunker si avvii automaticamente all'avvio di Windows:

### Metodo 1: Cartella Esecuzione Automatica

1. Premi `Windows + R`
2. Digita: `shell:startup`
3. Si apre la cartella "Esecuzione automatica"
4. Copia il file `start_hidden.vbs` in questa cartella
5. Al prossimo riavvio, Video Chunker si avvierà automaticamente

### Metodo 2: Scorciatoia nella Cartella Startup

1. Crea le scorciatoie con `create_shortcuts.bat`
2. Premi `Windows + R` e digita: `shell:startup`
3. Copia la scorciatoia "Video Chunker - Avvia" nella cartella
4. Al prossimo riavvio, Video Chunker si avvierà automaticamente

---

## 🐛 Risoluzione Problemi

### Il server non si avvia in background

**Problema**: Fai doppio click su `start_hidden.vbs` ma non succede nulla

**Soluzioni**:
1. Verifica che Node.js sia installato: apri cmd e digita `node --version`
2. Verifica che FFmpeg sia presente in `ffmpeg\bin\ffmpeg.exe`
3. Prova ad avviare con `start_fixed.bat` per vedere eventuali errori

### Il browser non si apre automaticamente

**Problema**: Il server si avvia ma il browser non si apre

**Soluzione**:
- Apri manualmente il browser e vai su `http://localhost:3000`
- Oppure usa `open_interface.bat`

### Non riesco a fermare il server

**Problema**: Il server continua a girare anche dopo aver chiuso tutto

**Soluzioni**:
1. Usa `stop_server.bat`
2. Apri Task Manager (CTRL+SHIFT+ESC)
3. Cerca "Node.js" nei processi
4. Click destro → "Termina attività"

### Le scorciatoie non funzionano

**Problema**: Le scorciatoie sul desktop non fanno nulla

**Soluzioni**:
1. Verifica che i file .bat e .vbs siano nella cartella di Video Chunker
2. Ricrea le scorciatoie con `create_shortcuts.bat`
3. Prova a eseguire i file .bat direttamente dalla cartella

### Errore "Porta 3000 già in uso"

**Problema**: Il server dice che la porta 3000 è già occupata

**Causa**: Hai già un'istanza del server in esecuzione

**Soluzione**:
1. Usa `stop_server.bat` per fermare tutte le istanze
2. Riavvia il server

---

## 💡 Suggerimenti

### Per Massima Comodità:

1. **Crea le scorciatoie** sul desktop con `create_shortcuts.bat`
2. **Aggiungi all'avvio automatico** (opzionale)
3. **Usa "Video Chunker - Apri"** per riaprire l'interfaccia quando serve

### Per Risparmiare Risorse:

- Ferma il server quando non lo usi con `stop_server.bat`
- Il server usa poca RAM (~50-100 MB) ma è comunque buona pratica fermarlo

### Per Debug:

- Se qualcosa non funziona, usa `start_fixed.bat` per vedere i log
- I log ti diranno esattamente cosa non va

---

## 📊 Confronto Soluzioni

| Soluzione | Finestra Visibile | Log Visibili | Facile da Fermare | Raccomandato |
|-----------|-------------------|--------------|-------------------|--------------|
| `start_hidden.vbs` | ❌ No | ❌ No | ✅ Sì (`stop_server.bat`) | ✅ Sì |
| `start_minimized.bat` | ⚠️ Minimizzata | ✅ Sì | ✅ Sì | ⚠️ Alternativa |
| `start_fixed.bat` | ✅ Sì | ✅ Sì | ✅ Sì (CTRL+C) | ⚠️ Solo debug |
| Scorciatoie Desktop | ❌ No | ❌ No | ✅ Sì | ✅✅ Migliore |

---

## 🎉 Conclusione

La **soluzione migliore** è:

1. **Una volta**: Esegui `create_shortcuts.bat`
2. **Ogni giorno**: Usa le scorciatoie sul desktop
   - "Avvia" al mattino
   - "Apri" durante il giorno
   - "Ferma" alla sera

Così hai:
- ✅ Accesso rapidissimo
- ✅ Nessuna finestra da gestire
- ✅ Controllo totale (avvia/ferma facilmente)
- ✅ Interfaccia sempre disponibile

---

**Buon lavoro con Video Chunker!** 🎬✨
