;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

addPoints:
		push	af
		push	bc
		push	de
		push	hl
		ld	c, 0
		ld	hl,  points+5
		ld	b, 6

loc_AD5E:
		ld	a, (de)
		add	a, (hl)
		sub	'0'
		add	a, c
		cp	3Ah ; ':'
		ld	c, 1
		jr	c, loc_AD6D
		sub	0Ah
		jr	loc_AD6E
; ---------------------------------------------------------------------------

loc_AD6D:
		dec	c

loc_AD6E:
		ld	(hl), a
		dec	hl
		dec	de
		djnz	loc_AD5E
		xor	a
		ld	(overPlayerFlag+1), a
		ld	hl, xMSG_Points
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function addPoints

; ---------------------------------------------------------------------------
xMSG_Points:	db _E0_Attribute?
		db 45h
		db _E6_DW_FONT
		dw FNT_MAIN
		db _DF_DW_xy
		_XY_ 23, 14
points:		db '000000'
		db _FF_EndMSG
;
;
;

a000025:	db '000025'
a000050:	db '000050'
a000100:	db '000100'
a000125:	db '000125'
a000150:	db '000150'
a000200:	db '000200'
a000250:	db '000250'
a000300:	db '000300'
a000350:	db '000350'
a001000:	db '001000'
