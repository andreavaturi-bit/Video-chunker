Set WshShell = CreateObject("WScript.Shell")

' Ottieni il percorso della cartella corrente
Set fso = CreateObject("Scripting.FileSystemObject")
currentDir = fso.GetParentFolderName(WScript.ScriptFullName)

' Avvia il server completamente nascosto (senza finestra)
WshShell.Run "cmd /c cd /d """ & currentDir & """ && set PATH=" & currentDir & "\ffmpeg\bin;%PATH% && node server.js", 0, False

' Attendi 3 secondi per dare tempo al server di avviarsi
WScript.Sleep 3000

' Apri il browser
WshShell.Run "http://localhost:3000", 1, False

' Mostra un messaggio di conferma
MsgBox "Video Chunker avviato in background!" & vbCrLf & vbCrLf & "Il server e' in esecuzione su http://localhost:3000" & vbCrLf & vbCrLf & "Per fermarlo, esegui stop_server.bat", vbInformation, "Video Chunker"
