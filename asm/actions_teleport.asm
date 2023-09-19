;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

chk_Teleport:
		ld	a, (key_UP)
		or	a
		jr	nz, loc_98C4
		ld	(flag_TeleportInProgress), a
		ret
; ---------------------------------------------------------------------------

loc_98C4:
		ld	a, (flag_TeleportInProgress)
		or	a
		ret	nz

		inc	a
		ld	(flag_TeleportInProgress), a

		ld	de, (xyTeleport1)
		bit	7, e
		ret	nz

		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		jr	nz, in_teleport2

		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	9
		cp	235
		jr	c, in_teleport2

		call	addTeleportParticle

		ld	de, (xyTeleport2)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	snd_teleport

		call	addTeleportParticle
		dec	e
		dec	e
		dec	e			; x-=3
		ld	a, sprPlayerPhase5	;5-walk middle

		jp	ShowPlayerSprite
; ---------------------------------------------------------------------------

in_teleport2:
		ld	de, (xyTeleport2)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		ret	nz

		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	9
		cp	235
		ret	c

		call	addTeleportParticle
		ld	de, (xyTeleport1)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	addTeleportParticle
		dec	e
		dec	e
		dec	e		;x-=3

		call	snd_teleport

		ld	a, sprPlayerPhase5	;5
		jp	ShowPlayerSprite 	; a	- sprite

; ---------------------------------------------------------------------------
xyTeleport1:	dw 0
xyTeleport2:	dw 0
		db 0FFh
flag_TeleportInProgress:
		db 0
