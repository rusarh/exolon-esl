;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; A sprId (00..45)
; D - Y	(0..192)?
; E - X	(0..255)
; HL - savedSprite
;

;shift sprite to ShiftedSprites buffer
;check it's possible to place whole sprite ?
;if not - mask sprite in buffer depend on over_player_tab (and with 00 or FF from tab)
;xor erase old
;xor put new
;copy new to oldbuf

Sprite16x16:
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





		ld	de, SPRITES
		add	hl, de

		ld	(_SAV_SP), sp
		ld	sp, hl

; 2. shift sprite to sprite buff
; (x&7)
		add	a, a		; X
		and	7
		add	a, a
		ld	l, a
		ld	h, 0

		ld	de, _shif_jp_tab16
		add	hl, de

		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	ix, 0
		add	ix, de

		ld	hl, ShiftedSprites
		ld	b, 16

shift_loop_16x16:
		pop	de		;word from sprite
		xor	a


		jp	(ix)

; ---------------------------------------------------------------------------

shift16_4:
		sla	d
		rl	e
		rla


shift16_5:
		sla	d
		rl	e
		rla


shift16_6:
		sla	d
		rl	e
		rla


shift16_7:
		sla	d
		rl	e
		rla


		ld	(hl), a
		inc	hl

		ld	(hl), e
		inc	hl

		ld	(hl), d
		inc	hl





		djnz	shift_loop_16x16

		jp	spr16x16_shift_done
; ---------------------------------------------------------------------------

shift16_3:
		srl	e
		rr	d
		rra


shift16_2:
		srl	e
		rr	d
		rra


shift16_1:
		srl	e
		rr	d
		rra


shift16_0:
		ld	(hl), e
		inc	hl

		ld	(hl), d
		inc	hl

		ld	(hl), a
		inc	hl





		djnz	shift_loop_16x16

spr16x16_shift_done:
		ld	sp, (_SAV_SP)
		pop	de		; xy
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr

		ld	(scr_addr_spr16x16+1), hl
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a		;scr->attr offset

		push	de		;xy
		ld	bc, over_player_tab
		add	hl, bc

		push	hl		;over_player_tab
		ld	a, d		;?Y?
		ld	de, 30		; 32-2
		ld	b, 2		; 2byte
		and	7
		jr	z, loc_79ED
		inc	b

loc_79ED:
		ld	a, 0FFh

loc_79EF:
		and	(hl)
		inc	l
		and	(hl)
		inc	l
		and	(hl)



		add	hl, de
		djnz	loc_79EF

		pop	hl		;over_player_tab
		pop	de		;yx
		jr	nz, spr16_no_overlap

		ld	a, 8
		ld	(last_mask16_len+1), a

		ld	a, d
		and	7
		ld	de, ShiftedSprites
		jr	z, first_byte16_shift_0

		ld	(last_mask16_len+1), a
		ld	b, a
		ld	a, 8
		sub	b
		ld	b, a
		ld	de, ShiftedSprites
		call	mask16_hl_de_a

first_byte16_shift_0:
		call	mask16_hl_de_8

last_mask16_len:
		ld	b, 8
		call	mask16_hl_de_a

spr16_no_overlap:
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

scr_addr_spr16x16:
		ld	hl, 0 		; overwritend
		ld	(_SAV_SP), sp
		ld	sp, ShiftedSprites
		ld	bc, 1007h

copy_spr_16_lp:
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l

		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l

		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a

		dec	sp

		dec	l
		dec	l

		inc	h
		ld	a, h
		and	c
		jr	nz, _16_no_y_corr1
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, _16_no_y_corr1
		ld	a, h
		sub	8
		ld	h, a

_16_no_y_corr1:
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
		inc	de

		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, _16_no_y_corr2
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, _16_no_y_corr2
		ld	a, h
		sub	8
		ld	h, a

_16_no_y_corr2:
		exx
		djnz	copy_spr_16_lp

		ld	sp, (_SAV_SP)
		pop	de
		push	de
		and	a
		ld	hl, byte_B101
		sbc	hl, de
		jr	z, loc_7AB0
		ld	hl, ShiftedSprites
		ld	bc, 16*3	;48 = 30h

loc_7A8D:
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
		ldi
		jp	pe, loc_7A8D

loc_7AB0:

;ESLDBG
;fix bug, forgotten inc ?
		if FIX_SPRITE16x16COM == 1
		ld	hl, Sprites16x16_OnScreen_count
		inc	(hl)
		endif
;ESLDBG

		pop	hl
		pop	ix
		pop	de
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


mask16_hl_de_8:
		ld	b, 8

mask16_hl_de_a:


		ld	a, (hl)
		ld	(spr_byte16_1+1), a
		inc	hl
		ld	a, (hl)
		ld	(spr_byte16_2+1), a




		inc	hl
		ld	c, (hl)		; spr_byte16_3

loc_7AC4:
		ld	a, (de)
spr_byte16_1:	and	0xff
		ld	(de), a
		inc	de
		ld	a, (de)
spr_byte16_2:	and	0xff
		ld	(de), a
		inc	de





		ld	a, (de)
		and	c
		ld	(de), a
		inc	de

		djnz	loc_7AC4

		ld	bc, 30		;32-2
		add	hl, bc
		ret

_shif_jp_tab16:	dw shift16_0
		dw shift16_1
		dw shift16_2
		dw shift16_3
		dw shift16_4
		dw shift16_5
		dw shift16_6
		dw shift16_7

