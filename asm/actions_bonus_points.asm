;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;onScreen object invisible (see screen 7, second blue cross)
;placed on DoubleShoutGun,
;when user cross with it - add 1000 hp
;object removed after activation

chk_BonusPoint:
		ld	hl, xyBONUS

bp_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, bp_loop
		push	de
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	bc, 804h
		call	chkPlayerInZone
		pop	de
		or	a
		jr	z, bp_loop
		dec	hl
		ld	(hl), 0
		call	snd_add_extra_point
		ld	a, 40			; 25*40=1000 points
		jp	add_A_bonus_and_snd

; ---------------------------------------------------------------------------
xyBONUS:
		ds 	10*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_BonusPoints:
		ld	hl, xyBONUS
		ld	de, xyBONUS+1
;bug ?? or no more than 4 bonus point supported ?
;buffer has size 10*3, but clear only 4*3
		ld	bc, 4*3-1 		;bug?, should be 10*3-1
		ld	(hl), 1
		ldir
		ret

