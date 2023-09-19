;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

update_HighVoltage:
		ld	hl, xyHighVoltage
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	hl, HighVoltageSpriteBuf
		ld	b, d
		ld	c, e
		call	RND
		and	3
		add	a, sHighVoltage1  ; 1ch sprite HighVoltage1..4
		call	Sprite16x16

		ld	bc, 48
		add	hl, bc
		ld	c, a
		ld	a, e
		add	a, 8
		ld	e, a
		ld	a, c
		inc	a
		ld	b, d
		ld	c, e
		call	Sprite16x16

		call	RND
		and	7
		or	40h ; '@'
		ld	c, a
		call	fillAttr_2x2
		ld	b, a
		ld	a, e
		sub	8
		ld	e, a
		jp	fillAttr_2x2

xyHighVoltage:	dw 0
		db 0FFh
