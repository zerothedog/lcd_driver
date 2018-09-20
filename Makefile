OBJCOPY=avr-objcopy
RM=rm -f
CC=avr-gcc

MCU=atmega328p
BIN_FORMAT=ihex
F_CPU=16000000UL
PROG=lcd_test
CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)

${PROG}.hex: ${PROG}
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom $< $@

${PROG}: ${PROG}.elf lcd_driver.elf
	$(CC) -mmcu=$(MCU) ${PROG}.elf lcd_driver.elf -o ${PROG}

${PROG}.elf: ${PROG}.c
	$(CC) $(CFLAGS) -c -o $@ $< 

lcd_driver.elf:	lcd_driver.c
	$(CC) $(CFLAGS) -c -o $@ $<
	



.PHONY: clean
clean:
	-$(RM) ${PROG}.elf ${PROG}.hex


