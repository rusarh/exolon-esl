putChar:




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

loc_AE46:
		ld	a, (hl)

		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AE46

		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3

		or	58h 		; 5800 - ATTR_TABLE
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c










		pop	hl
		pop	de
		pop	af

		ret
