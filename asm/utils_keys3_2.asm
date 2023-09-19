;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

chk_key_3_continue:
		push	bc
		push	hl

loc_7CEE:
		call	chk_KEYS
		ld	a, (key_FIRE)
		or	a
		ld	a, 30h ; '0'
		jr	nz, loc_7D14
		ld	hl, KBD_TABLE
		ld	d, 0FEh	; 'þ'

loc_7CFE:
		ld	a, d
		in	a, (0FEh)
		ld	e, 1
		ld	b, 5

loc_7D05:
		rrca
		jr	nc, loc_7D13
		inc	hl
		sla	e
		djnz	loc_7D05
		rlc	d
		jr	c, loc_7CFE
		jr	loc_7CEE
loc_7D13:
		ld	a, (hl)

loc_7D14:
		pop	hl
		pop	bc
		ret

