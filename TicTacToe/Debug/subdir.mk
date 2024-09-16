################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../startup.asm 

C_SRCS += \
../main.c 

PRNS += \
./main.prn \
./startup.prn 

PRNS__QUOTED += \
"./main.prn" \
"./startup.prn" 

ASMS += \
./main.asm 

ASMS__QUOTED += \
"./main.asm" 

OBJS += \
./main.obj \
./startup.obj 

OBJS__QUOTED += \
"./main.obj" \
"./startup.obj" 

IS += \
./main.i 

IS__QUOTED += \
"./main.i" 


# Each subdirectory must supply rules for building sources it contributes
main.asm: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	ccu8 -SD -ABW -TML620906 -ML -far -Fa"./" -Om -Zs -Oa -W1 "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.i: main.asm

main.obj: ./main.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Assembler'
	rasu8 -CD -ABW -SD -DF -ML -O"./" -WRPEAST -PR"main.prn" -L -NS -NR -NPL -NPW "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.prn: main.obj

startup.obj: ../startup.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Assembler'
	rasu8 -CD -ABW -D -DF -ML -O"./" -WRPEAST -PR"startup.prn" -L -NS -NR -NPL -NPW "$<"
	@echo 'Finished building: $<'
	@echo ' '

startup.prn: startup.obj


