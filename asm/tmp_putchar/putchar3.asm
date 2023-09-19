PutCharXorRemoveObject_2boom:

		bit	5, e
		ret	nz

		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl

		ld	bc, (FontPTR+1)
		add	hl, bc

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

		ld	b, 8

loc_AEB8:
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AEB8

		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3

		ld	h, a
		ld	l, e
		ld	de, over_player_tab
		add	hl, de
		pop	bc
		ld	(hl), 0FFh
		ld	de, 300h	; 5b00
		add	hl, de
		ld	(hl), 0
		ld	de, 300h	; 6100
		add	hl, de
		ld	(hl), 0



		pop	hl
		pop	de
		pop	af

		call	add_explosion_particle ; e-x (/4)
		jp	add_explosion_particle ; e-x (/4)


