;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

move_Pump:
		ld	ix, SpriteBuf24x32_pump-(4*32)	;SpriteBuf24x32
		ld	hl, xyPump	; 4

doPUMPLoop:
		ld	de, 4*32	;80h sprite size
		add	ix, de

		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		ld	b, d
		inc	hl
		ld	a, (hl)
		inc	(hl)
		inc	hl

		cp	101
		jr	c, doPUMPLoop

		cp	105
		jr	nc, loc_9C3C

		dec	d
		dec	hl
		dec	hl
		ld	(hl), d
		inc	hl
		inc	hl
		jr	loc_9C56
; ---------------------------------------------------------------------------

loc_9C3C:
		cp	116
		jr	c, loc_9C56

		cp	120
		jr	nc, loc_9C4C

		inc	d
		dec	hl
		dec	hl
		ld	(hl), d
		inc	hl
		inc	hl
		jr	loc_9C56
; ---------------------------------------------------------------------------

loc_9C4C:
		dec	hl
		call	RND
		and	3Fh
		add	a, 20
;ESLDBG
; 		ld 	a,100		;delay to next, 100 - fast, 1 - long
;ESLDBG

		ld	(hl), a
		inc	hl

loc_9C56:
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	c, e
		ld	a, b
		add	a, a
		add	a, a
		add	a, a
		ld	b, a

		ld	a, 24		; PUMP sprite
		push	hl
		push	ix
		pop	hl
		call	Sprite24x32_Player

		ld	c, 44h          ; green
		call	fillAttr_3x4

		pop	hl
		jr	doPUMPLoop

; ---------------------------------------------------------------------------
xyPump:
		ds 	4*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_Pump:
		ld	hl, xyPump	; 4
		ld	de, xyPump+1	; 4
		ld	bc, 4*3-1	;11
		ld	(hl), 5Fh
		ldir
		ret


; =============== S U B	R O U T	I N E =======================================


chk_killed_by_pump:
		ld	hl, xyPump	; 4

chk_PumpLoop:
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		cp	101
		jr	c, chk_PumpLoop

		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	bc, 200Ch
		call	chkPlayerInZone
		or	a
		jr	z, chk_PumpLoop

		jp	KillPlayer_unless_Exoskeleton

