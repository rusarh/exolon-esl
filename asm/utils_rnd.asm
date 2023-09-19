;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;return A-random number
RND:
		push	hl
		push	de
		push	bc
		ld	hl, (rndSEED)
		ld	de, 7
		add	hl, de
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		add	hl, de
		ld	(rndSEED), hl
		xor	h
		pop	bc
		pop	de
		pop	hl
		ret

rndSEED:	dw 8EAAh
