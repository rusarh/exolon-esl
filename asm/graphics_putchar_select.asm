;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)


selectPutCHR:
		push	bc
		push	hl
		ld	bc, putCharTable
		call	get_hl_a_BC
		ld	(putCharxMSGAddr+1), hl
		ld	(putChar_xMSG_E4+1), hl
		ld	(putChar_xMSG_E5+1), hl
		ld	(putChar_xMSG_E7+1), hl
		pop	hl
		pop	bc
		ret

putCharTable:	dw PurCharAndSetVarsChkX
		dw putChar
		dw putCharXOR
		dw PutCharXorRemoveObject_2Boom
		dw PutCharXorRemoveObject_noBoom		;PutCharXorNoWalk
