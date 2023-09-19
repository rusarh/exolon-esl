;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;RocketLauncher (as sample 23 - single or doubel)
;double rocket - simple two rocket objects on map
;do not shot if player closet than 30 pixel

;Rocket routines

update_RocketLauncher:
		ld	hl, xyRocketLauncher

updateRocketL_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		call	RND
		cp	0F7h		;random delay
		jr	c, updateRocketL_loop

		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		dec	e
		dec	e
		ld	a, e
		sub	30 		;do not shot if player too close 1Eh
		ld	c, a
		ld	a, (Player_X_Pos)
		cp	c
		ret	nc

		push	hl
		ld	hl, str_LauncherRockets

addRocketLP:
		bit	7, (hl)
		jr	z, loc_9DA8
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_9DA8:
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	nz, addRocketLP

		dec	hl
		ld	(hl), -2	;0FEh - dx
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e
		ld	a, 8		; 8 - shot left	small
		call	Sprite8x8_XOR_Preshifted

		call	snd_shot_tworocket

		pop	hl
		jr	updateRocketL_loop

; ---------------------------------------------------------------------------
xyRocketLauncher:
		ds 	10*2
; 		str_XY <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


move_rocket:

		ld	hl, str_LauncherRockets

loc_9DD9:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		ld	c, a
		inc	hl
		or	a
		jr	z, loc_9DD9

		push	hl

		;erase rocket
		ld	a, 8		; 8 - shot left	small
		call	Sprite8x8_XOR_Preshifted

		ld	a, e
		or	a
		jr	nz, updte_rocket_pos

		;deactivate rocket
		dec	hl
		ld	(hl), 0
		pop	hl
		jr	loc_9DD9
; ---------------------------------------------------------------------------

updte_rocket_pos:
		ld	a, c
		add	a, e
		ld	e, a
		ld	a, 8		; 8 - shot left	small
		call	Sprite8x8_XOR_Preshifted

		ld	c, 47h
		call	fillAttr_1x1

		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		jr	loc_9DD9


; =============== S U B	R O U T	I N E =======================================


clr_Rockets:
		ld	hl, str_LauncherRockets
		ld	de, str_LauncherRockets+1
		ld	(hl), 0
		ld	bc, 10*3-1	;29
		ldir
		ret

; ---------------------------------------------------------------------------
str_LauncherRockets:
		ds 	10*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


chk_destroy_rocket:
		ld	hl, str_LauncherRockets

chkdsl_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, chkdsl_loop

		call	chk_destroyd_by_my_bullet
		or	a
		call	nz, destroy_rocket

		jr	chkdsl_loop

; =============== S U B	R O U T	I N E =======================================


destroy_rocket:
		ld	a, 8		; 8 - shot left	small
		call	Sprite8x8_XOR_Preshifted

		dec	hl
		ld	(hl), 0
		inc	hl

		call	add_AnimatedParticle
		call	snd_destroy_ball

		ld	de,  a000050+5
		jp	addPoints


; =============== S U B	R O U T	I N E =======================================

chk_killed_by_rocket:

		ld	hl, str_LauncherRockets

loc_9E67:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9E67

		ld	bc, 804h
		call	chkPlayerInZone
		or	a
		jr	z, loc_9E67

		call	destroy_rocket

		call	snd_destroy_ball
		jp	KillPlayer
