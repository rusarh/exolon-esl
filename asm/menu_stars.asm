;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

starsAnimationStep:
		push	af
		push	bc
		push	de
		push	hl
		push	iy
		ld	iy, clr_SpriteBuffers
		ld	hl, StarsData?

nextStar:
		ld	e, (hl)		; X?
		bit	7, e
		jr	z, doStar
		pop	iy
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; ---------------------------------------------------------------------------

doStar:
		push	hl
		inc	hl		; Y
		ld	d, (hl)
		inc	hl
		ld	a, (hl)		; sprPhase?
		or	a
		jr	nz, noNewPos
		call	RND
		and	1Eh
		ld	e, a
		call	RND
		and	1Fh
		cp	22
		jr	nc, skipGeneration
		ld	d, a
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
;
		ld	a, (hl)
		inc	hl
		or	(hl)
		ld	bc, 32
		add	hl, bc
		or	(hl)
		dec	hl
		or	(hl)
		jr	nz, skipGeneration
;
		pop	hl
		push	hl
		ld	a, e
		add	a, a
		add	a, a
		ld	(hl), a
		inc	hl
		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		ld	(hl), a
		inc	hl
		ld	(hl), 16	; Idx in Idx2SprTable
		jr	skipGeneration
; ---------------------------------------------------------------------------

noNewPos:
		dec	(hl)
		ld	l, a
		ld	h, 0
		ld	bc, sprPhase2SprId-1	;m_128_XXXX	; sprPhase2SprId-2
		add	hl, bc
		ld	a, (hl)
		ld	b, d
		ld	c, e
		push	iy
		pop	hl
		call	putSpriteAndPlay128Music? ; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ??
					;
		ld	c, 47h
		call	fillAttr_2x2

skipGeneration:
		pop	hl
		inc	hl
		inc	hl
		inc	hl
		ld	de, 48
		add	iy, de
		jr	nextStar	; X?

; =============== S U B	R O U T	I N E =======================================

; A sprId (00..45)
; D - Y	(0..192)?
; E - X	(0..255)
; HL - ??
;

putSpriteAndPlay128Music?:
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - saveSpriteArea
					;
		push	af
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	z, no128music

		ld	a, (m_128_XXXX)
		inc	a
		ld	(m_128_XXXX), a
		cp	4
		jr	nz, no128music
		xor	a
		ld	(m_128_XXXX), a
		push	af
		push	bc
		push	de
		push	hl
		push	ix
		push	iy
		call	do128musicstep
		pop	iy
		pop	ix
		pop	hl
		pop	de
		pop	bc
		pop	af

no128music:
		pop	af
		ret

; ---------------------------------------------------------------------------
m_128_XXXX:	db 2
sprPhase2SprId:	db 0
		db sStar_1,sStar_1,sStar_2; 0
		db sStar_2,sStar_3,sStar_3; 3
		db sStar_4,sStar_4,sStar_4; 6
		db sStar_3,sStar_3,sStar_2; 9
		db sStar_3,sStar_1,sStar_1; 12
StarsData?:
 		ds 	12*3
; 		lvl    8, 112,	 3; 0
; 		lvl   96,  16,	 0; 11
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_menuStars:
		ld	hl, StarsData?
		ld	de, StarsData?+1
 		ld	bc, 12*3-1
		ld	(hl), b
		ldir
		ret

