Exercicio 1


Escreva a sub-rotina MENOR que recebe em R5 o endereço de início de um vetor de bytes (sem
sinal) e retorna:
• R6 -> menor elemento do vetor e
• R7 -> qual sua frequência (quantas vezes apareceu)




		MOV		#VETOR,R5
		CALL		#MENOR
		JMP		$

MENOR:		MOV.B 		@R5+,R6 ; pega o conteudo de R5 E BOTA EM R6 AVANÇANDO +1 ELEMENTO
		MOV.B		@R5+,R8 ; pega o conteudo de R5 E BOTA EM R8 AVANÇANDO +1 ELEMENTO
                MOV		#1,R7   ; FREQUENCIA

LOOP:		cmp.b		R6,R5   ; COMPARA O ELEMENTO NO VETOR
		jeq		IGUAL   ; CASO SEJA IGUAL
		jhs		MAIOR   ; CASO SEJA MAIOR

IGUAL:		INC		R7 ; SE FOR IGUAL ADICIONA MAIS 1 NA FREQUENCIA

MAIOR:		INC		R5 ; VAI PRO PROXIMO ELEMENTO
		DEC		R8 ; TIRA DO CONTADOR
		JNZ		LOOP
		RET

			.data
vetor:		.byte 8,"HENRIQUE"



;-------------------------------------------------------------------------------------------------------------------------------


#MENOR
Onde  R6 = menor elemento do vetor, R7 = qual sua frequência DO menor elemento, r8 = contador, R9 = qual letra no elemento

MAIN:

		MOV.W 	#VETOR, R5		;Faz copia do VETOR com meu nome para R5
		CALL  	#MENOR			;Chamando a subrotina MENOR
		JMP   	$			;TRAVA NESSA LINHA

MENOR:
		TST.B	R8			;CONFERIR SE R8 = 0, SE FOR, VAI DIRETO PRO FIM (jz = IF ZERO)
		JZ	#FIM

		MOV.B	@R5+,R8			;R8 = vai pegar todo tamanho do vetor
		MOV.B	@R5+,R6			;R6 = vai pegar todo tamanho do vetor E ir pro PROXIMO
		MOV.B	#1,R7			;Iniciando R7 como frequencia com 1
		JMP	#PROXIMO

LOOP:		
		MOV.B	@R5+,R9			;R9 = vai pegar todo tamanho do vetor

		CMP.B	R9,R6			;IF R6 < R9 ( Só ve isso dessa forma)
		JLO	#PROXIMO		;r6 é menor, então vai pro proximo LOOP
		MOB.V 	R9,R6			;CASO CONTRARIO PASSA O VALOR DE R9 PARA R6
		JEQ	#IGUAL			; igual


PROXIMO:	
		INC	R7
		DEC	R8			;É MENOR, TIRA 1 DO CONTADOR E VOLTA PRO LOOP (JNZ = IF NOT ZERO)
		JNZ	#LOOP


IGUAL:		
		INC 	R7
		JNZ	#LOOP


FIM:
		RET	














......................................................................................................................................



;R5 = VETOR, R6 = MENOR, R7 = frequencia, R8 = contador, R9 = ATUAL LETRA

main:
			mov.w	#vetor, R5
			call	#MENOR
			jmp		$

MENOR:
			clr		R7
			mov.b	@R5+,R8
			mov.b	@R5+,R6

LOOP:
			cmp.b	@R5+,R6
			tst.b	R8
			jz		FIM

			jlo		R6MENOR

			jeq		IGUAL

R6MENOR:
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
