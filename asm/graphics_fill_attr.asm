;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

fillAttr_3x4:
		push	af
		push	bc
		push	de
		push	hl
		ld	l, 32-3		; 1Dh
		ld	h, 0
		ld	(next_row_add+1), hl
		ld	a, 3
		ld	(x_size1+1), a
		ld	a, 4
		ld	(y_size2+1), a
		jp	fillAttr_code

fillAttr_1x1:
		push	af
		push	bc
		push	de
		push	hl
		ld	l, 32-1 	;1Fh
		ld	h, 0
		ld	(next_row_add+1), hl
		ld	a, 1
		ld	(x_size1+1), a
		ld	a, 1
		ld	(y_size2+1), a
		jp	fillAttr_code

fillAttr_2x2:
		push	af
		push	bc
		push	de
		push	hl
		ld	l, 32-2 	;1Eh
		ld	h, 0
		ld	(next_row_add+1), hl
		ld	a, 2
		ld	(x_size1+1), a
		ld	a, 2
		ld	(y_size2+1), a
		jp	fillAttr_code


fillAttr_code:

		call	getATTR_TABLE_COPY_for_XY ; d-y	(0..191) ,e-x (0..127)
					; ret
					; hl-AttrTableCopy
		ld	a, c
		push	hl
		ld	bc, -0x600 	; 0x5E00(AttrTableCopy) -> 0x5800 (AttrTable)
		add	hl, bc
		ld	c, a
		push	hl



		ld	a, e
		and	3

next_row_add:
		ld	hl, 1Eh

x_size1:
		ld	a, 2
		jr	z, loc_7CBE
		dec	hl
		inc	a

loc_7CBE:
		ld	(x_size2+1), a
		ld	(next_row_add_2+1), hl
;

		ld	a, d
		and	7

y_size2:
		ld	a, 2
		jr	z, loc_7CCC
		inc	a

loc_7CCC:
		pop	hl 		;AttrTable
		pop	de 		;AttrTableCopy

fillAttrLoop:
		ex	af, af'

x_size2:
		ld	b, 2

fillAttrRowLoop:
		ld	a, (de)
		or	a
		jr	nz, noFill
		ld	(hl), c

noFill:
		inc	hl
		inc	de
		djnz	fillAttrRowLoop
		ld	a, c

next_row_add_2:
		ld	bc, 1Eh
		add	hl, bc
		ex	de, hl
		add	hl, bc
		ex	de, hl
		ld	c, a
		ex	af, af'
		dec	a
		jr	nz, fillAttrLoop
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
