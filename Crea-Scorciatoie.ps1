# Script per creare scorciatoie desktop per Video Chunker

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktopPath = [Environment]::GetFolderPath("Desktop")
$WshShell = New-Object -ComObject WScript.Shell

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   CREAZIONE SCORCIATOIE DESKTOP" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Scorciatoia 1: Avvia Video Chunker
$shortcut1Path = Join-Path $desktopPath "Video Chunker.lnk"
$shortcut1 = $WshShell.CreateShortcut($shortcut1Path)
$shortcut1.TargetPath = Join-Path $scriptPath "Video-Chunker.vbs"
$shortcut1.WorkingDirectory = $scriptPath
$shortcut1.Description = "Avvia Video Chunker"
$shortcut1.IconLocation = "shell32.dll,165"
$shortcut1.Save()
Write-Host "[OK] Creata: Video Chunker.lnk" -ForegroundColor Green

# Scorciatoia 2: Ferma Video Chunker
$shortcut2Path = Join-Path $desktopPath "Ferma Video Chunker.lnk"
$shortcut2 = $WshShell.CreateShortcut($shortcut2Path)
$shortcut2.TargetPath = Join-Path $scriptPath "Ferma-Video-Chunker.bat"
$shortcut2.WorkingDirectory = $scriptPath
$shortcut2.Description = "Ferma Video Chunker"
$shortcut2.IconLocation = "shell32.dll,132"
$shortcut2.Save()
Write-Host "[OK] Creata: Ferma Video Chunker.lnk" -ForegroundColor Green

# Scorciatoia 3: Apri Interfaccia
$shortcut3Path = Join-Path $desktopPath "Apri Video Chunker.lnk"
$shortcut3 = $WshShell.CreateShortcut($shortcut3Path)
$shortcut3.TargetPath = "http://localhost:3000"
$shortcut3.Description = "Apri interfaccia Video Chunker"
$shortcut3.IconLocation = "shell32.dll,14"
$shortcut3.Save()
Write-Host "[OK] Creata: Apri Video Chunker.lnk" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Scorciatoie create con successo!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Troverai sul desktop:" -ForegroundColor White
Write-Host "  - Video Chunker (avvia l'app)" -ForegroundColor Gray
Write-Host "  - Apri Video Chunker (riapri browser)" -ForegroundColor Gray
Write-Host "  - Ferma Video Chunker (ferma il server)" -ForegroundColor Gray
Write-Host ""

Read-Host "Premi Invio per uscire"
