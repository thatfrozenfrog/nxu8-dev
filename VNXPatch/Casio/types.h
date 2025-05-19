#define byte unsigned char
#define word unsigned short
#define deref(x) (*(volatile byte *)(x))
#define derefw(x) (*(volatile word *)(x))
//#define __far
//#define __near