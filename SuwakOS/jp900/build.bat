rasu8 suwakOS.asm /G /SD
rlu8 /CC /SD suwakOS;
ohu8 suwakOS.abs;
hex2bin suwakOS.HEX
@echo off
pause
echo Writing to file
python write.py
pause