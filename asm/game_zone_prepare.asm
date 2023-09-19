;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;show zone
;1. clear all buffers
;2. get addr of zone info (db y,x,blk; db 0xff)
;3. add element in "destroyable" tab if requre
;4. show block (and fill no_walk_tab and over_player_tab)
;5. loop while all element on level
;6. init_Level_Actions no_walk_tab contains "actions". fill structures if exist
;7. init specific actions if require

new_zone_if_required:
		ld	a, (UpdateZoneRequired)
		or	a
		ret	z

		xor	a
		ld	(Player_X_Pos),	a
		ld	(PlayerXY_COPY), a

		call	osd_ZONE

build_zone_screen:

		ld	hl, 0
		ld	(delay_to_killer), hl

		xor	a
		ld	(grenade_phase), a
		ld	(dead_sprite_delay2),	a
		ld	(flag_LongDelayKiller), a

		call	clr_SpriteBuffers
		call	clr_over_player_tab
		call	clr_no_walk_tab
		call	clr_myBullets
		call	clr_Gun_machine_bullets
		call	clr_MineBuf
		call	clr_ExplosionParicles
		call	clr_MachineGun
		call	clr_AnimatedParticles
		call	clr_Spheres
		call	clr_Pump
		call	clr_Rockets
		call	clr_TeleportParticles
		call	clr_EnemyData
		call	clr_AfterLifeObject
		call	clr_BonusPoints
		call	clr_PlayScreen

		ld	a, (_ZONE)
		ld	bc, ZONE_TAB
		call	get_hl_a_BC

		ld	ix, destroyableBuffer

build_zone_loop:
		ld	a, (hl)
		cp	0FFh
		jr	z, zone_done

		ld	d, a		; y
		inc	hl
		ld	e, (hl)		; x
		inc	hl
		push	hl
		ld	a, (hl)		; block

		call	update_destoryabl_objects 	; ix -	buffer
							; a - block id

		;put "block" to screen
		;also tables no_walk_tab and over_player_tab
		;no_walk_tab also contain information about "actions" and will be used in init_Level_Actions

		ld	bc, xZoneBlock
		call	get_hl_a_BC

		ld	a, 1
		ld	(noWalkFlag+1),	a

		xor	a
		ld	(overPlayerFlag+1), a

		ld	c, a
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		pop	hl
		inc	hl
		jp	build_zone_loop
; ---------------------------------------------------------------------------

zone_done:
		ld	(ix+0),	0FFh	;set "END" mark in destroyable buffer

		call	_save_attr_table

		call	init_random_stars

		call	init_Level_Actions 	;init "actions" structures if exist on level

		;additionally init specific actions if exist
		call	init_Spheres
		call	init_Enemies
		call	init_greenSphereRocket
		jp	init_BEAM

; ---------------------------------------------------------------------------

_ZONE:		db 0

; =============== S U B	R O U T	I N E =======================================


get_hl_a_BC:
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
