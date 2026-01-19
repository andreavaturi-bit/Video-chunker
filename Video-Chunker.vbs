Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Ottieni la cartella dello script
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)

' Avvia il server nascosto
WshShell.Run "cmd /c cd /d """ & scriptPath & """ && npm start", 0, False

' Attendi 3 secondi per dare tempo al server di avviarsi
WScript.Sleep 3000

' Apri il browser
WshShell.Run "http://localhost:3000", 1, False
