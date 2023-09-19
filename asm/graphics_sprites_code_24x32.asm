;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;
; 00-09	- WALK
; 10 - Duck
; 11 - DIE
; 12-21	WALK 2gun
; 22 - Duck2gun
; 23 - Die 2gun
; 24 - PUMP
;

Sprite24x32_Player:
		push	af
		push	bc
		push	de
		push	ix
		push	hl
		push	bc
		push	hl
		push	de
;
; 1. calculate sprite ram addr
;
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 32

		ld	a, e
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, de		; *96

		ld	de, PLAYER_WALK	; 10 phases
		add	hl, de

		ld	(_SAV_SP), sp
		ld	sp, hl

; 2. shift sprite to sprite buff
; (x&7)
		add	a, a		; x
		and	7
		add	a, a
		ld	l, a
		ld	h, 0

		ld	de, _shif_jp_tab24
		add	hl, de

		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	ix, 0
		add	ix, de

		ld	hl, ShiftedSprites
		ld	a, 32

shift_loop_24x32:
		pop	bc		;word from sprite
		pop	de		;word from sprite
		dec	sp		;correct for pop 3 byte
		ld	d, 0
		jp	(ix)

; ---------------------------------------------------------------------------

shift24_4:
		rl	e
		rl	b
		rl	c
		rl	d

shift24_5:
		rl	e
		rl	b
		rl	c
		rl	d

shift24_6:
		rl	e
		rl	b
		rl	c
		rl	d

shift24_7:
		rl	e
		rl	b
		rl	c
		rl	d

		ld	(hl), d
		inc	hl

		ld	(hl), c
		inc	hl

		ld	(hl), b
		inc	hl

		ld	(hl), e
		inc	hl

		dec	a
		jp	nz, shift_loop_24x32

		jp	spr24x32_shift_done
; ---------------------------------------------------------------------------

shift24_3:
		rr	c
		rr	b
		rr	e
		rr	d

shift24_2:
		rr	c
		rr	b
		rr	e
		rr	d

shift24_1:
		rr	c
		rr	b
		rr	e
		rr	d

shift24_0:
		ld	(hl), c
		inc	hl

		ld	(hl), b
		inc	hl

		ld	(hl), e
		inc	hl

		ld	(hl), d
		inc	hl

		dec	a
		jp	nz, shift_loop_24x32

spr24x32_shift_done:
		ld	sp, (_SAV_SP)
		pop	de
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr

		ld	(scr_addr_spr24x32+1), hl
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a

		push	de
		ld	bc, over_player_tab
		add	hl, bc

		push	hl
		ld	a, d
		ld	de, 29		; 32-3
		ld	b, 4		; 4byte
		and	7
		jr	z, loc_778F
		inc	b

loc_778F:
		ld	a, 0FFh

loc_7791:
		and	(hl)
		inc	hl
		and	(hl)
		inc	hl
		and	(hl)
		inc	hl
		and	(hl)

		add	hl, de
		djnz	loc_7791

		pop	hl
		pop	de
		ex	af, af'
		ld	a, e
		cp	75h
		jp	c, loc_77CF
		exx
		ld	hl,  ShiftedSprites+1
		cp	7Ch
		ld	de, 0
		ld	c, d
		jr	nc, loc_77BD
		cp	78h
		ld	de, 0FF00h
		ld	c, e
		jr	nc, loc_77BD
		ld	de, 0FFFFh
		ld	c, 0

loc_77BD:
		ld	b, 32

loc_77BF:
		ld	a, d
		and	(hl)
		ld	(hl), a
		inc	hl
		ld	a, e
		and	(hl)
		ld	(hl), a
		inc	hl
		ld	a, c
		and	(hl)
		ld	(hl), a
		inc	hl
		inc	hl
		djnz	loc_77BF
		exx

loc_77CF:
		ex	af, af'
		jr	nz, loc_77FB

		ld	a, 8
		ld	(last_mask24_len+1), a

		ld	a, d
		and	7
		ld	de, ShiftedSprites
		jr	z, first_byte24_shift_0

		ld	(last_mask24_len+1), a
		ld	b, a
		ld	a, 8
		sub	b
		ld	b, a
		ld	de, ShiftedSprites
		call	mask24_hl_de_a

first_byte24_shift_0:
		call	mask24_hl_de_8
		call	mask24_hl_de_8
		call	mask24_hl_de_8

last_mask24_len:
		ld	b, 0
		call	mask24_hl_de_a

loc_77FB:
		pop	hl
		pop	de
		ld	b, h
		ld	c, l
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		ld	d, b
		ld	e, c
		ld	c, 7
		exx

scr_addr_spr24x32:
		ld	hl, 0		;overwritend
		ld	(_SAV_SP), sp
		ld	sp, ShiftedSprites
		ld	bc, 2007h

loc_7814:
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l
;
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		dec	l
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_7837
		ld	a, l
		add	a, 32
		ld	l, a
		jr	c, loc_7837
		ld	a, h
		sub	8
		ld	h, a

loc_7837:
		exx
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	de
		dec	l
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_785D
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, loc_785D
		ld	a, h
		sub	8
		ld	h, a

loc_785D:
		exx
		djnz	loc_7814
		ld	sp, (_SAV_SP)
		pop	de
		push	de
		and	a
		ld	hl, byte_B101
		sbc	hl, de
		jr	z, loc_7897
;
		ld	hl, ShiftedSprites
		ld	bc, 16*8	;128?? 8 SPRITES?

move_1_shifted_spr:
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi			; 16
		jp	pe, move_1_shifted_spr

loc_7897:
		pop	hl
		pop	ix
		pop	de
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


mask24_hl_de_8:
		ld	b, 8

mask24_hl_de_a:
		ld	a, (hl)
		ld	(spr_byte24_1+1), a
		inc	hl
		ld	a, (hl)
		ld	(spr_byte24_2+1), a
		inc	hl
		ld	a, (hl)
		ld	(spr_byte24_3+1), a

		inc	hl
		ld	c, (hl)		; spr_byte24_4

loc_78B0:
		ld	a, (de)
spr_byte24_1:	and	0
		ld	(de), a
		inc	de
		ld	a, (de)
spr_byte24_2:	and	0
		ld	(de), a
		inc	de
		ld	a, (de)
spr_byte24_3:	and	0
		ld	(de), a
		inc	de

		ld	a, (de)
		and	c
		ld	(de), a
		inc	de

		djnz	loc_78B0

		ld	bc, 29		;32-3
		add	hl, bc
		ret

_shif_jp_tab24:	dw shift24_0
		dw shift24_1
		dw shift24_2
		dw shift24_3
		dw shift24_4
		dw shift24_5
		dw shift24_6
		dw shift24_7
;
_SAV_SP:	dw _stack
;

ShiftedSprites:	ds 128
	;








