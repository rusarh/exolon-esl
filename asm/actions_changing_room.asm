;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;change exoSkeleton when player press UP in exoSkeletonBox
;to OPTIMIZE!!!!!
;EXECUTED even if no BOX on screen !!!!!!!!!!!!!!!

;changing_room 	aka exoSkeletonChange

chk_changing_room:
		ld	a, (key_UP)
		or	a
		jr	nz, no_up_key
		ld	(gl_alreadyChanged), a
		ret

; ---------------------------------------------------------------------------

no_up_key:
		ld	a, (gl_alreadyChanged)
		or	a
		ret	nz

		inc	a
		ld	(gl_alreadyChanged), a

		ld	de, (xyChangingRoom)
		bit	7, e
		ret	nz

		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos)
		cp	d
		ret	nz

		ld	a, (Player_X_Pos)
		sub	e
		sub	9
		cp	235
		ret	c

		ld	de, (Player_X_Pos)

		ld	a, (flag_Exoskeleton)
		xor	sprPlayerCount		;0Ch
		ld	(flag_Exoskeleton), a 	; =0x0c (12) if on

		call	snd_got_white_box

		ld	a, sprPlayerPhase5	;5
		jp	ShowPlayerSprite

; ---------------------------------------------------------------------------
gl_alreadyChanged:
		db 0

xyChangingRoom:
		dw 0
		db 0FFh
