@echo off
REM Avvia il server minimizzato nella system tray

REM Imposta il PATH per FFmpeg locale
set PATH=%~dp0ffmpeg\bin;%PATH%

REM Avvia il server in una finestra minimizzata
start /min cmd /c "node server.js"

REM Attendi 2 secondi per dare tempo al server di avviarsi
timeout /t 2 /nobreak >nul

REM Apri il browser
start http://localhost:3000

echo Server avviato in background!
echo.
echo Per fermare il server, cerca la finestra minimizzata
echo oppure apri Task Manager e termina il processo node.exe
echo.
pause
