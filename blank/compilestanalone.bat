ccu8 /SD /TML620906 /Om /Orp /Zc /Famain.asm /Lv /ML main.c
rasu8 main.asm /G /SD
rasu8 startup.asm /G /SD
rlu8 /CC /SD main startup;

ohu8 main.abs;
hex2bin main.HEX

python pad.py main.bin
pause