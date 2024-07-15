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
;monte e execute com o debug o programa PE5, listado abaixo. Note que o programa
;usa a instrução RLA R5 que desloca o conteúdo de R5 uma vez para a esquerda. A
;quantidade de rotações é dada por R6


PE4:		MOV		#1,R5		;copia 1 para R5
			MOV		#4, R6      ;copia 4 para R6

LOOP:		RLA		R5			;desloca o conteúdo de R5 uma vez para a esquerda
			DEC		R6			;decrementa R6
			JNZ		LOOP		; se for diferente de zero, começa o loop
			NOP					;nenhuma operação
			JMP		$			;trava no laço infinito
			NOP					;nenhuma operação
                                            

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
            
