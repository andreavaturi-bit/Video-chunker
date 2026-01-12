@echo off
REM Apre l'interfaccia web nel browser senza avviare un nuovo server

echo.
echo ========================================
echo    VIDEO CHUNKER - Apri Interfaccia
echo ========================================
echo.

REM Verifica se il server e' gia' in esecuzione
tasklist /FI "IMAGENAME eq node.exe" 2>NUL | find /I /N "node.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Server gia' in esecuzione!
    echo Apertura interfaccia web...
    echo.
    start http://localhost:3000
) else (
    echo Server NON in esecuzione!
    echo.
    echo Vuoi avviare il server? (S/N)
    choice /C SN /N
    if errorlevel 2 goto :end
    if errorlevel 1 goto :start
)

goto :end

:start
echo.
echo Avvio server...
set PATH=%~dp0ffmpeg\bin;%PATH%
start /min cmd /c "node server.js"
timeout /t 3 /nobreak >nul
start http://localhost:3000
echo.
echo Server avviato!

:end
echo.
pause
