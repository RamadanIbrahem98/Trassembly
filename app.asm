$NOMOD51	 ;to suppress the pre-defined addresses by keil
$include (C8051F020.INC)		; to declare the device peripherals	with it's addresses
ORG 0H					   ; to start writing the code from the base 0


;diable the watch dog
MOV WDTCN,#11011110B ;0DEH
MOV WDTCN,#10101101B ;0ADH

; config of clock
MOV OSCICN , #14H ; 2MH clock
;config cross bar
MOV XBR0 , #00H
MOV XBR1 , #00H
MOV XBR2 , #040H  ; Cross bar enabled , weak Pull-up enabled 

;config,setup
MOV P0MDOUT, #00h
MOV P2MDOUT, #01h
MOV P1MDOUT, #0FFh

;loop

START: 	MOV R4,#10
		MOV DPTR, #400h	

COUNT:	CLR A
		MOVC A,@A+DPTR
		MOV P1,A
		ACALL DELAY
		INC DPTR

SWITCH: MOV P2,P0
		AJMP CONT

MAIN:
	AJMP SWITCH
	CONT:
		DJNZ R4, COUNT
		AJMP START
		AJMP MAIN

DELAY :
	MOV R2,#5
	LOOP3:MOV R1,#200
	LOOP2:MOV R0,#198
	LOOP1:DJNZ R0,LOOP1
	DJNZ R1,LOOP2
	DJNZ R2,LOOP3
	RET

ORG 400H
DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH

END