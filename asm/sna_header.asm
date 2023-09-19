;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

	org 	0x4000-27
	db 	0x3f
	dw 	0,0,0,0
	dw 	0,0,0,0,0
	db 	0
	db 	0
	dw 	0,_stack
	db 	1
	db 	3
	.assert	$==0x4000

	;sna header
	;    0        1      byte   I
	;    1        8      word   HL',DE',BC',AF'
	;    9        10     word   HL,DE,BC,IY,IX
	;    19       1      byte   Interrupt (bit 2 contains IFF2, 1=EI/0=DI)
	;    20       1      byte   R
	;    21       4      words  AF,SP
	;    25       1      byte   IntMode (0=IM0/1=IM1/2=IM2)
	;    26       1      byte   BorderColor (0..7, not used by Spectrum 1.7)
	;    27       49152  bytes  RAM dump 16384..65535
