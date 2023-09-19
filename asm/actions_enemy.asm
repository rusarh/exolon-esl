;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

move_FlyingEnemy:
		ld	iy, enemySpriteBuf
		ld	hl, _enemy_data

enemyDataLoop:
		ld	e, (hl)		; x
		bit	7, e
		ret	nz

		push	hl
		inc	hl
		ld	d, (hl)		; y
		inc	hl
		ld	a, (hl)		; inuse
		or	a
		jp	z, emNext

		push	de
		inc	hl
		inc	hl		; dw strategy src
		inc	hl

		ld	c, (hl)
		inc	hl
		ld	b, (hl)		; bc - strategy	work
		inc	hl
		ld	a, (hl)		; sequence_c4_len
		or	a
		jr	nz, doC4Step

processEnemyDataLoop:
		ld	a, (bc)		; dx

		cp	0C4h ; 'Ä'
		jp	z, prepareC4	; loop ?

		cp	0C3h ; 'Ã'
		jp	z, restartSequence ; last byte ?

		add	a, e
		ld	e, a
		inc	bc

		ld	a, (bc)		; dy
		add	a, d
		ld	d, a

		inc	bc
		dec	hl
		ld	(hl), b
		dec	hl
		ld	(hl), c
		jp	showHideSprite?	; prev xy

; ---------------------------------------------------------------------------

doC4Step:
		dec	(hl)
		ld	a, (bc)
		add	a, e
		ld	e, a
		inc	bc
		ld	a, (bc)
		add	a, d
		ld	d, a
		jp	showHideSprite?	; prev xy

; ---------------------------------------------------------------------------

prepareC4:
		inc	bc
		ld	a, (bc)		; len?
		dec	a
		ld	(hl), a
		inc	bc
		dec	hl
		ld	(hl), b
		dec	hl
		ld	(hl), c
		inc	hl
		inc	hl
		jr	doC4Step

; ---------------------------------------------------------------------------

restartSequence:
		dec	hl
		dec	hl
		dec	hl
		ld	b, (hl)
		dec	hl
		ld	c, (hl)
		inc	hl
		inc	hl
		ld	(hl), c
		inc	hl
		ld	(hl), b
		inc	hl
		jp	processEnemyDataLoop ; dx

; ---------------------------------------------------------------------------

showHideSprite?:
		pop	bc		; prev xy
		pop	hl		; str ptr
		push	hl

		ld	a, e
		cp	128
		jp	nc, enemyOutOfScreen

		ld	a, d
		cp	176
		jp	nc, enemyOutOfScreen

; save new xy
		ld	(hl), e
		inc	hl
		ld	(hl), d

		push	de
;
		ld	de, 7
		add	hl, de
		ld	a, (hl)		; sprite phase
		inc	(hl)
		and	3
active_enemy_sprite_id:
		add	a, 1		; sprite base number

		pop	de

		push	hl
		push	iy
		pop	hl
		call	Sprite16x16
		pop	hl

		inc	hl
		ld	c, (hl)		;color
		call	fillAttr_2x2
		jp	emNext
; ---------------------------------------------------------------------------

enemyOutOfScreen:
		inc	hl
		inc	hl
		ld	(hl), 0
		xor	a
		push	iy
		pop	hl
		call	Sprite16x16
emNext:
		pop	hl
		ld	de, 10
		add	hl, de
		ld	de, 3*16	;48
		add	iy, de
		jp	enemyDataLoop	; x

; ---------------------------------------------------------------------------
	include 	"actions_enemy_trajectory.asm"
; ---------------------------------------------------------------------------

_enemy_data:
		ds 	6*10
; 		str_enemy <0>
		db 0FFh
; str_enemy	struc ;	(sizeof=0xA)
; X:		db ?
; Y:		db ?
; flag_inuse:	db ?
; stratrgy_src:	dw ?
; stratrgy_work:dw ?
; c4_counter?:	db ?
; phase?:	db ?
; color?:	db ?
; str_enemy	ends
; =============== S U B	R O U T	I N E =======================================


clr_EnemyData:
		ld	hl, _enemy_data
		ld	de, _enemy_data+1
		ld	bc, 6*10-1
		ld	(hl), 0
		ldir
		ret

