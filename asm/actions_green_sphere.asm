;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

init_greenSphereRocket:
		xor	a
		ld	(flag_RocketGreenSphere), a

		ld	de, (xyGreenSphereWithLines)
		bit	7, e
		ret	nz

		ld	a, (Die_Animation_Step)
		or	a
		ret	nz

		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
		ld	a, (hl)
		cp	anim_GreenSphere
		ret	nz

		ld	(flag_RocketGreenSphere), a
		call	RND
		and	7Fh
		add	a, 32 		;20h
		ld	h, a		;y=rnd(127)+32
		ld	l, 120
		ld	(xyRocketGreenSphere), hl
		ret

; ---------------------------------------------------------------------------
xyGreenSphereWithLines:
		dw 0
xyRocketGreenSphere:
		dw 0
flag_RocketGreenSphere:
		db 0

; =============== S U B	R O U T	I N E =======================================


move_RocketGreenSphere:
		ld	a, (flag_RocketGreenSphere)
		or	a
		jp	z, init_greenSphereRocket

		ld	de, (xyGreenSphereWithLines)
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, (xyRocketGreenSphere)
		push	de
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
		ld	a, (hl)
		cp	anim_GreenSphere
		jr	nz, RS_destroyed	;green sphere destroyed, destroy rocket


		;move rocket algorithm

		ld	l, sRocketGreen		;0Ah sprite id
		dec	e
		ld	a, e
		cp	0FFh
		jr	nc, rs_remove_sprite
		cp	70			;46h
		jr	nc, loc_A295
		inc	l 			;add tail to rocket
		dec	e

loc_A295:
		ld	a, (Player_Y_Pos)
		cp	d
		jr	z, loc_A2A0
		jr	nc, loc_A29F
		dec	d
		dec	d

loc_A29F:
		inc	d

loc_A2A0:
		ld	bc, 1008h
		call	chkPlayerInZone
		or	a
		jr	z, gs_showRocket
		call	KillPlayer
		jr	rs_remove_rocket
; --------------------------------------------------------------------------
RS_destroyed:
		ld	a, 34		; 34*25=850 points
		call	add_A_bonus_and_snd

rs_remove_rocket:
		call	add_AfterLifeObject

rs_remove_sprite:
		pop	bc
		xor	a
		ld	hl, greenRocketSpriteBuf
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - saveSpriteArea
					;
		ld	(flag_RocketGreenSphere), a
		jp	init_greenSphereRocket
; ---------------------------------------------------------------------------
;l - sprite id
gs_showRocket:
		ld	(xyRocketGreenSphere), de
		pop	bc
		ld	a, l
		ld	hl, greenRocketSpriteBuf
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - saveSpriteArea
;ESLDBG
;to show rocket tail					;
; 		ld	c, 0F7h
 		ld	c, 47h
		jp	fillAttr_2x2
