;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

chk_Mines:
		ld	hl, FONT_ZONE_00
		ld	(FontPTR+1), hl

		ld	a, (fired_mine_phase)
		xor	2
		ld	(fired_mine_phase), a

		ld	hl, xyMines	; 10

nextMine:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		dec	a
		jr	z, notFiredYet

		call	RND
		and	7
		or	42h
		ld	c, a

		ld	a, (fired_mine_phase)
		add	a, 0x1d 	; 29 AfterMineFire
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	a
		inc	e
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		jr	nextMine
; ---------------------------------------------------------------------------

notFiredYet:
		ld	b, d
		ld	c, e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		dec	d
		ld	a, (Player_Y_Pos)
		add	a, 31
		cp	d
		jr	nz, nextMine

		ld	a, (Player_X_Pos) ; 0..127
		add	a, 6
		sub	e
		sub	9		;x+6-mine_x-9
		cp	-10 		;0F6h
		jr	c, nextMine

		dec	hl
		ld	(hl), 0		; mineFired
		ld	d, b
		ld	e, c
		dec	d

		call	generate_mine_boom

		call	snd_first_first_gun

		jp	KillPlayer_unless_Exoskeleton

; ---------------------------------------------------------------------------
fired_mine_phase:
		db 0
xyMines:
		ds 	10*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


generate_mine_boom:
		ld	a, pch_PutCharXorRemoveObject_2boom	;3
		call	selectPutCHR

		inc	d
		inc	d
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		dec	d
		dec	d
		ld	bc, ATTR_TABLE
		add	hl, bc
		ld	a, (hl)
		ld	(stored_color),	a

		;generate 10 boom particles ;)
		;"show" 5 times 2 spaces,
		;each space - generate 2 boom particle

		ld	hl, msg_generate_mine_boom
		call	xMSG
		xor	a
		jp	selectPutCHR

msg_generate_mine_boom:
		db _E6_DW_FONT
		dw FNT_MAIN
		db _E0_Attribute?
stored_color:	db 5
		db _E1_DBcnt_xLoopStart
		db 5
		db '  '
		db _78_deltaY__p0_dbX
		db -2
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG

; ---------------------------------------------------------------------------
clr_MineBuf:
		ld	hl, xyMines	; 10
		ld	de, xyMines+1
		ld	(hl), 1
		ld	bc, 10*3-1	;29
		ldir
		ret
