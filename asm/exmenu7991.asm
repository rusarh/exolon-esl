;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

	include	"defs.asm"

DEBUG_DISABLE_AY 	equ 	0

CHEAT_NO_CANNON_FIRE 	equ 	0
CHEAT_SUPER_SHIELD 	equ 	0
CHEAT_LIFE 		equ 	0
CHEAT_NO_DEATH 		equ 	1
CHEAT_AMMO 		equ 	0
FIX_SPRITE16x16COM	equ	0

	include "sna_header.asm"

	ORG	0x4000
SCRLINE000:
	db	0
	ORG	0x5800
ATTR_TABLE:
	db   	0

	ORG	0x5b00
over_player_tab:
	db 	0
	ORG	0x5e00
ATTR_TABLE_COPY:
	 	db 	0
;array 32x24
;=0 - empty
;=1 - not empty, player	can't walk
;=xx - animation code
	ORG	0x6100
no_walk_tab: 	db 	0

	ORG	0x6400
bitSwapTab:
		db 	0

	ORG	0x6500
Y2SCR_HI:
	db 	0

	ORG	0x6600
Y2SCR_LO:
		db 	0

	ORG	0x6700

scr_addr_8:		;used for scrolling highscore table
		db 	0

		ORG	0x6D60
START:
		.assert START==0x6d60

		di
		ld	sp, 0 		;looks strange, but as in original

; 		if CHEAT_LIFE
; 		ld 	a,0
; 		ld 	(cheatLife),a
; 		endif


		if DEBUG_DISABLE_AY==0
		ld	a, (0x386E) ; ZX48 - FF, ZX128 - 37
		sub	0FFh
		else
 		xor 	a 	;ESL force 48 music
 		endif

		ld	(FlagZX128), a	; 00 - zx48
;
		xor	a
		out	(0FEh),	a
;
		ld	(Die_Animation_Step), a
		ld	(_ZONE), a


		if CHEAT_SUPER_SHIELD
		ld 	a,0x0C
		endif
		ld	(flag_Exoskeleton), a
		if CHEAT_SUPER_SHIELD
		xor 	a
		endif

;
		ld	hl, 0
		ld	(addBonusCount), hl
;
		inc	a
		ld	(flag_BeeperMenuMusic),	a ; play beeper	music first time only
;
		call	InitScrAddrTables
		call	initBitSwapTab
;
		ld	hl, points	; "000000"
		ld	de,  points+1
		ld	(hl), '0'
		ld	bc, 5
		ldir
;
		ld	a, 9
		ld	(_LIVES), a
;
		ld	a, (HiScoreUpdatedFlag)
		or	a
		jp	nz, ShowHiscoreTable


;ESL DEBUG START LEVEL
; 		ld 	a,0
; 		ld 	a,5 	;planet 35,36,37 + birthpod
; 		ld 	a,7 	;mines
; 		ld 	a,8 	;Green Sphere & Teleport & RedSpheres
; 		ld 	a,13 	;3 pump
; 		ld 	a,14 	;3 pump
; 		ld 	a,20	;2 swarm, 2 pump
; 		ld 	a,23 	;pump and GunMachine2
; 		ld 	a,24 	;S1L24 LevelEnd,HighVoltage, Flash
; 		ld 	a,27	;lvl 28  good for demonstrate fix Sprites16x16_OnScreen_count
; 		ld 	a,38	;lvl 28  good for demonstrate fix Sprites16x16_OnScreen_count
; 		ld 	a,28 	;double launcher, RedSpheres
; 		ld 	a,25 	;S2L1 HighVoltage
; 		ld 	a,34 	;RedSpheres wo/box
; 		ld 	a,35 	;beam & mine
; 		ld 	a,36 	;enemy
; 		ld 	a,50 	;
; 		ld 	a,53	;3 level, semitransparent vblox, gun+rocket
; 		ld 	a,55 	;
; 		ld 	a,66 	;
; 		ld 	a,70 	;
; 		ld 	a,90	;change box + Enemy
; 		ld 	a,94	;bug in green ground
; 		ld 	a,115	;2birthpod
; 		ld 	a,117	;2 green ground + 2pump

; 		ld 	a,73	;single ground cells
; 		ld 	a,76	;single ground cells
; 		ld	(_ZONE), a
;ESL DEBUG START LEVEL


xmenu:

		call	ClearToBLACK
		call	clr_no_walk_tab
		call	clr_over_player_tab
		ld	bc, 31		; force	last line to
		ldir

		ld	hl, xMSG_MENU
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y

		call	highLightSelectedContorol
		call	Init_AY_Music?

		ld	a, (flag_BeeperMenuMusic)
		or	a
		jr	z, skipBeeperMenuMsic

		xor	a
		ld	(flag_BeeperMenuMusic),	a

		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, skipBeeperMenuMsic

		ld	hl, menuMusic
		call	playBeeperMusic

skipBeeperMenuMsic:
					; CheckGameRestart7890-2C50j
		call	_save_attr_table
		call	clr_SpriteBuffers
		call	clr_menuStars

		ld	bc, 2500	; Delay	to show	hiscore


