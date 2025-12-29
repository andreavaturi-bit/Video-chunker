@echo off
chcp 65001 >nul
cls
echo.
echo ========================================
echo    🎬 VIDEO CHUNKER 🎬
echo ========================================
echo.
echo Avvio del server...
echo.
echo Il browser si aprirà automaticamente.
echo.
echo 💡 Per fermare il server, premi CTRL+C
echo.
echo ========================================
echo.

REM Attendi 2 secondi e apri il browser
start "" /b timeout /t 2 /nobreak >nul && start http://localhost:3000

REM Avvia il server Node.js
call npm start
