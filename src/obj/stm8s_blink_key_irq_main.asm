;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module stm8s_blink_key_irq_main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _EXTI_PORTD_IRQHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int _EXTI_PORTD_IRQHandler ; int6
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	src/stm8s_blink_key_irq_main.c: 70: void EXTI_PORTD_IRQHandler(void) __interrupt(6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	src/stm8s_blink_key_irq_main.c: 76: UCOM_LED1_GPIO->ODR ^= (uint8_t)UCOM_LED1_PIN;
	bcpl	0x5005, #5
;	src/stm8s_blink_key_irq_main.c: 77: UCOM_KEY1_GPIO->CR2 &= (uint8_t)(~(UCOM_KEY1_PIN)); /* External interrupt disable */
	bres	0x5013, #3
;	src/stm8s_blink_key_irq_main.c: 79: }
	iret
;	src/stm8s_blink_key_irq_main.c: 93: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	src/stm8s_blink_key_irq_main.c: 99: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);    
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	src/stm8s_blink_key_irq_main.c: 101: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	ld	a, 0x50c6
	ld	0x50c6, a
;	src/stm8s_blink_key_irq_main.c: 118: EXTI->CR1 &= (uint8_t)~(0x03<<EXTI_SHIFT_PORT); /* PB5 : UCOM_KEY1_GPIO */
	ld	a, 0x50a0
	and	a, #0x3f
	ld	0x50a0, a
;	src/stm8s_blink_key_irq_main.c: 119: EXTI->CR1 |= (vbData<<EXTI_SHIFT_PORT); /* PORT B */
	bset	0x50a0, #7
;	src/stm8s_blink_key_irq_main.c: 129: UCOM_LED1_GPIO->ODR &= (uint8_t)(~(UCOM_LED1_PIN)); /* Output mode  Low level */
	bres	0x5005, #5
;	src/stm8s_blink_key_irq_main.c: 130: UCOM_LED1_GPIO->DDR |= (uint8_t)UCOM_LED1_PIN; /* Set Output mode */
	bset	0x5007, #5
;	src/stm8s_blink_key_irq_main.c: 131: UCOM_LED1_GPIO->CR1 |= (uint8_t)UCOM_LED1_PIN; /* Push-Pull */
	bset	0x5008, #5
;	src/stm8s_blink_key_irq_main.c: 133: UCOM_LED1_GPIO->CR2 |= (uint8_t)UCOM_LED1_PIN; /* 10MHz */
	bset	0x5009, #5
;	src/stm8s_blink_key_irq_main.c: 139: UCOM_KEY1_GPIO->DDR &= (uint8_t)(~(UCOM_KEY1_PIN)); /* Set Input mode */
	bres	0x5011, #3
;	src/stm8s_blink_key_irq_main.c: 140: UCOM_KEY1_GPIO->CR1 |= (uint8_t)UCOM_KEY1_PIN; /* Pull-up */
	bset	0x5012, #3
;	src/stm8s_blink_key_irq_main.c: 142: UCOM_KEY1_GPIO->CR2 |= (uint8_t)UCOM_KEY1_PIN; /* External interrupt enable */
	bset	0x5013, #3
;	src/stm8s_blink_key_irq_main.c: 146: UCOM_LED1_GPIO->ODR = UCOM_LED1_GPIO->ODR & ~UCOM_LED1_PIN; // led on...
	ld	a, 0x5005
	and	a, #0xdf
	ld	0x5005, a
;	src/stm8s_blink_key_irq_main.c: 151: enableInterrupts();
	rim
;	src/stm8s_blink_key_irq_main.c: 154: uint32_t vwDelay = 0;
	clrw	x
	clrw	y
;	src/stm8s_blink_key_irq_main.c: 155: do {
00106$:
;	src/stm8s_blink_key_irq_main.c: 156: if(vwDelay==0) 
	tnzw	x
	jrne	00102$
	tnzw	y
	jrne	00102$
;	src/stm8s_blink_key_irq_main.c: 158: vwDelay = 0x20000*5*20; // 10sec..
	clrw	x
	ldw	y, #0x00c8
00102$:
;	src/stm8s_blink_key_irq_main.c: 163: vwDelay--;
	subw	x, #0x0001
	jrnc	00141$
	decw	y
00141$:
;	src/stm8s_blink_key_irq_main.c: 164: if(((UCOM_KEY1_GPIO->CR2 & (uint8_t)UCOM_KEY1_PIN)==0) && ((UCOM_KEY1_GPIO->IDR & UCOM_KEY1_PIN)!=0)) // jittering 방지
	btjt	0x5013, #3, 00106$
	btjf	0x5010, #3, 00106$
;	src/stm8s_blink_key_irq_main.c: 166: UCOM_KEY1_GPIO->CR2 |= (uint8_t)UCOM_KEY1_PIN; /* External interrupt enable */
	bset	0x5013, #3
;	src/stm8s_blink_key_irq_main.c: 168: } while(1);
	jra	00106$
;	src/stm8s_blink_key_irq_main.c: 195: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
