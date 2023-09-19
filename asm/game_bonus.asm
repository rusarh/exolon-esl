;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

add_A_bonus_and_snd:
		push	hl
		push	de
		call	snd_add_extra_point
		ld	e, a
		ld	d, 0
		ld	hl, (addBonusCount)
		add	hl, de
		ld	(addBonusCount), hl
		pop	de
		pop	hl
		ret


; =============== S U B	R O U T	I N E =======================================


updateBONUS:
		ld	hl, (addBonusCount)
		ld	a, l
		or	h
		ret	z

		dec	hl
		ld	(addBonusCount), hl

		ld	de,  a000025+5
		call	addPoints
		ld	b, 40
		jp	sound48

; ---------------------------------------------------------------------------
addBonusCount:	dw 0
