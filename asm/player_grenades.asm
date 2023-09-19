;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;WIP
;grenades shot after playe hold "FIRE" 15 game tick ...
;destroyed if grenade leave screen (or ground)
;each step y corrected via table (generate specific trajectory)
;move_grenade executed several times in main loop for change grenade acceleration

chk_grenade:
		call	doRetIfPlayerAlreadyDie

		ld	a, (Player_X_Pos)
		cp	118
		ret	nc

		ld	a, (_GRENADES)
		or	a
		ret	z

		ld	a, (firePressDelay)
		cp	15 			;delay while fire button pressed
		ret	c

		ld	a, (grenade_phase)
		or	a
		ret	nz

		ld	a, 32
		ld	(grenade_phase), a

		ld	hl, (Player_X_Pos)
		ld	a, l
		add	a, 4
		ld	l, a		;x+=4

		ld	a, (flag_duck_y)
		or	a
		jr	z, no_correct_duck
		ld	a, h
		add	a, 6
		ld	h, a
no_correct_duck:

		ld	(xyGrenade), hl

		ld	a, (player_direction_DX)
		ld	(grenade_DX), a

		ex	de, hl

		;select sprite depend on player direction
		inc	a
		ld	a, 1
		jr	z, spr_left
		xor	a
spr_left:
		ld	(grenade_spr_id), a		;=(dx==-1) ? 1 : 0;

		; 0 - Grenade right
		; 1 - Grenade left
		call	Sprite8x8_XOR_Preshifted

		ld	a, (_GRENADES)
		dec	a
		ld	(_GRENADES), a

		call	snd_Fire_Grenades

		jp	osd_GRENADES

; ---------------------------------------------------------------------------
grenade_phase:	db 0
xyGrenade:	dw 0
grenade_DX:	db 0
grenade_spr_id:	db 0

; =============== S U B	R O U T	I N E =======================================

move_grenade:

		ld	a, (grenade_phase)
		or	a
		ret	z

		ld	c, a
		ld	b, 0
		ld	hl,  tab_grenade_dy-1
		add	hl, bc
		dec	a
		jr	z, stay_on_phase1	;stay on last phase forever
		ld	(grenade_phase), a
stay_on_phase1:

		ld	de, (xyGrenade)
		ld	a, (grenade_spr_id)
		call	Sprite8x8_XOR_Preshifted

		;remove if x > right border
		ld	a, e
		cp	124
		jr	z, deactivate_grenade

		;remove if x < left border
		or	a
		jr	z, deactivate_grenade

		ld	a, (grenade_DX)
		ld	b, a
		inc	a
		jr	nz, g_left

		call	chk_free_left
		jr	nz, deactivate_grenade

		jr	g_left_right
; ---------------------------------------------------------------------------

g_left:
		call	chk_free_right
		jr	nz, deactivate_grenade

g_left_right:
		ld	a, b
		add	a, e
		ld	e, a
		ld	(xyGrenade), a

		ld	a, (xyGrenade+1)	;y
		ld	d, a
		ld	a, (hl)
		cp	0FFh
		jr	nc, loc_92AA

		call	chk_free_up
		jr	nz, deactivate_grenade

loc_92AA:
		ld	a, (hl)
		add	a, d
		ld	d, a
		cp	168 	;deactivate if y>168	0A8h
		jr	nc, deactivate_grenade

		ld	(xyGrenade+1), a

		ld	a, (grenade_spr_id)
		ld	c, 47h ; 'G'
		call	fillAttr_1x1

		call	Sprite8x8_XOR_Preshifted

		;correct x for grenade tail
		ld	a, (grenade_DX)
		inc	a
		ld	a, 4
		jr	z, loc_92C9
		neg
loc_92C9:
		add	a, e
		ld	e, a

		;add tail
		ld	a, (grenade_phase)
 		cp	19 	;13h
		jp	nc, add_AnimatedParticle
		ret
; ---------------------------------------------------------------------------

deactivate_grenade:
		xor	a
		ld	(grenade_phase), a
		jp	chk_destroy_oblect

; ---------------------------------------------------------------------------
;index counted from last to first element, and stay on last until destroyed
tab_grenade_dy:
		db    1,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0; 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0; 11
		db    0,  -1,  -1,  -1,  -1,  -2,  -2,  -2,  -4,  -4; 22
; 		db    0FFh,0FFh,0FFh,0FFh,0FEh,0FEh,0FEh,0FCh,0FCh; 22

