;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

show_my_bullet:
		push	af
		push	bc
		push	hl
		push	de
		ld	l, 10111101b ; 0xBD - BULLET pattern
		ld	h, 0
		ld	a, e
		cpl
		and	3
		inc	a
		ld	b, a

shift_bullet:
		add	hl, hl
		add	hl, hl
		djnz	shift_bullet

		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		pop	de
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, e
		xor	(hl)
		ld	(hl), a
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	bc, ATTR_TABLE_COPY
		add	hl, bc
		ld	a, (hl)
		dec	l
		or	(hl)
		jr	nz, no_chg_bg
;
		ld	bc,  -0x600 	; 0x5E00(AttrTableCopy) -> 0x5800 (AttrTable)
		add	hl, bc
		ld	(hl), 0x47 	;background
		inc	l
		ld	(hl), 0x47 	;background

no_chg_bg:
		pop	de
		pop	hl
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


chk_Fire:
		call	doRetIfPlayerAlreadyDie

		ld	a, (Player_X_Pos)
		cp	118			;do not fire if too cloose to right border
		jr	c, try_fire_1

		xor	a 			;UNUSED?
		ld	(byte_7B98), a		;UNUSED?

		ret
try_fire_1:
		ld	a, (key_FIRE)
		or	a
		jr	nz, try_fire_2

		ld	(firePressDelay), a
		ret
; ---------------------------------------------------------------------------

try_fire_2:
		ld	a, (firePressDelay)
		or	a
		jr	z, actual_fire

		inc	a
		ret	z
		ld	(firePressDelay), a
		ret
; ---------------------------------------------------------------------------

actual_fire:
		inc	a
		ld	(firePressDelay), a

		ld	a, (_AMMO)
		or	a
		ret	z

		ld	b, 60
		call	sound48

		ld	a, (_AMMO)
		dec	a
		ld	(_AMMO), a

		call	snd_player_shot
		call	osd_AMMO
		call	add_MyBullet

		ld	a, (flag_Exoskeleton)
		or	a
		ret	z
;
;		secode ammo
;
		ld	a, (Player_Y_Pos)
		push	af
		add	a, 6 		  ;y+6
		ld	(Player_Y_Pos),	a
		call	add_MyBullet
		pop	af

;BUG???? why ??????
		ld	(Player_Y_Pos),	a
		ret

; =============== S U B	R O U T	I N E =======================================


add_MyBullet:
		ld	hl, myBullets	;stru_845F

add_bullet_lp:
		bit	7, (hl)
		ret	nz

		inc	hl
		inc	hl
		ld	a, (hl)		;bullet dx
		inc	hl
		or	a
		jr	nz, add_bullet_lp

		dec	hl
		ld	a, (player_direction_DX)
		ld	(hl), a		;bullet dx

		ld	de, (Player_X_Pos)
		ld	a, (flag_duck_y)
		or	a
		ld	a, 14 		;0Eh
		jr	z, no_fire_duck
		ld	a, 19 		;13h
no_fire_duck:
		add	a, d
		ld	d, a
		dec	hl
		ld	(hl), d		;y
		dec	hl

		ld	a, (player_direction_DX)
		inc	a
		or	a		;if =-1

		ld	a, -4		;0FCh	; 'ü'
		jr	z, loc_83C1
		ld	a, 12		;0Ch

loc_83C1:
		add	a, e
		ld	e, a
		cp	120 		;78h >120
		jr	nc, ignore_bullet

		cp	4		;   <4
		jr	c, ignore_bullet

		ld	(hl), e		;x

		;check that bullet place 'empty'

		push	hl
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	a, (hl)
		inc	l
		or	(hl)
		pop	hl
		jp	z, show_my_bullet

ignore_bullet:
		inc	hl
		inc	hl
		ld	(hl), 0
		ret

; ---------------------------------------------------------------------------
firePressDelay:	db 0
; ---------------------------------------------------------------------------

update_player_bullets:
		call	chk_destroy_sphere
		call	chk_destroy_rocket
		call	chk_destroy_enemy
		call	chk_destroy_beam

		ld	hl, myBullets
bullet_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, bullet_loop

		call	show_my_bullet

		ld	b, a
		ld	c, d
		ld	a, d
		and	0F8h
		ld	d, a
		ld	a, b
		inc	a
		jr	nz, bullet_to_right

		call	chk_free_left
		call	nz, snd_single_shot_to_item
		jr	nz, bullet_hit

		jr	bullet_can_fly
; ---------------------------------------------------------------------------

bullet_to_right:
		ld	a, e
		cp	124		;7Ch
		jr	z, deactivate_bullet

		call	chk_free_right
		call	nz, snd_single_shot_to_item
		jr	nz, bullet_hit

bullet_can_fly:
		ld	d, c
		ld	a, e

		;destroy bullets near screen border
		cp	124
		jr	z, deactivate_bullet

		cp	1
		jr	z, deactivate_bullet

		;bullet can "fly" +64/-52 pixels from player position
		ld	a, (Player_X_Pos)
		add	a, 64
		cp	e
		jr	z, deactivate_bullet

		ld	a, (Player_X_Pos)
		sub	52
		cp	e
		jr	z, deactivate_bullet

		ld	a, b
		add	a, e
		ld	e, a
		push	hl
		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		call	show_my_bullet
		jr	bullet_loop

bullet_hit:
		dec	hl
		ld	(hl), 0
		inc	hl
		ld	d, c
		call	add_AnimatedParticle

		ld	b, 20
bullet_snd_lp:
		push	bc
		ld	b, 20
		call	sound48
		pop	bc
		djnz	bullet_snd_lp

		jr	bullet_loop

deactivate_bullet:
		dec	hl
		ld	(hl), 0
		inc	hl
		jr	bullet_loop

; ---------------------------------------------------------------------------

myBullets:
		ds 	8*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================

clr_myBullets:
		ld	hl, myBullets
		ld	de, myBullets+1
		ld	bc, 8*3-1	;23
		ld	(hl), b
		ldir
		ret
