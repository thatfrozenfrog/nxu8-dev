@echo off
set filename=%1
if "%filename%"=="" (
    echo No filename provided.
    pause
    exit /b
)

for %%f in (%filename%) do set filenameNoExt=%%~nf

rasu8 %filenameNoExt%.asm /G /SD
rlu8 /CC /SD %filenameNoExt%;
ohu8 %filenameNoExt%.abs;
hex2bin %filenameNoExt%.HEX
pause