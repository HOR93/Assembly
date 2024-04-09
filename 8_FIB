; maldito fibonacci, como é WORD então, 0 = 0(R5), 1 = 2(R5), 2=4(R5)
					0 = 0(R5), 0 = 2(R5), 1 = 4(R5), 8 = 6(R5)

main:

	mov	#seq2, R5
	call	#FIB
	jmp	$


FIB:	
	mov	#8, R6		; Numero do contador
LB1
	mov	0(R5),4(R5)
	add	2(R5),4(R5)
	INCD	R5
	dec	R6
	JNZ	LB1
	ret
	
LB2
	mov	2(R5),6(R5) 	;FIBONACCI passa o valor inicial para a proxima sequencia,
	add	4(R5),6(R5)	;depois soma o numero seguinte com a proxima sequencia
	INCD	R5
	dec	R6
	JNZ	LB2		;se o contador não for zero, volta pro LOOP
	ret			;se for encerra




;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET

	    .data
seq	    .word 0,1
seq2        .word 0,1,0
