;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;de-yx
;ret: a=0 if free
;check that next char free,
;checked only if x&3=0
chk_free_right:
		push	bc
		push	de
		push	hl
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_937D
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		inc	l
		ld	bc, 32 		;20h
		ld	a, (hl)
		ld	e, a

		ld	a, d
		and	7

		ld	a, e
		jr	z, loc_937D

		add	hl, bc
		or	(hl)

loc_937D:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================

;de-yx
;ret: a=0 if free
;check that next char free,
;checked only if x&3=0

chk_free_left:
		push	bc
		push	de
		push	hl

		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_939D

		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		dec	l
		ld	bc, 32
		ld	a, (hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_939D
		add	hl, bc
		or	(hl)

loc_939D:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


chk_free_up:
		push	bc
		push	de
		push	hl
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_93BD
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, 32
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_93BD
		inc	l
		or	(hl)

loc_93BD:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


chk_free_down:
		push	bc
		push	de
		push	hl
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_93DD
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, -32
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_93DD
		inc	l
		or	(hl)

loc_93DD:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