menuLoop:
		call	starsAnimationStep
		call	GetKEY
		cp	'1'
		jr	c, noMenuKEY
		cp	'6'
		jr	nc, noMenuKEY
		cp	'1'
		jp	z, StartGame
		cp	'2'
		jp	z, DefineKeys
		sub	'3'
		ld	e, a
		ld	a, (active_control)
		cp	e
		jr	z, noMenuKEY
		ld	a, e
		ld	(active_control), a
		ld	hl, xMSG_MENU
		push	bc
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		call	highLightSelectedContorol
		pop	bc

noMenuKEY:

		dec	bc
		ld	a, b
		or	c
		jp	z, ShowHiscoreTable2
		jp	menuLoop

; ---------------------------------------------------------------------------
FlagZX128:	db 0DEh

					; 00 - zx48

	include 	"data_msg_menu.asm"

	include 	"menu_stars.asm"

	include 	"menu_highlight_control.asm"

	include 	"menu_redefine_key.asm"

; UNUSED
;
; xMSG_SetFontMain:db _E6_DW_FONT
; 		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
; 		db _FF_EndMSG
;

	include 	"data_msg_exolon.asm"

	include 	"menu_highscore.asm"

	include 	"game_loop.asm"
	include 	"game_info_full.asm"
	include 	"graphics_sprites_code_24x32.asm"
	include 	"graphics_sprites_code_16x16.asm"
	include 	"utils_keys2.asm"
	include 	"utils_bitswap.asm"
	include 	"utils_init_tables.asm"
;UNUSED
; 		db    6
; 		db  37h	; 7

	include 	"sound_sound48.asm"
	include 	"graphics_fill_attr.asm"
	include 	"utils_keys3_2.asm"
	include 	"sound_beeper_music.asm"
	include 	"game_get_offset.asm"

	include 	"player_move.asm"
	include		"player_fire_bullets.asm"

	include 	"game_zone_prepare.asm"
	include 	"data_zone_blocks.asm"

	include 	"utils_clr_tabs.asm"

	include 	"game_info.asm"
	include 	"game_init_actions.asm"

	include 	"actions_torch.asm"
	include 	"actions_gun_machine.asm"
	include 	"actions_flash_bar.asm"
	include		"actions_mines.asm"

	include 	"player_grenades.asm"

	include 	"graphics_sprites_code_8x8_preshifted.asm"
	include 	"game_chk_free.asm"
	include 	"game_destroyable_objects.asm"

	include		"actions_particles_explosion.asm"
	include		"actions_particles_animated.asm"

	include 	"actions_teleport.asm"

; _Dx4_Ex8
; d*4
; e*8
;

block2xy:
		push	af
		ld	a, e
		add	a, a
		add	a, a
		ld	e, a		; 4
		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		ld	d, a		; 8
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================

	include 	"actions_boxes_ammo_grenade.asm"
	include 	"graphics_putchar_select.asm"
	include 	"utils_key_7890.asm"
	include 	"actions_spheres.asm"
	include 	"actions_pump.asm"
	include 	"player_die.asm"
	include 	"actions_rocketlauncher.asm"
	include 	"graphics_sprites_compensate.asm"
	include 	"game_bonus.asm"

flag_Exoskeleton:
		db 0

	include 	"actions_teleport_particles.asm"
	include 	"actions_changing_room.asm"
	include 	"game_enemy_hitted_by_bullet.asm"
	include 	"game_afterlife_objects.asm"
	include 	"game_game_over.asm"
	include 	"actions_green_sphere.asm"
	include 	"menu_random_stars.asm"
	include 	"actions_bonus_points.asm"
	include 	"actions_enemy.asm"
	include 	"actions_high_voltage.asm"
	include 	"actions_level_end.asm"

; ---------------------------------------------------------------------------
;UNUSED ???
; 		call	NextScrLineAddr
; ---------------------------------------------------------------------------

	include 	"actions_beam.asm"
	include		"actions_long_dalay_killer.asm"

	include 	"utils_keys3.asm"
	include 	"utils_rnd.asm"
	include 	"game_points_add.asm"


;UNUSED ?????
; 		ld	a, d
; 		sub	b
; 		sub	9
; 		cp	0F1h ; 'ñ'
; 		ld	a, 0
; 		ret	c
; 		ld	a, e
; 		sub	c
; 		sub	9
; 		cp	0F1h ; 'ñ'
; 		ld	a, 0
; 		ret	c
; 		inc	a
; 		ret


	include 	"graphics_putchars.asm"
	include 	"graphics_xmsg.asm"
	include 	"utils_routines.asm"

	include 	"graphics_sprite_bufs.asm"

	include 	"sound_psg.asm"
	include 	"data_zone_data.asm"
	include 	"data_fonts.asm"
	include 	"data_sprites_data.asm"

_stack 		EQU 	$
		dw 	start
		ds 	0xffff-$
		db 	0


		end 	start
