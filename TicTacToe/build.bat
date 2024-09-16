cd Debug
hex2bin TicTacToe.HEX
del rom.bin
rename TicTacToe.bin rom.bin
copy rom.bin "C:\Users\Admin\Pictures\Emulators\NewestMSVC\models\TicTacToe" /Y /B
pause