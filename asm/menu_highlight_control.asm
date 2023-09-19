;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

highLightSelectedContorol:
		ld	a, (active_control)
		add	a, a
		add	a, 15
		ld	d, a
		ld	e, 11
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	(hl), 47h ; 'G'
		ld	e, l
		ld	d, h
		inc	e
		ld	bc, 13
		ldir
		ret
