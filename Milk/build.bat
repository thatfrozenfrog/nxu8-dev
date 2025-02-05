cd Debug
ohu8 Milk.abs;
hex2bin Milk.hex
del rom.bin
rename Milk.bin rom.bin
copy rom.bin "D:\CasioEmuMsvc\CasioEmuMsvc\models\nxu16-dev-test\rom.bin" /Y /B
del rom.bin

cd D:\CasioEmuMsvc\CasioEmuMsvc
start CasioEmuMsvc.exe models\nxu16-dev-test