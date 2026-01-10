@echo off
echo.
echo ========================================
echo    VIDEO CHUNKER - Avvio Server
echo ========================================
echo.
echo Avvio server su http://localhost:3000
echo.
echo IMPORTANTE: NON chiudere questa finestra!
echo.
echo Per fermare il server, premi CTRL+C
echo.
echo ========================================
echo.

REM Imposta il PATH per FFmpeg locale
set PATH=%~dp0ffmpeg\bin;%PATH%

REM Avvia il server
npm start

pause
