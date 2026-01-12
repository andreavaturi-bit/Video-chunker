@echo off
echo.
echo Creazione scorciatoie sul desktop...
echo.

REM Esegui lo script PowerShell
powershell -ExecutionPolicy Bypass -File "%~dp0create_shortcuts.ps1"

echo.
pause
