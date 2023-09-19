;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

KillPlayer_unless_Exoskeleton:
		ld	a, (flag_Exoskeleton)
		or	a

;cheat_ignore_mine:
		ret	nz


; =============== S U B	R O U T	I N E =======================================


KillPlayer:
		ld	a, (Die_Animation_Step)
		or	a
		ret	nz
		ld	a, (dead_sprite_delay2)
		or	a
		ret	nz
		push	af
		push	de
		ld	hl, 0
		ld	(delay_to_killer), hl
		xor	a
		ld	(death_jump_phase), a
		ld	(firePressDelay), a

		if	CHEAT_NO_DEATH
		ld	a, 0
		else
		ld	a, 46
		endif

		ld	(Die_Animation_Step), a

		add	a, 14h
		ld	(dead_sprite_delay2),	a

		ld	de, (Player_X_Pos) ; 0..127
		ld	a, d
		and	-4
		ld	d, a

		ld	a, sprPlayerDie		;11-dead player sprite ?
		call	ShowPlayerSprite ; a	- sprite
		pop	de
		pop	af
		ret

; ---------------------------------------------------------------------------
Die_Animation_Step:db 0
					; KillPlayerr	...
; ---------------------------------------------------------------------------

update_die_player_animation:
		ld	a, (Die_Animation_Step)	; 40..0
		or	a
		ret	z

		ld	de, (Player_X_Pos) ; 0..127
		ld	c, a
		dec	a
		ld	(Die_Animation_Step), a
		jr	z, DIE?

		ld	hl,  loc_9D48+1	; DieYJumpTable-1
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		cp	10
		jr	nc, loc_9D06
		call	chk_can_move_down	;=0 if  can
		ld	a, sprPlayerDie 	;11
		jp	nz, ShowPlayerSprite ; a  - sprite

loc_9D06:
		ld	a, (hl)
		add	a, d
		ld	d, a
		ld	a, sprPlayerDie 	;11-dead_player
		jp	ShowPlayerSprite ; a	- sprite
; ---------------------------------------------------------------------------

DIE?:
		ld	a, (playerSpriteDirection) ;	0 - to right, 1	- to left
		or	a
		call	nz, swapBigSprite ; Swap sprites to left/right when move in left/right directions

		ld	a, 1
		ld	(player_direction_DX), a

		ld	a, (_LIVES)

cheatLife:
					; CheckGameRestart7890-29CAw
		dec	a
		ld	(_LIVES), a
		ld	a, 99
		ld	(_AMMO), a
		ld	a, 10
		ld	(_GRENADES), a
		call	osd_AMMO
		call	osd_GRENADES
		call	osd_LIVES
;
		ld	a, (_LIVES)
		or	a
		jp	z, _game_over
;
		ld	de, (PlayerXY_COPY)

land_player_?????:
		call	chk_can_move_down	;=0 if  can
;
		ld	a, sprPlayerPhase5	;5
		jp	nz, ShowPlayerSprite ; a  - sprite
		inc	d

loc_9D48:
		jr	land_player_?????
; ---------------------------------------------------------------------------
DieYJumpTable:	db    4,   4,	4,   4,	  4,   4,   4,	 4; 0
		db    4,   4,	4,   4,	  4,   4,   4,	 4; 8
		db    4,   4,	4,   4,	  4,   4,   4,	 4; 16
		db    4,   4,	2,   2,	  2,   1,   1,	 1; 24
		db    1,   0,	0,   0,	  0,  -1,  -1,  -1
		db   -1,  -2,  -2,  -2,  -4, -4
		; 0FFh,0FFh,0FFh; 32
		;db 0FFh,0FEh,0FEh,0FEh,0FCh,0FCh; 40

; =============== S U B	R O U T	I N E =======================================


doRetIfPlayerAlreadyDie:
		ld	a, (Die_Animation_Step)
		or	a
		ret	z
		pop	af
		ret
