@echo off
echo.
echo ========================================
echo    VIDEO CHUNKER - Setup Automatico
echo ========================================
echo.

REM Verifica se Node.js e installato
echo [1/3] Verifico Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Node.js NON trovato!
    echo.
    echo Per favore installa Node.js manualmente da:
    echo https://nodejs.org/
    echo.
    echo Dopo l'installazione, riesegui questo script.
    echo.
    pause
    exit
) else (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo Node.js trovato: %NODE_VERSION%
)

echo.
echo [2/3] Verifico FFmpeg...
if exist "ffmpeg\bin\ffmpeg.exe" (
    echo FFmpeg trovato nella cartella locale
) else (
    echo.
    echo FFmpeg non trovato.
    echo.
    echo Scarico FFmpeg portable...
    echo Questo potrebbe richiedere qualche minuto...
    echo.

    REM Crea directory ffmpeg
    if not exist "ffmpeg" mkdir ffmpeg

    REM Scarica FFmpeg
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip' -OutFile 'ffmpeg.zip'"

    echo Estraggo FFmpeg...
    powershell -Command "Expand-Archive -Path 'ffmpeg.zip' -DestinationPath 'ffmpeg_temp' -Force"

    REM Sposta i file nella posizione corretta
    for /d %%i in (ffmpeg_temp\ffmpeg-*) do (
        xcopy "%%i\bin" "ffmpeg\bin\" /E /I /Y >nul
    )

    REM Pulisci file temporanei
    rmdir /s /q ffmpeg_temp
    del ffmpeg.zip

    echo FFmpeg installato!
)

echo.
echo [3/3] Installo dipendenze del progetto...
call npm install

echo.
echo ========================================
echo Setup completato con successo!
echo ========================================
echo.
echo Per avviare l'applicazione, fai doppio click su:
echo    START.BAT
echo.
echo Oppure digita: npm start
echo.
pause
