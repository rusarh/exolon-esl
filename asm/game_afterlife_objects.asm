;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

add_AfterLifeObject:
;ESL DEBUG
; 		ret
;ESL DEBUG
		push	af
		push	hl
		ld	hl, str_AfterLifeObject

loc_9FA8:
		bit	7, (hl)
		jr	nz, loc_9FBA
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		inc	hl
		jr	nz, loc_9FA8
		dec	hl
		ld	(hl), 11	;0Bh
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e

loc_9FBA:
		pop	hl
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


move_AfterLifeObject:
		ld	iy, afterLifeSpriteBuf
		ld	hl, str_AfterLifeObject

loc_9FC4:
		ld	e, (hl)
		bit	7, e
		ret	nz
		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, loc_9FF6

		dec	(hl)
		ld	l, a
		ld	h, 0
		ld	bc, afterLifeObjectTab-1
		add	hl, bc
		ld	a, (hl)
		push	iy
		pop	hl
		ld	b, d
		ld	c, e
		call	Sprite16x16

		call	RND
		and	3
		add	a, 42h ; 'B'
		ld	c, a
		call	fillAttr_2x2

		call	RND
		and	1Fh
		inc	a
		ld	b, a
		call	sound48

loc_9FF6:
		ld	bc, 30h	; '0'
		add	iy, bc
		pop	hl
		inc	hl
		inc	hl
		inc	hl

		jr	loc_9FC4
; ---------------------------------------------------------------------------
afterLifeObjectTab:
		db sEMPTY		; 0
		db sCircle1_5		; 1
		db sCircle1_5		; 2
		db sCircle1_4		; 3
		db sCircle1_4		; 4
		db sCircle1_3		; 5
		db sCircle1_3		; 6
		db sCircle1_2		; 7
		db sCircle1_2		; 8
		db sCircle1_1		; 9
		db sCircle1_1		; 10

str_AfterLifeObject:
		ds 3*5
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_AfterLifeObject:
		ld	hl, str_AfterLifeObject
		ld	de, str_AfterLifeObject+1
		ld	bc, 3*5-1	;14
		ld	(hl), 0
		ldir
		ret
