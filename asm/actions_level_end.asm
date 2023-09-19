;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

chk_LevelEnd:
		ld	de, (xyEndLevel)
		bit	7, e
		ret	nz

		call	block2xy
		ld	a, (Player_X_Pos)
		cp	e
		ret	c

		ld	hl, xMSG_Bonus
		call	xMSG

		ld	a, (_LIVES)
		ld	b, a
		add	a, '0'
		ld	de, 0C0Dh
		ld	c, 46h
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		ld	de,  a001000+5

addBonusLp:
		call	addPoints
		djnz	addBonusLp

		ld	a, (flag_Exoskeleton)
		or	a
		jr	nz, skipBonusIfExoskelet

		ld	c, 47h
		ld	a, '1'
		ld	de, 80Eh
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		ld	bc, 80

loc_A855:
		push	bc
		ld	de,  a000125+5
		call	addPoints

		ld	b, 3Ch
		call	sound48
		pop	bc
		dec	bc
		ld	a, b
		or	c
		jr	nz, loc_A855

skipBonusIfExoskelet:
		ld	a, (_ZONE)
		cp	124
		jr	nz, noLastLevel

;
;full game DONE, msg and restart from first zone
;
		ld	bc, 0
		call	_delayLDIR
		call	_delayLDIR


		call	ClearToBLACK
		ld	hl, xMsg_FULL_COMBAT_ABILITY
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		ld	a, 0FFh
		ld	(_ZONE), a

		ld	bc, 0
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR

noLastLevel:
		call	doLevelBonusScreen

		ld	hl, unk_768E		;UNUSED???
		ld	a, (_LIVES)
		cp	9
		jr	nc, loc_A8A5
		inc	a
		ld	(_LIVES), a

loc_A8A5:
		xor	a
		ld	(flag_Exoskeleton), a
		ld	a, 99
		ld	(_AMMO), a
		ld	a, 10
		ld	(_GRENADES), a

		ld	a, 136
		call	nextZONEPrepare	; A - player Y pos

		call	new_zone_if_required

		call	show2BottomLine

		xor	a
		ld	(death_jump_phase), a

; here only for	first stage on levels
; fix player position for New Stage

		ld	hl, tab_StagePlayerStartPos
		ld	a, (_ZONE)
		ld	b, a

findLevelLp:
		ld	a, (hl)
		cp	b
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		jr	nz, findLevelLp

		ld	(Player_X_Pos),	de
		ld	(PlayerXY_COPY), de
		ret

; =============== S U B	R O U T	I N E =======================================

doLevelBonusScreen:
		ld	hl, FNT_MAIN
		ld	(FontPTR+1), hl

		ld	bc, 0
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR

		call	ClearToBLACK

		ld	hl, eMSG_BonuScreen
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		call	waitKEY

		ld	bc, 0
		call	_delayLDIR

waitKeyBonus:
		ld	a, (bonusCursor)
		inc	a
		ld	(bonusCursor), a
		and	7
		add	a, 13 	;0Dh
		ld	d, a
		ld	e, 22	;16h
		ld	c, 47h
		ld	a, '*'
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		ld	a, (bonusCursor)
		dec	a
		and	7
		add	a, 13 	;0Dh
		ld	d, a
		ld	e, 22	;16h
		ld	c, 47h
		ld	a, ' '
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		call	chk_KEYS

		ld	bc, 6000
		call	_delayLDIR

		ld	a, (key_FIRE)
		or	a
		jp	z, waitKeyBonus

		ld	bc, 0
		call	_delayLDIR
		call	_delayLDIR
		call	_delayLDIR

		ld	a, (bonusCursor)
		and	1
		ret	z
		ld	a, (bonusCursor)
		and	7
		ld	b, a
		ld	de,  a001000+5

loc_A95A:
		call	addPoints
		djnz	loc_A95A
		ret

; ---------------------------------------------------------------------------
bonusCursor:	db 0

	include 	"data_msg_bonusScreen.asm"
	include 	"data_msg_combat_ability.asm"

;
tab_StagePlayerStartPos:
		str_StartPos   0,  16,	112 ; 0
		str_StartPos  25,   0,	120 ; 1
		str_StartPos  50,   0,	 32 ; 2
		str_StartPos  75,  40,	128 ; 3
		str_StartPos 100,  16,	112 ; 4
;
xyEndLevel:	dw 0
		db 0FFh
;
	include 	"data_msg_braveryBonus.asm"