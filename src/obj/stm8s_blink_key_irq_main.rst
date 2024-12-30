                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_blink_key_irq_main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _EXTI_PORTD_IRQHandler
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; Stack segment in internal ram
                                     23 ;--------------------------------------------------------
                                     24 	.area SSEG
      000001                         25 __start__stack:
      000001                         26 	.ds	1
                                     27 
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; interrupt vector
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
      008000                         45 __interrupt_vect:
      008000 82 00 80 27             46 	int s_GSINIT ; reset
      008004 82 00 00 00             47 	int 0x000000 ; trap
      008008 82 00 00 00             48 	int 0x000000 ; int0
      00800C 82 00 00 00             49 	int 0x000000 ; int1
      008010 82 00 00 00             50 	int 0x000000 ; int2
      008014 82 00 00 00             51 	int 0x000000 ; int3
      008018 82 00 00 00             52 	int 0x000000 ; int4
      00801C 82 00 00 00             53 	int 0x000000 ; int5
      008020 82 00 80 4D             54 	int _EXTI_PORTD_IRQHandler ; int6
                                     55 ;--------------------------------------------------------
                                     56 ; global & static initialisations
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area GSINIT
                                     60 	.area GSFINAL
                                     61 	.area GSINIT
      008027 CD 80 BC         [ 4]   62 	call	___sdcc_external_startup
      00802A 4D               [ 1]   63 	tnz	a
      00802B 27 03            [ 1]   64 	jreq	__sdcc_init_data
      00802D CC 80 24         [ 2]   65 	jp	__sdcc_program_startup
      008030                         66 __sdcc_init_data:
                                     67 ; stm8_genXINIT() start
      008030 AE 00 00         [ 2]   68 	ldw x, #l_DATA
      008033 27 07            [ 1]   69 	jreq	00002$
      008035                         70 00001$:
      008035 72 4F 00 00      [ 1]   71 	clr (s_DATA - 1, x)
      008039 5A               [ 2]   72 	decw x
      00803A 26 F9            [ 1]   73 	jrne	00001$
      00803C                         74 00002$:
      00803C AE 00 00         [ 2]   75 	ldw	x, #l_INITIALIZER
      00803F 27 09            [ 1]   76 	jreq	00004$
      008041                         77 00003$:
      008041 D6 80 4C         [ 1]   78 	ld	a, (s_INITIALIZER - 1, x)
      008044 D7 00 00         [ 1]   79 	ld	(s_INITIALIZED - 1, x), a
      008047 5A               [ 2]   80 	decw	x
      008048 26 F7            [ 1]   81 	jrne	00003$
      00804A                         82 00004$:
                                     83 ; stm8_genXINIT() end
                                     84 	.area GSFINAL
      00804A CC 80 24         [ 2]   85 	jp	__sdcc_program_startup
                                     86 ;--------------------------------------------------------
                                     87 ; Home
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area HOME
      008024                         91 __sdcc_program_startup:
      008024 CC 80 56         [ 2]   92 	jp	_main
                                     93 ;	return from main will return to caller
                                     94 ;--------------------------------------------------------
                                     95 ; code
                                     96 ;--------------------------------------------------------
                                     97 	.area CODE
                                     98 ;	src/stm8s_blink_key_irq_main.c: 70: void EXTI_PORTD_IRQHandler(void) __interrupt(6)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTD_IRQHandler
                                    101 ;	-----------------------------------------
      00804D                        102 _EXTI_PORTD_IRQHandler:
                                    103 ;	src/stm8s_blink_key_irq_main.c: 76: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
      00804D 90 1A 50 05      [ 1]  104 	bcpl	0x5005, #5
                                    105 ;	src/stm8s_blink_key_irq_main.c: 77: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
      008051 72 17 50 13      [ 1]  106 	bres	0x5013, #3
                                    107 ;	src/stm8s_blink_key_irq_main.c: 79: }
      008055 80               [11]  108 	iret
                                    109 ;	src/stm8s_blink_key_irq_main.c: 93: void main(void)
                                    110 ;	-----------------------------------------
                                    111 ;	 function main
                                    112 ;	-----------------------------------------
      008056                        113 _main:
                                    114 ;	src/stm8s_blink_key_irq_main.c: 99: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
      008056 C6 50 C6         [ 1]  115 	ld	a, 0x50c6
      008059 A4 E7            [ 1]  116 	and	a, #0xe7
      00805B C7 50 C6         [ 1]  117 	ld	0x50c6, a
                                    118 ;	src/stm8s_blink_key_irq_main.c: 101: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      00805E C6 50 C6         [ 1]  119 	ld	a, 0x50c6
      008061 C7 50 C6         [ 1]  120 	ld	0x50c6, a
                                    121 ;	src/stm8s_blink_key_irq_main.c: 118: EXTI->CR1 &= (uint8_t)~(0x03<<EXTI_SHIFT_PORT); /* PB5 : UCOM_KEY1_GPIO */
      008064 C6 50 A0         [ 1]  122 	ld	a, 0x50a0
      008067 A4 3F            [ 1]  123 	and	a, #0x3f
      008069 C7 50 A0         [ 1]  124 	ld	0x50a0, a
                                    125 ;	src/stm8s_blink_key_irq_main.c: 119: EXTI->CR1 |= (vbData<<EXTI_SHIFT_PORT); /* PORT B */
      00806C 72 1E 50 A0      [ 1]  126 	bset	0x50a0, #7
                                    127 ;	src/stm8s_blink_key_irq_main.c: 129: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
      008070 72 1B 50 05      [ 1]  128 	bres	0x5005, #5
                                    129 ;	src/stm8s_blink_key_irq_main.c: 130: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
      008074 72 1A 50 07      [ 1]  130 	bset	0x5007, #5
                                    131 ;	src/stm8s_blink_key_irq_main.c: 131: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
      008078 72 1A 50 08      [ 1]  132 	bset	0x5008, #5
                                    133 ;	src/stm8s_blink_key_irq_main.c: 133: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
      00807C 72 1A 50 09      [ 1]  134 	bset	0x5009, #5
                                    135 ;	src/stm8s_blink_key_irq_main.c: 139: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
      008080 72 17 50 11      [ 1]  136 	bres	0x5011, #3
                                    137 ;	src/stm8s_blink_key_irq_main.c: 140: UCOM_KEY1_GPIO->CR1 |= (uint8_t)UCOM_KEY1_PIN; /* Pull-up */
      008084 72 16 50 12      [ 1]  138 	bset	0x5012, #3
                                    139 ;	src/stm8s_blink_key_irq_main.c: 142: UCOM_KEY1_GPIO->CR2 |= (uint8_t)UCOM_KEY1_PIN; /* External interrupt enable */
      008088 72 16 50 13      [ 1]  140 	bset	0x5013, #3
                                    141 ;	src/stm8s_blink_key_irq_main.c: 146: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN; // led on...
      00808C C6 50 05         [ 1]  142 	ld	a, 0x5005
      00808F A4 DF            [ 1]  143 	and	a, #0xdf
      008091 C7 50 05         [ 1]  144 	ld	0x5005, a
                                    145 ;	src/stm8s_blink_key_irq_main.c: 151: enableInterrupts();
      008094 9A               [ 1]  146 	rim
                                    147 ;	src/stm8s_blink_key_irq_main.c: 154: uint32_t vwDelay = 0;
      008095 5F               [ 1]  148 	clrw	x
      008096 90 5F            [ 1]  149 	clrw	y
                                    150 ;	src/stm8s_blink_key_irq_main.c: 155: do {
      008098                        151 00106$:
                                    152 ;	src/stm8s_blink_key_irq_main.c: 156: if(vwDelay==0) 
      008098 5D               [ 2]  153 	tnzw	x
      008099 26 09            [ 1]  154 	jrne	00102$
      00809B 90 5D            [ 2]  155 	tnzw	y
      00809D 26 05            [ 1]  156 	jrne	00102$
                                    157 ;	src/stm8s_blink_key_irq_main.c: 158: vwDelay = 0x20000*5*20; // 10sec..
      00809F 5F               [ 1]  158 	clrw	x
      0080A0 90 AE 00 C8      [ 2]  159 	ldw	y, #0x00c8
      0080A4                        160 00102$:
                                    161 ;	src/stm8s_blink_key_irq_main.c: 163: vwDelay--;
      0080A4 1D 00 01         [ 2]  162 	subw	x, #0x0001
      0080A7 24 02            [ 1]  163 	jrnc	00141$
      0080A9 90 5A            [ 2]  164 	decw	y
      0080AB                        165 00141$:
                                    166 ;	src/stm8s_blink_key_irq_main.c: 164: if(((UCOM_KEY1_GPIO->CR2 & (uint8_t)UCOM_KEY1_PIN)==0) && ((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)!=0)) // jittering 방지
      0080AB 72 06 50 13 E8   [ 2]  167 	btjt	0x5013, #3, 00106$
      0080B0 72 07 50 10 E3   [ 2]  168 	btjf	0x5010, #3, 00106$
                                    169 ;	src/stm8s_blink_key_irq_main.c: 166: UCOM_KEY1_GPIO->CR2 |= (uint8_t)UCOM_KEY1_PIN; /* External interrupt enable */
      0080B5 72 16 50 13      [ 1]  170 	bset	0x5013, #3
                                    171 ;	src/stm8s_blink_key_irq_main.c: 168: } while(1);
      0080B9 20 DD            [ 2]  172 	jra	00106$
                                    173 ;	src/stm8s_blink_key_irq_main.c: 195: }
      0080BB 81               [ 4]  174 	ret
                                    175 	.area CODE
                                    176 	.area CONST
                                    177 	.area INITIALIZER
                                    178 	.area CABS (ABS)