; =============== S U B	R O U T	I N E =======================================


add_new_FlyingEnemy:
		call	doRetIfPlayerAlreadyDie
		ld	a, (fl_enemy)
		or	a

cheat_no_enemy:				; replace to RET
		ret	z

		ld	hl, delayToNextEnemy
		ld	a, (hl)
		or	a
		jr	z, new_enemy_fl

CHEAT_FLYING:				; change to NOP	- remove flying	enemy
		dec	(hl)
		ret

; ---------------------------------------------------------------------------

new_enemy_fl:
		ld	a, (Player_X_Pos) ; 0..127
		cp	84		; 2/3 of screen, no new	enemy if player	of 3 part of screen
		ret	nc

		ld	hl, _enemy_data
		ld	bc, 10		; struct size

loc_A570:
		ld	e, (hl)
		bit	7, e
		ret	nz

		push	hl
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, found_empty_enemy_slot
		pop	hl
		add	hl, bc
		jr	loc_A570
; ---------------------------------------------------------------------------

found_empty_enemy_slot:
		pop	hl
		call	RND
		cp	200
		ret	c

		ld	(hl), 120	; start x ?
		inc	hl
		ld	de, (Player_X_Pos)

		call	RND
		cp	175
		jr	c, loc_A599

		ld	a, d
		sub	10		; y-10
		jr	loc_A59F	; Y
; ---------------------------------------------------------------------------

loc_A599:
		call	RND
		and	0Fh
		add	a, d		; y+rnd(0..15)

loc_A59F:
		ld	(hl), a		; Y
		inc	hl
		ld	(hl), 1		;active
		inc	hl

active_enemy_trajecory:
		ld	de, enemy_trajectory_01		;changed by init
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), 0		; +7
		inc	hl
		ld	(hl), 3		; +8
		inc	hl

		call	RND
		and	7
		cp	2
		jr	nc, loc_A5C0
		add	a, 4
loc_A5C0:
		or	40h ; '@'
		ld	(hl), a		; +9 Color

active_enemy_delay:
		ld	a, 9				;changed by init
		ld	(delayToNextEnemy), a
		ret

; ---------------------------------------------------------------------------

delayToNextEnemy:db 0

; =============== S U B	R O U T	I N E =======================================


chk_destroy_enemy:
		ld	iy, enemySpriteBuf
		ld	hl, _enemy_data

cde_loop:
		ld	e, (hl)		; x
		bit	7, e
		ret	nz

		push	hl
		inc	hl
		ld	d, (hl)		; y
		inc	hl
		ld	a, (hl)		; flag
		or	a
		jr	z, cde_next
		call	chk_enemy_hitted_by_bullet
		or	a
		jr	z, cde_next
		pop	hl
		push	hl
		call	destroy_enemy

cde_next:
		pop	hl
		ld	de, 10			;to next enemy
		add	hl, de
		ld	de, 3*16		;to next sprite buf
		add	iy, de
		jr	cde_loop

; =============== S U B	R O U T	I N E =======================================


chk_killed_by_enemy:

		ld	iy, enemySpriteBuf
		ld	hl, _enemy_data

ckbe_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, ckbe_skip
		ld	bc, 804h
		inc	e
		inc	e
		inc	d
		inc	d
		inc	d
		inc	d
		call	chkPlayerInZone
		or	a
		jr	z, ckbe_skip
		pop	hl
		push	hl
		dec	e
		dec	d
		dec	d
		call	destroy_enemy
		call	KillPlayer

ckbe_skip:
		pop	hl
		ld	de, 10			;to next enemy
		add	hl, de
		ld	de, 3*16		;to next sprite buf
		add	iy, de
		jr	ckbe_loop


; =============== S U B	R O U T	I N E =======================================


destroy_enemy:
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl

		xor	a
		ld	(hl), a		;reset active flag

		push	iy
		pop	hl

		call	Sprite16x16
		call	add_AfterLifeObject
		call	snd_destroy_ball

		ld	de,  a000150+5
		jp	addPoints

; =============== S U B	R O U T	I N E =======================================

	include 	"actions_enemy_init.asm"