ENTRY(0x0)

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*       STACK SETTING                                 */
/*;++++++++++++++++++++++++++++++++++++++++++++++++++++*/
SFRORIGIN = 0x8000F000;                 /* SFR Start address                 */
RAMENDNEXT = 0x8000F000;                /* RAM End address+1 & Stack Pointer */
PROVIDE(STACKSIZE = 0x00000400);        /* Stack Size                        */
STACKORIGIN = RAMENDNEXT - STACKSIZE;   /* Stack Start address               */
PROVIDE(_$$SP = RAMENDNEXT);            /* Stack Pointer                     */

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*       DYNAMIC SETTING                               */
/*;++++++++++++++++++++++++++++++++++++++++++++++++++++*/
DYNAMIC = __data_end + 0x2;             /* dynamic start address             */
DYNAMICSIZE = STACKORIGIN - DYNAMIC;    /* dynamic_far or near size          */
PROVIDE(_$$dynamic_far = DYNAMIC);      /* for xgetmem_f                     */
PROVIDE(_$$dynamic_near = DYNAMIC);     /* for xgetmem_n                     */
PROVIDE(_$$dynamic = DYNAMICSIZE);

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*       ROMWINDOW SETTING                             */
/*;++++++++++++++++++++++++++++++++++++++++++++++++++++*/
ROMWINDOWSIZE = 0xD000;

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*       MEMORY RANGE                                  */
/*;++++++++++++++++++++++++++++++++++++++++++++++++++++*/
MEMORY
{
  ROM         : ORIGIN = 0x00000000,  LENGTH = 0x0005E000  /* 0100-1F0FFF */ /* Corrected comment to reflect LENGTH better */
  DATA        : ORIGIN = 0x80000000 + ROMWINDOWSIZE,  LENGTH = 0xF000 - ROMWINDOWSIZE  /* D000-EFFF */
  STACK       : ORIGIN = STACKORIGIN, LENGTH = STACKSIZE   /* EC00-EFFF */
  SFR         : ORIGIN = SFRORIGIN,   LENGTH = 0x00001000  /* F000-FFFF */
}


/*+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*       SECTION Definition                            */
/*;++++++++++++++++++++++++++++++++++++++++++++++++++++*/
SECTIONS {
  .rom ALIGN(2):
  {
    KEEP(*(.text.isr_vector))
    . = 0x8;
    KEEP(*(.text0.vector.*))
    PROVIDE_HIDDEN (. = ALIGN(2));
    KEEP(*(.rodata0))
    KEEP(*(.rodata0.*))
    __rodata0_end = (.);
    ASSERT(!(__rodata0_end > (ROMWINDOWSIZE)), "Error : .rodata0 exceeds the ROMWINDOW");

    /* ADDED SECTION FOR YOUR NVDATA SEGMENT */
    KEEP(*(SEGMENT($$FNVDATAstartup))) /* Place your specific segment */
    /* You could also try a more general rule if you have many 'nvdata' class segments: */
    /* KEEP(*(.nvdata)) */ /* This depends on how your assembler maps the 'nvdata' class */
    /* Ensure alignment if needed, e.g., PROVIDE_HIDDEN (. = ALIGN(2)); */

    KEEP(*(.text0))
    KEEP(*(.text0.*))
    __text0_end = (.);
    ASSERT(!(__text0_end > (0xFFFF)), "Error : .text0 exceeds 0xFFFF"); /* Note: 0xFFFF is 64KB, check if this is intended vs ROMWINDOWSIZE */
    KEEP(*(.text))
    KEEP(*(.text.*))
    KEEP(*(.rodata))  /* General read-only data */
    KEEP(*(.rodata.*))
    PROVIDE_HIDDEN(. = ALIGN(2));
  } > ROM  /* This entire .rom output section goes into the ROM memory region */

  .bss ALIGN(2):
  {
    KEEP(*(.bss0))
    KEEP(*(.bss0.*))
    KEEP(*(.bss))
    KEEP(*(.bss.*))
    PROVIDE_HIDDEN (. = ALIGN(2));
    __data_end = .;
  } > DATA

  .sfr :
  {
    DSR             =  ABSOLUTE(0xF000);
  } > SFR
}