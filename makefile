# makefile 
# yooaroma : 20241224
# https://www.st.com/en/microcontrollers-microprocessors/stm8s103f3.html
# https://www.st.com/resource/en/datasheet/stm8s103f3.pdf
# https://www.st.com/resource/en/reference_manual/rm0016-stm8s-series-and-stm8af-series-8bit-microcontrollers-stmicroelectronics.pdf
# https://github.com/yooaroma/stm8blue_blink_key_irq


CC = sdcc
PRJ = stm8s_blink_key_irq
FLASH_SIZE = 8192
PRJ_MCU = STM8S103
# stm8s103f3p6 : stm8s103?3
PRJ_MCU_FLASH = stm8s103f3
# PRJ_MCU_FLASH = stm8s105?6
# PRJ_MCU_FLASHX = stm8s105x6

#do not edit
TOP_DIR = .
TOP_SRC = ./src
OBJ_DIR = ./src/obj
EXE_DIR = ./src/exe

SRC = $(PRJ)_main.c
#SRC += stm8s_gpio.c
#SRC += stm8s_tim1.c
#SRC += stm8s_tim2.c
#SRC += stm8s_tim4.c
#SRC += stm8s_clk.c
#SRC += tm1628.c
#SRC += vfd.c

VPATH = $(TOP_DIR)/lib/src
# VPATH += $(TOP_DIR)/mlib

OBJS = $(patsubst %.c,$(OBJ_DIR)/%.rel,$(SRC))

all: $(OBJS)
	$(CC) -mstm8 $(OBJS) -o $(EXE_DIR)/$(PRJ).ihx
	packihx $(EXE_DIR)/$(PRJ).ihx > $(EXE_DIR)/$(PRJ).hex
#	makebin -s $(FLASH_SIZE) $(PRJ).ihx $(PRJ).bin

$(OBJ_DIR)/%.rel: $(TOP_SRC)/%.c
	$(CC) -c -mstm8 -D$(PRJ_MCU) $< -I. -I$(TOP_DIR)/lib/inc -o $@
# $(CC) -c -mstm8 -D$(PRJ_MCU) $< -I. -I$(TOP_DIR)/lib/inc -I$(TOP_DIR)/mlib -o $@
#	$(CC) -c -mstm8 -D$(PRJ_MCU) -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -Iusr/inc -o $@
#	$(CC) -c -mstm8 -D_SDCC_ -D$(PRJ_MCU) -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -Iusr/inc -o $@

clean:
	rm -f *.map *.rel *.ihx *.o *.sym *.lk *.lst *.rst *.cdb *.bin *.asm *.hex $(OBJ_DIR)/*.*

cleanall:
	rm -f *.map *.rel *.ihx *.o *.sym *.lk *.lst *.rst *.cdb *.bin *.asm *.hex $(OBJ_DIR)/*.* $(EXE_DIR)/*.* 

flash:
	stm8flash.exe -c stlinkv2 -p $(PRJ_MCU_FLASH) -s flash -w $(EXE_DIR)/$(PRJ).ihx
#	stm8flash -c <stlink|stlinkv2|espstlink> -p <partname> [-s flash|eeprom|0x8000] [-r|-w|-v] <filename>
