;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;IN:D,E - X,Y
;out: A=1 hit

chk_enemy_hitted_by_bullet:

		push	bc
		push	de
		push	hl
		inc	e
		inc	e
		ld	hl, myBullets

chk_bullet_lp:
		xor	a
		ld	c, (hl)
		bit	7, c
		jr	nz, no_more_bullets
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, chk_bullet_lp
		ld	a, c
		sub	e
		cp	0F8h
		jr	c, chk_bullet_lp
		ld	a, b
		sub	d
		sub	11h
		cp	0EEh
		jr	c, chk_bullet_lp
		ld	d, b
		ld	e, c
		call	show_my_bullet
		dec	hl
		ld	(hl), 0
		ld	a, 1

no_more_bullets:
		pop	hl
		pop	de
		pop	bc
		ret

