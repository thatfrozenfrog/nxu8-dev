for %%f in (*.*) do (
	if /i not "%%~xf"==".h" (
    if /i not "%%~xf"==".c" (
    if /i not "%%~xf"==".py" (
    if /i not "%%~xf"==".ink" (
    if /i not "%%~nxf"=="startup.asm" (
	if /i not "%%~xf"==".lnk" (
    if /i not "%%~xf"==".DCL" (
    if /i not "%%~xf"==".bat" (
        echo Deleting "%%f"
        del "%%f"
    ))))))))
)

pause

ccu8 /SD /TML620906 /Om /Orp /Zc /Famain.asm /Lv /ML main.c
rasu8 main.asm /G /SD
rasu8 startup.asm /G /SD
rlu8 /CC /SD main startup;
ohu8 main.abs;
hex2bin main.hex
python pad.py
@echo off
echo Any key to copy rom.bin to MSVC
pause
setlocal
:: Set the source and destination directories
set "source=%cd%\rom.bin"
set "destination=C:\Users\Admin\Pictures\CasioEmuX\x86\models\PaintDev"

:: Ensure the destination directory exists
if not exist "%destination%" (
    mkdir "%destination%"
)

:: Copy the file
copy "%source%" "%destination%"

:: Check if the copy was successful
if %errorlevel% equ 0 (
    echo File copied successfully.
) else (
    echo Failed to copy the file.
)

endlocal

echo Any key to run MSVC
start msvc