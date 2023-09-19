;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

move_player:

		call	doRetIfPlayerAlreadyDie
		xor	a
		ld	(UpdateZoneRequired), a

		ld	de, (Player_X_Pos) ; 0..127

		;in fall progress
		ld	a, (flag_fall_down)
		or	a
		jp	nz, loc_8280

		;in death jump
		ld	a, (death_jump_phase)
		or	a
		jr	nz, next_dead_jump

		;start fall?
		call	chk_can_move_down	;=0 if can
		jp	z, loc_8280

		;duck
		ld	a, -6 			;0FAh
		ld	(flag_duck_y), a

		ld	a, (key_DOWN)
		or	a

		ld	a, sprPlayerDuck	;10 - sprite DUCK
		jp	nz, ShowPlayerSprite ; a  - sprite

		xor	a
		ld	(flag_duck_y), a

		;start jump ?
		ld	a, (key_UP)
		or	a
		jp	z, loc_8280 		;no jmp

		;no jump if not on ground
		call	chk_can_move_down	;=0 if can
		jp	z, loc_8280

		ld	a, 22

next_dead_jump:
		ld	hl, death_jump_tab-1	;byte_8269!!!!!!
		ld	c, a
		ld	b, 0
		dec	a
		ld	(death_jump_phase), a
		add	hl, bc
		ld	a, (hl)
		or	a
		jr	z, loc_820A
		cp	0Ah
		jr	nc, loc_81FB

		call	chk_can_move_down	;=0 if can
		jr	loc_81FE
; ---------------------------------------------------------------------------

loc_81FB:
		call	chk_can_move_up

loc_81FE:
		jr	z, loc_8207
		xor	a
		ld	(death_jump_phase), a
		jp	loc_8280
; ---------------------------------------------------------------------------

loc_8207:
		ld	a, (hl)
		add	a, d
		ld	d, a

loc_820A:
		ld	a, (walk_dx)
		or	a
		jr	z, loc_8222
		dec	a
		jr	z, loc_8218
		call	chk_can_move_left	;=0 if can
		jr	loc_821B
; ---------------------------------------------------------------------------

loc_8218:
		call	chk_can_move_right ;a=0 if can walk


loc_821B:
		jr	nz, loc_8222
		ld	a, (walk_dx)
		add	a, e
		ld	e, a

loc_8222:
		ld	a, sprPlayerPhase3	;3-jump phase?

; a  - sprite

ShowPlayerSprite:
		ld	c, a
		ld	a, (flag_Exoskeleton)
		add	a, c

show32xsprite:
		ex	af, af'
		ld	a, e
		cp	128
		ld	a, d
		jr	z, nextZONEPrepare ; A - player	Y pos

		ld	c, 47h ; 'G'
		ex	af, af'
		call	fillAttr_3x4

		ld	bc, (Player_X_Pos) ; 0..127
		ld	(Player_X_Pos),	de ; 0..127

		ld	hl, (byte_8269)
		cp	l
		jr	nz, loc_824A
		ld	h, b
		ld	l, c
		and	a
		sbc	hl, de
		ret	z

loc_824A:
		ld	(byte_8269), a
		ld	hl, SpriteBuf24x32
		jp	Sprite24x32_Player ;
					; 00-09	- WALK
					; 10 - Duck
					; 11 - DIE
					; 12-21	WALK 2gun
					; 22 - Duck2gun
					; 23 - Die 2gun
					; 24 - PUMP
					;

; =============== S U B	R O U T	I N E =======================================

; A - player Y pos

nextZONEPrepare:
		ld	(Player_Y_Pos),	a ; 0x70 - ground
		ld	(PlayerXY_COPY+1), a

		ld	(UpdateZoneRequired), a

		ld	a, (_ZONE)
		inc	a
		ld	(_ZONE), a

		ld	a, 0FFh
		ld	(byte_8269), a
		ret

; ---------------------------------------------------------------------------
byte_8269:	db 0

death_jump_tab:
		db    4,   4,	2,   2,	  2
		db    1,   1,	1,   1,   0
		db    0,   0,   0,  -1,  -1
		db   -1,  -1,  -2,  -2,  -2
		db   -4,  -4
; ---------------------------------------------------------------------------

loc_8280:
		xor	a
		ld	(flag_fall_down), a
		call	chk_can_move_down	;=0 if can
		jr	nz, loc_8295
;falldown
		inc	d
		inc	d
		inc	d
		inc	d

		ld	a, sprPlayerPhase9	;9 - falldown sprite
		ld	(flag_fall_down), a
		jr	ShowPlayerSprite ; a	- sprite

flag_fall_down:	db 0


loc_8295:
;keyLeftpressed ^ keyRightpressed
;=1 only if pressed single key left or right
		ld	hl, (key_LEFT)
		ld	a, h
		xor	l
		ld	(walk_dx), a

		;no move - stay (sprite 5)
		ld	a, sprPlayerPhase5	;5 plain walk
		jp	z, ShowPlayerSprite ;	a  - sprite

		ld	a, 1
		ld	(player_direction_DX), a

		bit	0, l 			;right
		jr	z, move_right

		ld	a, -1
		ld	(walk_dx), a
		ld	(player_direction_DX), a

		ld	a, (playerSpriteDirection) ;	0 - to right, 1	- to left
		or	a
		call	z, swapBigSprite ; Swap	sprites	to left/right when move	in left/right directions
		jr	z, change_player_direction

		call	chk_can_move_left	;=0 if can

		jr	loc_82CD
; ---------------------------------------------------------------------------

move_right:
		ld	a, (playerSpriteDirection) ;	0 - to right, 1	- to left
		or	a
		call	nz, swapBigSprite ; Swap sprites to left/right when move in left/right directions
		jr	nz, change_player_direction

		call	chk_can_move_right ;a=0 if can walk

loc_82CD:
		ld	a, sprPlayerPhase5	;5-plainwalk
		jp	nz, ShowPlayerSprite ; a  - sprite

		ld	a, (walk_dx)
		add	a, e
		ld	e, a

		ld	a, (player_walk_phase)
		cp	sprPlayerPhase9+1	;10-max phase
		jr	nz, no_reset_phase
		xor	a

no_reset_phase:
		ld	b, a
		inc	a
		ld	(player_walk_phase), a
		ld	a, b
		jp	ShowPlayerSprite ; a	- sprite
; ---------------------------------------------------------------------------

change_player_direction:
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, sprPlayerPhase5	;5
		jp	ShowPlayerSprite ; a	- sprite
; ---------------------------------------------------------------------------
UpdateZoneRequired:
		db 0
PlayerXY_COPY:	dw 0
Player_X_Pos:	db 0	; 0..127
Player_Y_Pos:	db 0	; 0x70 - ground
death_jump_phase:
		db 0
walk_dx:	db 1
player_walk_phase:
		db 0
player_direction_DX:
		db 1
flag_duck_y:	db 0
