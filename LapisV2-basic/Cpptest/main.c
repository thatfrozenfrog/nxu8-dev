/*
 * main.cpp
 *
 *  Created on: 4 May 2025
 *      Author: Admin
 */
#define byte unsigned char

void main(){

	(*((byte*)(0xD200))) = 0x69;
}

