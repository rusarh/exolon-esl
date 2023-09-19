;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

update_Spheres:
		ld	hl, spheresBUF	; up to	24 spheres on screen

spheresLoop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, chkNextSphere

		inc	hl

		;xor erase sprite

		ld	a, 7		; 7 - Spheres
		call	Sprite8x8_XOR_Preshifted

		ld	a, e
		or	a
		jr	z, sphere_bounce_dx

		cp	123
		jr	z, sphere_bounce_dx

		call	RND
		cp	220
		jr	nc, sphere_bounce_dx

		ld	a, (hl)
		inc	a
		jr	nz, sp_chk_right

		call	chk_free_left
		jr	chk_dx_move
; ---------------------------------------------------------------------------

sp_chk_right:
		call	chk_free_right

chk_dx_move:
		or	a
		jr	z, spx_can_move

sphere_bounce_dx:
		ld	a, (hl)
		neg
		ld	(hl), a

spx_can_move:
		ld	a, (hl)
		add	a, e
		ld	c, a

		;dy part
		call	RND
		and	1
		jr	z, loc_9A65
		inc	a
loc_9A65:
		dec	a
		ld	b, a
		cp	0FFh
		jr	nz, chk_y_up

		call	chk_free_down
		jr	chk_y_result
; ---------------------------------------------------------------------------

chk_y_up:
		call	chk_free_up

chk_y_result:
		or	a
		jr	z, possible_change_y
		ld	b, 0

possible_change_y:
		ld	a, b
		add	a, d
		ld	d, a
		or	a
		jr	nz, fix_y0
		inc	d

fix_y0:
		ld	e, c
		ld	a, 7		; 7 - Spheres
		call	Sprite8x8_XOR_Preshifted

		ld	c, 42h 		;red
		call	fillAttr_1x1
		pop	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		dec	hl
		jr	to_next_sphere
; ---------------------------------------------------------------------------

chkNextSphere:
		pop	hl

to_next_sphere:
		ld	de, 4
		add	hl, de
		jp	spheresLoop

; ---------------------------------------------------------------------------
spheresBUF:
		ds 	24*4
; 		strSpheres <0>
		db 0FFh

; strSpheres	struc ;	(sizeof=0x4)
; x:		db ?
; y:		db ?
; fl1:		db ?
; fl2:		db ?
; strSpheres	ends

; =============== S U B	R O U T	I N E =======================================


clr_Spheres:
		ld	hl, spheresBUF
		ld	de, spheresBUF+1
		ld	bc, 24*4-1	;95
		ld	(hl), b
		ldir
		ret

; =============== S U B	R O U T	I N E =======================================


init_Spheres:
		ld	ix, spheresBUF	; up to	24 spheres on screen
		ld	hl, xySphereHome ; up to 3 sphere home

nextSphereHome:
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		inc	e
		inc	e		; x+2
		inc	d
		inc	d
		inc	d		; y+3

		ld	bc, 4 		;structrure size
		ld	a, 8 		;8 spheres in a box?
addNextSphere:
		ex	af, af'
		ld	(ix+0),	e
		ld	(ix+1),	d
;

		;looks so strange !!!!!!!!!!!
		;not visible on screen
		ld	a, 4		; 4 - Boom3 ??????????
		call	Sprite8x8_XOR_Preshifted

		ld	(ix+2),	1

		;rnd dx
		call	RND
		and	1
		or	a
		jr	z, loc_9B3B
		inc	a

loc_9B3B:
		dec	a
		ld	(ix+3),	a 	; dx
		;rnd dx

		add	ix, bc
		ld	(ix+0),	0FFh	; stop mark
		ex	af, af'
		dec	a
		jr	nz, addNextSphere
		jr	nextSphereHome

; ---------------------------------------------------------------------------
xySphereHome:
		ds 	3*2
; 		str_XY <0>		; up to	3 sphere home
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


chk_destroy_sphere:
		ld	hl, spheresBUF	; up to	24 spheres on screen

destroy_sphere_lp:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		inc	hl
		or	a
		jr	z, destroy_sphere_lp

		call	chk_destroyd_by_my_bullet
		or	a
		call	nz, destroy_sphere

		jr	destroy_sphere_lp

; =============== S U B	R O U T	I N E =======================================


destroy_sphere:
		;erase sphere
		ld	a, 7		; 7 - Spheres
		call	Sprite8x8_XOR_Preshifted
		dec	hl
		dec	hl
		ld	(hl), 0
		inc	hl
		inc	hl
		call	add_AnimatedParticle
		call	snd_destroy_ball
		ld	de,  a000050+5
		jp	addPoints

; =============== S U B	R O U T	I N E =======================================


chk_destroyd_by_my_bullet:
		push	bc
		push	de
		push	hl
		inc	e
		inc	e
		ld	hl, myBullets

chkd_loop:
		xor	a
		ld	c, (hl)
		bit	7, c
		jr	nz, chkd_exit
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, chkd_loop
		ld	a, c
		sub	e
		cp	0FCh
		jr	c, chkd_loop
		ld	a, b
		sub	d
		sub	9
		cp	0F6h
		jr	c, chkd_loop
		ld	d, b
		ld	e, c
		call	show_my_bullet
		dec	hl
		ld	(hl), 0
		ld	a, 1

chkd_exit:
		pop	hl
		pop	de
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


chk_Killed_by_sphere:
		ld	hl, spheresBUF	; up to	24 spheres on screen

loc_9BB7:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		inc	hl
		or	a
		jr	z, loc_9BB7

		ld	bc, 804h
		call	chkPlayerInZone
		or	a
		jr	z, loc_9BB7

		call	destroy_sphere
		call	snd_destroy_ball
		jp	KillPlayer


; =============== S U B	R O U T	I N E =======================================


;BC - zoneY,ZoneX
;DE - YX
;a=1 if inZone

chkPlayerInZone:
		push	hl
		ld	a, c
		add	a, 12
		neg
		ld	l, a
		ld	a, (Player_X_Pos)
		sub	e
		sub	c
		cp	l
		ld	a, 0
		jr	c, notInZone

		ld	a, (flag_duck_y)
		or	a
		jr	nz, chk_duck

		ld	a, b
		add	a, 32
		neg
		ld	h, a
		ld	a, (Player_Y_Pos)
		sub	d
		sub	b
		cp	h
		ld	a, 0
		jr	c, notInZone
		inc	a
notInZone:
		pop	hl
		ret

chk_duck:
		ld	a, b
		add	a, 26
		neg
		ld	h, a
		ld	a, (Player_Y_Pos)
		add	a, 6
		sub	d
		sub	b
		cp	h
		ld	a, 0
		jr	c, notInZone
		inc	a
		pop	hl
		ret
