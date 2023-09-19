;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; init_ - prepare object

; move_ - channge/check any onscreen object (HighVoltage, etc)
; chk_  - only check state (bonus point)
; clr_  - clear buffers

StartGame:
					; CheckGameRestart7890-2892j
		di
		call	psg_mute
		call	ClearToBLACK

		ld	a, 0FFh
		ld	(byte_8269), a

		ld	a, (playerSpriteDirection) 	; 0 - to right, 1 - to left
		or	a				; swap to Right	if requried
		call	nz, swapBigSprite 		; Swap sprites to left/right when move in left/right directions

		xor	a
		ld	(death_jump_phase), a

		inc	a
		ld	(player_direction_DX), a

		ld	hl, 7010h			; Start	position
		ld	(Player_X_Pos),	hl
		ld	(PlayerXY_COPY), hl

		ld	a, 99
		ld	(_AMMO), a

		ld	a, 10
		ld	(_GRENADES), a

		call	show2BottomLine

		call	build_zone_screen

gameLoop:
		xor	a
		ld	(Sprites8x8_OnScreen_count), a
		ld	(Sprites16x16_OnScreen_count),	a

		call	doPSG

		call	chk_KEYS

		call	move_player
		call	new_zone_if_required
		call	chk_Fire
		call	update_player_bullets

		call	move_Gun_machine_bullets
		call	update_die_player_animation

		call	chk_Mines
		call	chk_grenade
		call	move_grenade

		call	update_player_bullets

		call	update_Spheres
		call	move_Pump
		call	move_AnimatedParticles
		call	update_FlashAttr
		call	chk_refill_boxes
		call	move_ExplosionParticles

		call    update_player_bullets

		call    chk_Teleport
		call	doPSG

		ld	a, (grenade_phase)
		cp	19
		call	c, move_grenade
		call	update_player_bullets

		call	move_Gun_machine_bullets
		call	update_Torch
		call	move_GunMachine

		call	update_player_bullets

		ld	a, (grenade_phase)
		cp	19
		call	c, move_grenade

		call	update_RocketLauncher
		call	move_rocket
		call	updateBONUS
		call	move_TeleportParticles
		call	add_new_FlyingEnemy
		call	move_AfterLifeObject
		call	chk_changing_room
		call	move_RocketGreenSphere
		call	chk_BonusPoint
		call	move_FlyingEnemy
		call	update_HighVoltage
		call	chk_LevelEnd
		call	update_Beam

		call	chk_LongDelayKiller
		call	move_LongDelayKiller

		call	chk_killed_by_gunmachine_bullet
		call	chk_Killed_by_sphere
		call	chk_killed_by_pump
		call	chk_killed_by_rocket
		call	chk_killed_by_enemy

		call	chk_key_3	; step by step animation while pressing	3

		call	CheckGameRestart7890

		ld	bc, 500
		call	_delayLDIR	; BC

		call	doPSG

		call	CompensateSprites8x8preshifted
		call	CompensateSprites16x16

		ld	a, (dead_sprite_delay2)
		or	a
		jr	z, loc_767E
		dec	a
		ld	(dead_sprite_delay2),	a


loc_767E:
		ld	hl, tick_db
		inc	(hl)

		ld	hl, (delay_to_killer)
		inc	hl
		ld	(delay_to_killer), hl

		jp	gameLoop
; ---------------------------------------------------------------------------
tick_db:
		db 0

dead_sprite_delay2:
		db	0

unk_768E:
		db 0EDh,4Dh

