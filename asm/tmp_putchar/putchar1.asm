PurCharAndSetVarsChkX:

		bit	5, e
		ret	nz
;
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl		; *8

FontPTR:	ld	bc, FNT_MAIN
		add	hl, bc
; CALC scr addr	- D,E
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
;
		ld	b, 8

char_lp:
		ld	a, (hl)

		ld	(de), a
		inc	d
		inc	hl
		djnz	char_lp
;cal ATTR addr
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3

		or	58h ; 'X'       ; 5800 - ATTR_TABLE
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
;
		ld	de, 900h	; 6100 - no_walk_tab
		add	hl, de

noWalkFlag:	ld	(hl), 1

		ld	de, -600h	; 5B00 - over_player_tab
		add	hl, de
overPlayerFlag:	ld	(hl), 0

		pop	hl
		pop	de
		pop	af

		ret
