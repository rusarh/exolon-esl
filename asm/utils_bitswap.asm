;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

initBitSwapTab:
		ld	hl, bitSwapTab	; swapped bits

loc_7B9C:
		ld	d, l
		ld	b, 8

loc_7B9F:
		srl	d
		rl	c
		djnz	loc_7B9F

		ld	(hl), c
		inc	l
		jr	nz, loc_7B9C
		ret

; =============== S U B	R O U T	I N E =======================================

; Swap sprites to left/right when move in left/right directions

swapBigSprite:
		push	af
		push	bc
		push	de
		push	hl

		ld	a, (playerSpriteDirection) ;	0 - to right, 1	- to left
		xor	1
		ld	(playerSpriteDirection), a ;	0 - to right, 1	- to left

		ld	hl, PLAYER_WALK	; 10 phases
		ld	d, 64h ; 'd'    ; 6400 - bitSwapTab
		ld	bc, 768

;
;  original A,B,C converted to swapped (') C',B',A'
;  1111000 10101010 0001011 -> 11010000 01010101 00001111
;

loc_7BBE:
		push	bc
		push	hl
		ld	e, (hl)
		ld	a, (de)
		ld	c, a
		inc	hl
		ld	e, (hl)
		ld	a, (de)
		ld	(hl), a
		inc	hl
		ld	e, (hl)
		ld	a, (de)
		ld	(hl), c
		inc	hl
		pop	bc
		ld	(bc), a
		pop	bc
		dec	bc
		ld	a, b
		or	c
		jp	nz, loc_7BBE
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; ---------------------------------------------------------------------------
playerSpriteDirection:
		db 0		; 0 - to right,	1 - to left
