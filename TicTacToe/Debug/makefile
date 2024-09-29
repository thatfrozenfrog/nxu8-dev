################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -f

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

-include ../makefile.defs

# Export environment variables
export DCL=E:/LAPIS/LEXIDE/Dcl
export INCLU8=E:/LAPIS/LEXIDE/Inc;E:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Inc/U16
export LIBU8=E:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Lib/U16
export PATH=E:/LAPIS/LEXIDE/Bin;E:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Bin;E:/LAPIS/LEXIDE/Utilities/Bin

# Add inputs and outputs from these tool invocations to the build variables 
OBJHEX += \
TicTacToe.HEX \

ABS += \
TicTacToe.abs \

MAP += \
TicTacToe.map \


# All Target
all: $(OBJHEX)

# Tool invocations
TicTacToe.HEX: $(ABS)
	@echo 'Building target: $@'
	@echo 'Invoking: Object converter'
	CnvOHU8 -H $(ABS) "TicTacToe.HEX";
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

TicTacToe.abs: $(OBJS)
	@echo 'Invoking: Linker'
	rlu8 -D -SD -NS -CC -ABW $(OBJS__QUOTED),"TicTacToe.abs",,"LU8100LW.LIB";
	@echo 'Finished building: $@'
	@echo ' '

TicTacToe.map: TicTacToe.abs $(OBJS)

# Other Targets
clean:
	-$(RM) "./TicTacToe.sc" "./main.prn" "./startup.prn" "./TicTacToe.abs" "./TicTacToeRB.hex" "./TicTacToeRA.hex" "./TicTacToeRA.log" "./main.asm" "./TicTacToe.HEX" "./main.obj" "./startup.obj" "./main.i" "./TicTacToe.map" 
	-@echo ' '

post-build:
	-@echo 'Run it'
	-cd.. && build.bat
	-@echo ' '

.PHONY: all clean dependents post-build

-include ../makefile.targets
