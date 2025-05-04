/*
 * main.c
 *
 *  Created on: 4 May 2025
 *      Author: Admin
 */

#define byte unsigned char
#define word unsigned short
#define dword int

void delay(word i) {
    word j = 0;
    while (j < i) {
        j++;
    }
}

void main(){
    #define RAM_START 0xD000
    #define RAM_END   0xFFF0
    #define RAM_SIZE  (RAM_END - RAM_START + 1)

    volatile byte * const RAM = (volatile byte *)RAM_START;

    RAM[0] = 0xAA; 
    RAM[1] = 0xBB;
    

}
