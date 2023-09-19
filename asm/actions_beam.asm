;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;onScreen object (see screen 35)
;Vertical BEAM, blink an generate "electric" sound on AY
;played died when touch it
;can be destroed, 25 shot to it (single or double, no rocket)
;screen description containt x,y of beam start
;in init_ function beam showed from y+1 to next "noWalk" char (y+1)

init_BEAM:
		ld	de, (xyBeam)
		bit	7, e
		ret	nz

		inc	d
		ld	hl, FONT_ZONE_00
		ld	(FontPTR+1), hl

		xor	a
		ld	(beam_ShotCount), a
		ld	(overPlayerFlag+1), a

		inc	a
		ld	(noWalkFlag+1),	a
		ld	bc, 1

beam_show_lp:
		ld	a, 0x25 	; FONT_ZONE_00 - vertical block
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	d
		inc	b
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		push	de
		ld	de, no_walk_tab	; ?AnimationTab?
		add	hl, de
		pop	de
		ld	a, (hl)
		or	a
		jr	z, beam_show_lp

		ld	a, b
		ld	(beam_Length), a
		ret

xyBeam:		dw 0
		db 0FFh

;----------------------------------------------------------------------
update_Beam:
		ld	de, (xyBeam)	; XY?
		bit	7, e
		ret	nz

		call	snd_vertical_laser_beam
		inc	d
		ld	a, (beam_Length)
		ld	b, a
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	de, 32

ChangeBeamColor:
		ld	a, (tick_db)
		and	7
		or	40h ; '@'
		ld	(hl), a
		add	hl, de
		djnz	ChangeBeamColor

		;player died if touch a beam ....

		ld	de, (xyBeam)	; XY?
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_X_Pos) ; 0..127
		add	a, 12
		cp	e
		jp	z, KillPlayer
		ret


; =============== S U B	R O U T	I N E =======================================

;iterate each bullet and check it hit beam ....

chk_destroy_beam:
		ld	de, (xyBeam)	; XY?
		bit	7, e
		ret	nz

		dec	e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	hl, myBullets

lp_beam_hit:
		ld	c, (hl)
		bit	7, c
		ret	nz

		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, lp_beam_hit
		ld	a, e
		cp	c
		jr	nz, lp_beam_hit

		ld	a, (beam_ShotCount)
		inc	a
		ld	(beam_ShotCount), a
		cp	25

;set nop for one shot beam destroy
cheat_one_shoot_beam_destroy:
		ret	c

		ld	hl, FONT_ZONE_00
		ld	(FontPTR+1), hl
		ld	de, (xyBeam)
		ld	a, (beam_Length)
		ld	b, a
		inc	d

lp_destroy_beam:
		call	RND
		and	7
		or	42h
		ld	c, a
		ld	a, 25h 		; vertical block
		call	PutCharXorRemoveObject_2boom
		inc	d
		djnz	lp_destroy_beam
;
		ld	a, 0FFh
		ld	(xyBeam), a	; XY?
		ld	a, 40		; 25*40=1000 points
		call	snd_first_first_gun
		jp	add_A_bonus_and_snd

; ---------------------------------------------------------------------------
beam_Length:	db 0
beam_ShotCount:	db 0

