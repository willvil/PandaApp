@echo off
title PandaApps — Generando .exe...
color 0A
echo.
echo  ================================================
echo   PANDAAPPS — Compilador de aplicacion
echo  ================================================
echo.

REM Verificar Python
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python no encontrado. Instala Python desde python.org
    pause
    exit /b
)

echo  [1/3] Instalando dependencias...
pip install pywebview pyinstaller --quiet
if errorlevel 1 (
    echo  [ERROR] Fallo la instalacion de dependencias.
    pause
    exit /b
)

echo  [2/3] Compilando aplicacion...
pyinstaller --onefile --windowed --name "PandaApps" ^
    --add-data "Registro_Turno_PandaApps.html;." ^
    --icon NONE ^
    launcher.py

if errorlevel 1 (
    echo  [ERROR] Fallo la compilacion.
    pause
    exit /b
)

echo  [3/3] Listo.
echo.
echo  ================================================
echo   Tu archivo esta en:  dist\PandaApps.exe
echo  ================================================
echo.
pause
