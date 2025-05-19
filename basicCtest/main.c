/*
 * main.c
 *
 *  Modified on: 5 May 2025
 *      Author: Admin
*/

#define byte unsigned char
#define word unsigned short
#define RAM_START 0xD000
#define RAM_END   0xFFF0
#define __far
#define RAM_SIZE  (RAM_END - RAM_START + 1)
 
extern void studfunc(byte a, byte b, word* dest);


#pragma Segcode "maincode"
#pragma Segcode 0x3:0x1000

void main(void){

    volatile byte * RAM = (volatile byte *)RAM_START;
    word result;
    byte j = 0x00;
    word i = 0xF800;
    out:
    i = 0xF800;


    while (1){

        *((byte *)i) = j;
        i++;
        j++;
        if (i == 0xFFFF) {
            goto out;
        }

		studfunc(0x01, 0x02, &result);
    }
 }
