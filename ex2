Exerc 2

		


			MOV		#VETOR,R5
			CALL		#MAIOR16
			JMP		$

MAIOR16:		MOV.B		@R5+,R6
			MOV.B		@R5+,R8
			MOV		#1,R7

LOOP:			COMP.B		R5,R6		
			jeq		IGUAL   ; CASO SEJA IGUAL
			jlo		MENOR	; CASO SEJA MAIOR

IGUAL:			INC		R7


MENOR:			INC		R5
			DEC		R8
			JNZ		LOOP
			NOP
			RET

			.data
vetor:		.byte 8,"HENRIQUE"	



;.............................................................................................



#MAIOR16
Onde  R6 = MAIOR elemento do vetor, R7 = qual sua frequência DO menor elemento, r8 = contador, R9 = qual letra no elemento

MAIN:

		MOV.W 	#VETOR, R5		;Faz copia do VETOR com meu nome para R5
		CALL  	#MAIOR16		;Chamando a subrotina MENOR
		JMP   	$			;TRAVA NESSA LINHA

MAIOR16:
		TST.B	R8			;CONFERIR SE R8 = 0, SE FOR, VAI DIRETO PRO FIM (jz = IF ZERO)
		JZ	#FIM

		MOV.B	@R5+,R8			;R8 = vai pegar todo tamanho do vetor
		MOV.B	@R5+,R6			;R6 = vai pegar todo tamanho do vetor E ir pro PROXIMO
		MOV.B	#1,R7			;Iniciando R7 como frequencia com 1
		JMP	#PROXIMO

LOOP:		
		MOV.B	@R5+,R9			;R9 = vai pegar todo tamanho do vetor

		CMP.B	R6,R9			;IF R9 < R6 ( Só ve isso dessa forma)
		JHS	#PROXIMO		;r6 é menor, então vai pro proximo LOOP
		MOB.V 	R6,R9			;CASO CONTRARIO PASSA O VALOR DE R6 PARA R9
		JEQ	#IGUAL			; igual


PROXIMO:	
		INC	R7
		DEC	R8			;É MAIOR, TIRA 1 DO CONTADOR E VOLTA PRO LOOP (JNZ = IF NOT ZERO)
		JNZ	#LOOP


IGUAL:		
		INC 	R7
		JNZ	#LOOP


FIM:
		RET	



..........................................................................................................................


;R5 = VETOR, R6 = MAIOR16, R7 = frequencia, R8 = contador, R9 = ATUAL LETRA

main:
			mov.w	#vetor, R5
			call	#MAIOR16
			jmp		$

MAIOR16:
			clr		R7
			mov.b	@R5+,R8
			mov.b	@R5+,R6

LOOP:
			cmp.b	@R5+,R6
			tst.b	R8
			jz		FIM
			jhs		MAIORV
			jeq		IGUAL

MAIORV:
			dec		R8
			jmp		LOOP

IGUAL:
			inc		R7
			dec		R8
			jmp		LOOP

FIM:
			ret
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
vetor:		.byte	8, "Henrique"













;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;R5 = vetor, R6 = receber o MAIOR, R7 = Frequencia, R8 = contador, R9 = Registrador temporario

main:
			mov		#VETOR,R5
			mov		#0,R8
			mov		#0,R7


			mov.b	@R5,R8 					;Passando o endereço para o Contador
			incd	R5						;Passando o endereço para o Contador
			dec.b	R8

			call	#MAIOR16
			jmp		$
			nop


MAIOR16:
			incd	R5
			mov		@R5,R9

			dec.b	R8
			jz		FIM

			cmp		R9,R6
			jeq		IGUAL					;Iguais então aumenta a frequencia
			jhs		MAIOR16					;se R6 > R5 = R6
			mov		R9,R6  					;se R6 < R5 = R5
			clr		R7

IGUAL:
			inc		R7
			jmp		MAIOR16
			nop

FIM:
			ret

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
VETOR: 		.byte 11,0, "JOAQUIMJOSE",0








MAIOR8: 	CLR.B R10 		;Maior elemento provisório = Zero 
 		MOV.B @R5+,R6 		;R6 = tamanho e incrementa R5 

LOOP: 		CMP.B @R5,R10 		;Comparar: R10 - @R5 
 		JHS LB 			;Se R10 >= @R5, saltar para LB 
 		MOV.B @R5,R10 		;Senão, copiar novo maior para R10 

LB: 		INC.W R5 		;Avançar ponteiro 
 		DEC.B R6 		;Decrementar contador 
 		JNZ LOOP 		;Repetir se contador diferente de zero 
		RET 			;Retornar se contador igual a zero
