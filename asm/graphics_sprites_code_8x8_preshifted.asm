;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; a - sprite num
; 0 - Grenade right
; 1 - Grenade left
; 2 - Boom1 - Biggest
; 3 - Boom2
; 4 - Boom3
; 5 - Boom4 - Smalest
; 6 - Boom5 - Empty?
; 7 - Spheres
; 8 - shot left	small
;
; d,e -	y(0..191),x(0..127)
;
; each sprites - preshifted, 4 phases (16*8 bytes each)
; increment call count

Sprite8x8_XOR_Preshifted:
		push	af
		push	bc
		push	de
		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		push	hl
;Calc offset to	sprite
		add	a, a
		add	a, a		; 4
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 64 = 4*16

; X offset from	4 preshifted sprite
		ld	a, e		; x
		and	3
		add	a, a
		add	a, a
		add	a, a
		add	a, a		; 16
		ld	e, a
		ld	d, 0
		add	hl, de		; hl=A*64+(x&3)*16
		ld	bc, Shifted4Sprites
		add	hl, bc
;
		pop	de		; hl-Sprite addr
		ld	(_SAV_SP), sp
		ld	sp, hl
		ex	de, hl
		ld	bc, 407h	; 4 - iteration, 7 - mask

loc_9325:
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, h
		and	c
		jr	nz, noScrYAddrFix
		ld	a, l
		add	a, 32
		ld	l, a
		jr	c, noScrYAddrFix
		ld	a, h
		sub	8
		ld	h, a

noScrYAddrFix:
		pop	de
		ld	a, d
		xor	(hl)
		ld	(hl), a
		dec	l
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_9353
		ld	a, l
		add	a, 32	;20h
		ld	l, a
		jr	c, loc_9353
		ld	a, h
		sub	8
		ld	h, a

loc_9353:
		djnz	loc_9325
;
		ld	sp, (_SAV_SP)
;
		ld	hl, Sprites8x8_OnScreen_count
		inc	(hl)
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
