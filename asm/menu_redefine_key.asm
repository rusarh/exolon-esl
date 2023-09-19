;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

DefineKeys:
		call	psg_mute
		call	ClearToBLACK
		call	clr_no_walk_tab
		call	clr_over_player_tab
		ld	bc, 1Fh
		ldir
		xor	a
		ld	(active_control), a
		ld	hl, xMSG_KeySelect
		call	xMSG

		call	_save_attr_table
		call	clr_SpriteBuffers
		call	clr_menuStars

		ld	ix, KeyScanCodes
		ld	iy, CheatKeyBuffer
		ld	de, 90Fh
		ld	b, 5

loc_6FDC:
		push	bc
		ld	a, '?'
		ld	c, 44h
		call	PurCharAndSetVarsChkX
		push	de
		call	waitKEY

loc_6FE8:
		call	GetKEY
		or	a
		jr	z, loc_6FE8

		ld	(ix+2),	d
		ld	(ix+6),	e
		ld	de, 0Ah
		add	ix, de
		ld	(iy+0),	a
		inc	iy
		pop	de
		ld	hl, aEnteredKEY
		cp	' '
		jr	nz, loc_7009
		ld	hl, aSpace	; "SPACE"

loc_7009:
		cp	0Dh
		jr	nz, loc_7010
		ld	hl, aEnter	; "ENTER"

loc_7010:
		cp	1
		jr	nz, loc_7017
		ld	hl, aCapsShift	; "CAPS SHIFT"

loc_7017:
		cp	2
		jr	nz, loc_701E
		ld	hl, aSymbolShift ; "SYMBOL SHIFT"

loc_701E:
		ld	(aEnteredKEY), a
		ld	c, 43h
		call	xMSG

		push	de
		ld	b, 0C8h
		call	sound48
		pop	de
		pop	bc
		djnz	loc_6FDC

		ld	bc, 50000
		call	_delayLDIR
		call	_delayLDIR
;
; build in cheat
; compare defined keys with "SECRET" code, and patch game if comapred
;
		ld	hl, CheatKeyBuffer
		ld	de, aCHEAT_KEYS	; "ZORBA"
		ld	b, 5

loc_7041:
		ld	a, (de)
		cp	(hl)
		jp	nz, xmenu
		inc	hl
		inc	de
		djnz	loc_7041

		ld	a, (cheatLife)
		xor	3Dh
		ld	(cheatLife), a

		ld	hl, musicGameOver
		call	z, playBeeperMusic

		jp	xmenu

; ---------------------------------------------------------------------------
aEnteredKEY:	db '?'
		db _7A_deltaY__p2_dbX
		db -1
		db 0FFh
aSpace:		db 'SPACE'
		db _7A_deltaY__p2_dbX
		db -5
		db _FF_EndMSG
aEnter:		db 'ENTER'
		db _7A_deltaY__p2_dbX
		db -5
		db _FF_EndMSG
aCapsShift:	db 'CAPS SHIFT'
		db _7A_deltaY__p2_dbX
		db -10
		db _FF_EndMSG
aSymbolShift:	db 'SYMBOL SHIFT'
		db _7A_deltaY__p2_dbX
		db -12
		db _FF_EndMSG

CheatKeyBuffer:	ds 5
aCHEAT_KEYS:	db 'ZORBA'

xMSG_KeySelect:	db _DF_DW_xy
		_XY_ 0, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _E0_Attribute?
		db 46h
		db _DF_DW_xy
		_XY_ 6, 7
		db _E6_DW_FONT
		dw FNT_MAIN
		db 'SELECT KEY FOR....'
		db _DE_setLoColor_15
		db _7B_deltaY__p3_dbX
		db 0EEh
		db 'LEFT'
		db _7A_deltaY__p2_dbX
		db 0FCh
		db 'RIGHT'
		db _7A_deltaY__p2_dbX
		db 0FBh
		db 'JUMP'
		db _7A_deltaY__p2_dbX
		db 0FCh
		db 'DUCK'
		db _7A_deltaY__p2_dbX
		db 0FCh
		db 'FIRE'
		db _70_deltaY__m8_dbX
		db 4
		db _E5_DBcnt_DBCHR_FillCharY
		db 9
		db ' '
		db _DF_DW_xy
		_XY_ 23, 2
		db _D9_setLoColor_10_RED
		db 'EXOLON COPYRIGHT 1987 HEWSON'
		db _FF_EndMSG
