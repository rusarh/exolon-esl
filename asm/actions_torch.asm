;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

update_Torch:
		ld	hl, FONT_ZONE_00
		ld	(FontPTR+1), hl

		ld	a, (torchPhase)
		inc	a
		cp	3
		jr	nz, loc_8F63
		xor	a

loc_8F63:
		ld	(torchPhase), a

		add	a, a
		add	a, 15h		; chars in FONT_ZONE_00 - FireDown (15,16)(17,18)(19,20)

		ld	hl, xyTorchs	; 5

loop_FireUpdate:
		bit	7, (hl)
		ret	nz

		ex	af, af'
		call	RND
		and	7
		or	42h
		ld	c, a
		ex	af, af'

		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	d
		inc	hl
		call	putChar
		inc	d
		inc	a
		call	putChar
		dec	a
		jr	loop_FireUpdate

; ---------------------------------------------------------------------------

xyTorchs:	ds 	5*2
; 		str_XY <0>
		db 0FFh

torchPhase:	db 0

