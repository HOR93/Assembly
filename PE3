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
;usa a subrotina “SUBROT” que soma 1 ao R5, duas vezes. O número de vezes em que a
;subrotina é chamada é ditado pelo valor em R6. Isto significa que R6 é o contador do laço (LOOP).

PE3:		CLR		R5			; Limpa qualquer valor do R5
			MOV     #4,R6		; copia o valor 4 para R6


LOOP: 		CALL	#SUBROT		;Inicia o LOOP chamando a SUBROTINA #subrot
			DEC		R6			;-1 DO R6, AGORA VAI PARA 3(antes era 4)
			JNZ		LOOP		; ve se é diferente de 0, então começa o loop
			NOP					; nenhuma operação
			JUMP	$			; travar a exec em um laço infinito
			NOP					; nenhuma operação

SUBROT:		ADD		#1,R5		; aqui acontece o que pede na questão, soma 1 no R5 duas vezes
			ADD		#1,R5		;
			RET					; RETORNA


                                            

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
            
