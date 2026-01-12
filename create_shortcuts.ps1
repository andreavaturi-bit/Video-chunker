# Script per creare scorciatoie sul desktop per Video Chunker

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktopPath = [Environment]::GetFolderPath("Desktop")

Write-Host ""
Write-Host "========================================"
Write-Host "   VIDEO CHUNKER - Crea Scorciatoie"
Write-Host "========================================"
Write-Host ""

# Crea oggetto WScript.Shell
$WScriptShell = New-Object -ComObject WScript.Shell

# Scorciatoia 1: Avvia Video Chunker (nascosto)
Write-Host "[1/3] Creo scorciatoia: Avvia Video Chunker..."
$shortcut1 = $WScriptShell.CreateShortcut("$desktopPath\Video Chunker - Avvia.lnk")
$shortcut1.TargetPath = "wscript.exe"
$shortcut1.Arguments = "`"$scriptPath\start_hidden.vbs`""
$shortcut1.WorkingDirectory = $scriptPath
$shortcut1.Description = "Avvia Video Chunker in background"
$shortcut1.IconLocation = "shell32.dll,14"
$shortcut1.Save()

# Scorciatoia 2: Apri Interfaccia
Write-Host "[2/3] Creo scorciatoia: Apri Interfaccia..."
$shortcut2 = $WScriptShell.CreateShortcut("$desktopPath\Video Chunker - Apri.lnk")
$shortcut2.TargetPath = "$scriptPath\open_interface.bat"
$shortcut2.WorkingDirectory = $scriptPath
$shortcut2.Description = "Apri l'interfaccia di Video Chunker"
$shortcut2.IconLocation = "shell32.dll,220"
$shortcut2.Save()

# Scorciatoia 3: Ferma Server
Write-Host "[3/3] Creo scorciatoia: Ferma Server..."
$shortcut3 = $WScriptShell.CreateShortcut("$desktopPath\Video Chunker - Ferma.lnk")
$shortcut3.TargetPath = "$scriptPath\stop_server.bat"
$shortcut3.WorkingDirectory = $scriptPath
$shortcut3.Description = "Ferma il server di Video Chunker"
$shortcut3.IconLocation = "shell32.dll,131"
$shortcut3.Save()

Write-Host ""
Write-Host "========================================"
Write-Host "Scorciatoie create con successo!"
Write-Host "========================================"
Write-Host ""
Write-Host "Sul tuo desktop troverai:"
Write-Host "  1. Video Chunker - Avvia   (avvia in background)"
Write-Host "  2. Video Chunker - Apri    (apre l'interfaccia)"
Write-Host "  3. Video Chunker - Ferma   (ferma il server)"
Write-Host ""
Write-Host "Premi un tasto per chiudere..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
