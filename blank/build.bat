@echo off
if "%~1"=="" (
    echo No file provided.
    echo Usage: drag and drop a C file onto this script.
    exit /b
)

set file=%~1
set filename=%~n1

ccu8 /TML620906 /Om /Orp /Zc /Fa%filename%.asm /Lv /ML %file%

pause