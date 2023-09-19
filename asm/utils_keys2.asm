;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

_ctrl_KBD:
		ld	d, 1
		ld	hl, key_LEFT-1 	;locret_7B91
		ld	c, 0FEh 	;xxFE

KeyScanCodes:
k_chk_LEFT:
		inc	hl
		ld	b, 0DFh 	;YUIOP
		in	a, (c)
		and	2		;O
		jr	nz, k_chk_RIGHT
		ld	(hl), d

k_chk_RIGHT:
		inc	hl
		ld	b, 0DFh		;YUIOP
		in	a, (c)
		and	1		;P
		jr	nz, k_chk_UP
		ld	(hl), d

k_chk_UP:
		inc	hl
		ld	b, 0FBh		;TREWQ
		in	a, (c)
		and	1		;Q
		jr	nz, k_chk_DOWN
		ld	(hl), d

k_chk_DOWN:
		inc	hl
		ld	b, 0FDh		;GFDSA
		in	a, (c)
		and	1		;A
		jr	nz, k_chk_FIRE
		ld	(hl), d

k_chk_FIRE:
		inc	hl
		ld	b, 7Fh		;BNM SS SP
		in	a, (c)
		and	4		;M
		ret	nz
		ld	(hl), d
		ret
; ---------------------------------------------------------------------------

_ctrl_IFF2:
		ld	bc, 0EFFEh
		in	a, (c)		;67890 - LRDUF
		cpl
		and	1Fh
		ld	d, a
		call	shiftDtoA
		ld	(key_FIRE), a
		call	shiftDtoA
		ld	(key_UP), a
		call	shiftDtoA
		ld	(key_DOWN), a
		call	shiftDtoA
		ld	(key_RIGHT), a
		call	shiftDtoA
		ld	(key_LEFT), a
		ret
; ---------------------------------------------------------------------------

_ctrl_KEMPSTON:
		ld	c, 1Fh
		in	d, (c) 		; 000FUDLR
		call	shiftDtoA
		ld	(key_RIGHT), a
		call	shiftDtoA
		ld	(key_LEFT), a
		call	shiftDtoA
		ld	(key_DOWN), a
		call	shiftDtoA
		ld	(key_UP), a
		call	shiftDtoA
		ld	(key_FIRE), a
		ret

; =============== S U B	R O U T	I N E =======================================


shiftDtoA:
		xor	a
		srl	d
		rla
		ret

; =============== S U B	R O U T	I N E =======================================


chk_KEYS:

		call	clrKEYS
		ld	a, (active_control)
		or	a
		jp	z, _ctrl_KBD
		cp	1
		jp	z, _ctrl_IFF2
		jp	_ctrl_KEMPSTON

; =============== S U B	R O U T	I N E =======================================


clrKEYS:
		ld	hl, key_LEFT
		ld	de, key_RIGHT
		ld	(hl), 0
		ld	bc, 4
		ldir
		ret
; ---------------------------------------------------------------------------

key_LEFT:	db 0
key_RIGHT:	db 0
key_UP:		db 0
key_DOWN:	db 0
key_FIRE:	db 0

active_control:	db 0

;UNUSED
byte_7B98:	db 0

