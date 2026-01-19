@echo off
echo.
echo ========================================
echo    FERMA VIDEO CHUNKER
echo ========================================
echo.
echo Sto fermando il server...
echo.

REM Termina tutti i processi Node.js
taskkill /F /IM node.exe >nul 2>&1

if %errorlevel% equ 0 (
    echo Video Chunker fermato con successo!
) else (
    echo Video Chunker non era in esecuzione.
)

echo.
timeout /t 2 >nul
