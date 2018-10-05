#include "lcd_driver.h"
#include <util/delay.h>

int main()
{
	lcd_init(); 
	lcd_puts("hello world");
	lcd_goto(2,3);
	lcd_puts("hello world");

	while (1) {
	}
}
