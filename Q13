;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;Alg romanos, onde M = 100, D = 500, C = 100, L = 50, X = 10, I = 1 - MMXIX
;R6 - os algorismo do vetor, R7 - caracter atual, R8 = acumulador, R5 = retorno

main:
			mov		#NUM_ROM,R6				;R6 aponta para o início do número
			call	#ROM_ARAB				;chamar sub-rotina
			jmp		$						;travar execução

ROM_ARAB:
			mov		#0,R8					;inicia o acumulador

LOOP:
			mov.b	@R6+,R7
			cmp.b	#0,R7
			jz		FIM

CASE_M:
			cmp.b 	#'M',R7					;Compara pra ver se tem o algorismo no R7
			jne		CASE_D					;Caso não tenha o M, vai pra subrotina CASE_D e ve se tem D
			add		#1000,R8				;Caso tenha o M, adiciona o valor 1000 no R8 ou seja acumulador
			jmp		LOOP					;olta pro LOOP repetindo o mesmo processo até finalizar

CASE_D:
			cmp.b	#'D', R7
			jne		CASE_C
			add		#500,R8
			jmp		LOOP

CASE_C:
			cmp.b	#'C',R7
			jne		CASE_L
			add		#100,R8
			jmp		LOOP

CASE_L:
			cmp.b	#'L',R7
			jne		CASE_X
			add		#50,R8
			jmp		LOOP

CASE_X:
			cmp.b	#'X',R7
			jne		CASE_I
			add		#10,R8
			jmp		LOOP

CASE_I:		cmp.b	#'I',R7
			jne		FIM
			add		#1,R8
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
; Especificar o número romano, terminando com ZERO.
NUM_ROM: 	.byte "MMXIX",0 ;2019
