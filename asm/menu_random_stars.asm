;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

init_random_stars:
		ld	hl, FNT_SmallHLIne
		ld	(FontPTR+1), hl

		ld	b, 22 		;22 lines with row

StarLineLoop:
		push	bc
		ld	a, 3 		;3 sars in each row

starInLineLoop:
		ex	af, af'
		call	RND
		and	31
		ld	e, a
		ld	d, b
		dec	d
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		push	bc
		ld	bc, ATTR_TABLE_COPY
		add	hl, bc
		pop	bc
		ld	a, (hl)
		or	a
		jr	nz, skip_star_place_used
		;color
		call	RND
		and	7
		or	42h ; 'B'
		ld	c, a
		;char - dot in font
		ld	a, 3		; one dot (START)
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y

skip_star_place_used:
		ex	af, af'
		dec	a
		jr	nz, starInLineLoop
		pop	bc
		djnz	StarLineLoop
		ret

