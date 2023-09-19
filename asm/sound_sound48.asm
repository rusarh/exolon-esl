;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; =============== S U B	R O U T	I N E =======================================

sound48:
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		ret	nz

loc_7C2B:
		ld	a, r
		and	11111000b
		out	(0FEh),	a
		ld	e, b
		inc	e


loc_7C33:
		dec	e
		jr	nz, loc_7C33
		xor	a
		out	(0FEh),	a
		djnz	loc_7C2B
		ret

; =============== S U B	R O U T	I N E =======================================


sndBox48:
		push	af
		push	bc
		push	de
		push	hl
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, loc_7C5A
		xor	a
		ld	de, 1030h

loc_7C4A:
		ld	h, 0Ah

loc_7C4C:
		xor	10h
		out	(0FEh),	a
		ld	b, e

loc_7C51:
		djnz	$
		dec	h
		jr	nz, loc_7C4C
		inc	e
		dec	d
		jr	nz, loc_7C4A

loc_7C5A:
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
