org 0xE9E0
setlr
DI,RT
xr0 = cursor_noflash, 0x01, 0x00
[er0] = r2
buffer_clear
call 0x0947e
setlr
er0 = 0x0000
er4 = 0xd830
[er4] = er0,pop er0,rt
0x3030
ea = 0xd832
xr0 = 0x0000,0x0000
[ea]=qr0
xr0 = 0xd836,adr_of 60278
BL memcpy,pop er0
0x0200
60278:
setlr
getkeycode
setlr
r1 = 0
er2 = 0xd830
[er2]=r0,r2 = 0
er2 = 0x001C
er0-=er2,rt
r1 = 0
er2 = adr_of tbl
load_table
er14 = er0, pop xr0
0x30303030
sp = er14,pop er14
60286:
setlr
er8 = 0xd832
er2 = 0xFF00
[er8]+=er2,pop xr8
0x3030
0x3030
er14 = adr_of [-2] cont
sp = er14,pop er14
60316:
setlr
er8 = 0xd832
er2 = 0x0100
[er8]+=er2,pop xr8
0x3030
0x3030
er14 = adr_of [-2] cont
sp = er14,pop er14
60346:
setlr
er8 = 0xd834
er2 = 0xFFFF
[er8]+=er2,pop xr8
0x3030
0x3030
er14 = adr_of [-2] cont
sp = er14,pop er14
60376:
setlr
er8 = 0xd834
er2 = 0x0001
[er8]+=er2,pop xr8
0x3030
0x3030
er14 = adr_of [-2] cont
sp = er14,pop er14
60406:
setlr
er2 = 0xd834
er0=[er2],r2 = 9,rt
er2 = er0,er0 = er2,pop er8,rt
0x0000
er0 = 0xd832
er0=[er0],pop xr8,rt
0x00000000
r0 = r2
er2 = 0x0000
pixel_draw
call 0x0947e
setlr
er14 = adr_of [-2] cont
sp = er14,pop er14
60450:
setlr
er2 = 0xd834
er0=[er2],r2 = 9,rt
er2 = er0,er0 = er2,pop er8,rt
0x0000
er0 = 0xd832
er0=[er0],pop xr8,rt
0x00000000
r0 = r2
er2 = 0xFFFF
pixel_draw
call 0x0947e
setlr
er14 = adr_of [-2] cont
sp = er14,pop er14
60494:
setlr
buffer_clear
call 0x0947e
setlr
er14 = adr_of [-2] cont
sp = er14,pop er14
cont:
xr0 = adr_of 60516,0x0200
[er0] = er2,rt
xr0 = adr_of 60278,0xd836
BL memcpy,pop er0
60516:
0x0200
er14 = adr_of [-2] 60278
sp = er14,pop er14
brk

tbl:
    adr_of [-2] 60286
    adr_of [-2] 60316
    adr_of [-2] 60376
    adr_of [-2] 60346
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] 60494
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] 60406
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont             
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] cont
    adr_of [-2] 60450

