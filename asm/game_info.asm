;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

show_3digit:
		push	bc
		push	hl

		ld	hl, FNT_MAIN
		ld	(FontPTR+1), hl

		ld	b, 100
		call	put_digit_div
		ld	b, 10
		call	put_digit_div
		ld	b, 1
		call	put_digit_div
		pop	hl
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


put_digit_div:
		ld	l, 0

div_dig_loop:
		sub	b
		jr	c, loc_8E3F
		inc	l
		jr	div_dig_loop

loc_8E3F:
		add	a, b
		push	af
		ld	a, b
		cp	100
		jr	z, loc_8E4D
		ld	a, l
		add	a, '0'
		call	putChar
		inc	e

loc_8E4D:
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


osd_AMMO:

		ld	a, (_AMMO)
		ld	de, 1701h
		ld	c, 47h ; 'G'
		jp	show_3digit

; ---------------------------------------------------------------------------

_AMMO:		db 63h


; =============== S U B	R O U T	I N E =======================================


osd_GRENADES:
		ld	a, (_GRENADES)
		ld	de, 1708h
		ld	c, 43h ; 'C'
		jp	show_3digit

; ---------------------------------------------------------------------------

_GRENADES:	db 0Ah


; =============== S U B	R O U T	I N E =======================================


osd_LIVES:
		ld	a, (_LIVES)
		add	a, '0'
		ld	de, 1717h
		ld	c, 46h
		ld	hl, FNT_MAIN
		ld	(FontPTR+1), hl
		jp	putChar
; ---------------------------------------------------------------------------
_LIVES:		db 9

; =============== S U B	R O U T	I N E =======================================

osd_ZONE:

		ld	a, (_ZONE)
		ld	de, 171Ch
		ld	c, 46h
		jp	show_A
