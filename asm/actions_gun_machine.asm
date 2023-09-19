;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

move_GunMachine:
		ld	hl, FONT_GunMachine
		ld	(FontPTR+1), hl

		ld	hl, xyGunMachine ; 4

nextGun?:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)		; delay?
		or	a
		jr	z, loc_900D

		push	hl		; Cannon delay
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc

		ld	a, (hl)
		cp	anim_GunMachine
		pop	hl
		jr	z, loc_8FD5	; phase

		push	hl
		ld	a, (hl)
		ld	(hl), 0

		call	get_GunMachineBarrelChar ; a - phase

		ld	c, 0
		call	putCharXOR
		inc	a
		inc	e
		call	putCharXOR

		ld	a, 13h
		call	putCharXOR
		dec	a
		dec	e

		call	putCharXOR
		pop	hl
		jr	loc_900D
; ---------------------------------------------------------------------------

loc_8FD5:
		ld	a, (hl)		; phase
		cp	1
		jr	nz, loc_8FEC

		call	RND
		cp	0FAh ; 'ъ'
		jr	c, loc_900D
		ld	(hl), 9

		ld	c, -1
		push	hl
		call	add_machine_gun_bullet
		pop	hl
		jr	loc_900D
; ---------------------------------------------------------------------------

loc_8FEC:
		push	hl

;CHEAT_NO_CANNON:			; change to NOP	- diasble cannon fire
		if CHEAT_NO_CANNON_FIRE == 0
		dec	(hl)
		endif
		call	get_GunMachineBarrelChar ; a - phase
		ld	c, 70
		call	putCharXOR
		inc	a
		inc	e
		ld	c, 6
		call	putCharXOR
		dec	e
		dec	hl
		ld	a, (hl)
		ld	c, 70
		call	putCharXOR
		inc	a
		inc	e
		ld	c, 6
		call	putCharXOR
		pop	hl

loc_900D:
		inc	hl
		jr	nextGun?


; =============== S U B	R O U T	I N E =======================================

; a - phase

get_GunMachineBarrelChar:
		ld	l, a
		ld	h, 0
		ld	bc, gunM_BarrelSteps-1	;gunM_BarrelSteps
		add	hl, bc
		ld	a, (hl)
		ret

; ---------------------------------------------------------------------------
;первый символ ствола (с мушкой) и следующий
;используются пары символов
gunM_BarrelSteps:
		db  	10h ,12h ,14h ,16h ,18h ,1Ah ,1Ch ,1Eh ,10h

xyGunMachine:	ds 	4*3
; 		strXYF <   0,	 0,    2>; 3
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_MachineGun:
		ld	hl, xyGunMachine ; 4
		ld	de, xyGunMachine+1 ; 4
		ld	(hl), 2
		ld	bc, 4*3-1	;11
		ldir
		ret


;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;GUN MACHINE BULLETS


show_gun_machine_bullet:
		push	af
		push	bc
		push	de
		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr

		ld	a, e
		and	3
		inc	a
		ld	b, a
		ld	a, 3

loc_904B:
		rrca
		rrca
		djnz	loc_904B

		ld	b, a
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, b
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
		jr	nz, loc_906C

		ld	bc, -0x600	; 0x5E00(AttrTableCopy) -> 0x5800 (AttrTable)
		add	hl, bc
 		ld	(hl), 47h ; 'G'

loc_906C:
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================

;de - yx (in charpos)
;c=dx (-1 as fact)
add_machine_gun_bullet:
		ld	hl, gun_machine_bullets

loc_9074:
		bit	7, (hl)
		ret	nz

		inc	hl
		inc	hl

		ld	a, (hl)		;active dx
		or	a
		jr	z, loc_9080

		inc	hl
		jr	loc_9074
; ---------------------------------------------------------------------------

loc_9080:
		ld	(hl), c 	;dx
		dec	hl

		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		inc	a
		inc	a
		inc	a		;y*8+3
		ld	d, a
		ld	(hl), a
		dec	hl

		ld	a, e
		add	a, a
		add	a, a 		;x*4
		ld	e, a
		ld	(hl), a

		call	show_gun_machine_bullet

		ld	b, 10
snd_lp_gmb:
		push	bc
		ld	b, 1Eh
		call	sound48
		pop	bc
		djnz	snd_lp_gmb

		jp	snd_first_first_gun

; =============== S U B	R O U T	I N E =======================================


move_Gun_machine_bullets:

		ld	hl, gun_machine_bullets

gmb_move_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, gmb_move_loop

		call	show_gun_machine_bullet
		add	a, e
		ld	e, a
		cp	7Fh
		jr	c, bullet_new_x

		;destroy bullet
		dec	hl
		ld	(hl), 0
		inc	hl
		jr	gmb_move_loop
; ---------------------------------------------------------------------------

bullet_new_x:
		push	hl
		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		call	show_gun_machine_bullet
		jr	gmb_move_loop

; ---------------------------------------------------------------------------
gun_machine_bullets:
		ds 	10*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


chk_killed_by_gunmachine_bullet:

		ld	hl, gun_machine_bullets

chk_gmb_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, chk_gmb_loop

		ld	bc, 0
		call	chkPlayerInZone
		or	a
		jr	z, chk_gmb_loop

		call	show_gun_machine_bullet
		dec	hl
		ld	(hl), 0 	;deactivate bullet

		jp	KillPlayer

; =============== S U B	R O U T	I N E =======================================


clr_Gun_machine_bullets:
		ld	hl, gun_machine_bullets
		ld	de, gun_machine_bullets+1
		ld	bc, 10*3-1 	;29
		ld	(hl), b
		ldir
		ret
