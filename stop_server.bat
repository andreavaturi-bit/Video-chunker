@echo off
echo.
echo ========================================
echo    VIDEO CHUNKER - Ferma Server
echo ========================================
echo.
echo Cerco processi Node.js in esecuzione...
echo.

REM Termina tutti i processi node.exe
taskkill /F /IM node.exe >nul 2>&1

if %errorlevel% equ 0 (
    echo Server fermato con successo!
) else (
    echo Nessun server in esecuzione.
)

echo.
pause
