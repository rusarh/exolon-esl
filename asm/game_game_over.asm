;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

_game_over:
		ld	hl, xMSG_GameOver
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y
		ld	hl, musicGameOver
		call	playBeeperMusic
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	updateHighScoreTab
		call	waitKEY

		ld	bc, 20000

loc_A048:
		call	GetKEY
		or	a
		jp	nz, START
		dec	bc
		ld	a, b
		or	c
		jr	nz, loc_A048
		jp	START
; ---------------------------------------------------------------------------
xMSG_GameOver:	db _DF_DW_xy
		_XY_ 9, 10
		db _E6_DW_FONT
		dw FNT_MAIN
		db _E0_Attribute?
		db 56h
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Bh
		db ' '
		db _A4_deltaX_m11_dbY
		db ' GAME OVER '
		db _A4_deltaX_m11_dbY
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Bh
		db ' '
		db _FF_EndMSG

; =============== S U B	R O U T	I N E =======================================

updateHighScoreTab:
		ld	hl, sub_B6D1
		ld	ix, HiscoreTable ; "RAFFAELE  001000"

searchLoop:
		bit	7, (ix+0)
		ret	nz		; End table reached

		push	ix
		ld	de, 10		; skip name
		add	ix, de

		ld	hl, points	; "000000"
		ld	b, 6

chkCurrentLP:
		ld	a, (ix+0)
		cp	(hl)
		jp	z, tryNextCHR
		jp	nc, nextRecord

		pop	hl
		push	hl

		ld	a, 255
		ld	bc, 1000
		cpir

		ld	hl, 1000
		and	a
		sbc	hl, bc
		push	hl
		pop	bc
		ld	de,  hiTableTailBuffer+0Eh
		ld	hl,  lastHiScoreROW+0Fh
		lddr

		ld	a, 0FFh
		ld	(HiscoreTable_StopByte), a

		pop	hl
		push	hl

		ld	de, 10		; skip NAME
		add	hl, de
		ex	de, hl
		ld	hl, points	; "000000"
		ld	bc, 6
		ldir			; copy score to	HiScoreTable

		call	ClearToBLACK

		ld	hl, nameBUF	; "        "
		ld	de,  nameBUF+1
		ld	bc, 7
		ld	(hl), ' '
		ldir

		ld	hl, xMSG_Congratualtion
		call	xMSG		; C - color
					; HL - PRE
					; E-X
					; D-Y

		ld	de, 0F0Ch
		ld	hl, nameBUF	; "        "

edit_name_loop:
		ld	c, 44h
		ld	a, 3Fh
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y

loc_A0E5:
		ld	bc, 3E8h
		call	_delayLDIR	; BC

		call	waitKEY

		push	de

loc_A0EF:
		call	GetKEY
		or	a
		jr	z, loc_A0EF
		cp	2
		jr	z, loc_A0EF
		pop	de
		cp	0Dh
		jr	z, endEnterName
		cp	1
		jr	nz, plain_char
		ld	a, e
		cp	19		; x?
		jr	nz, loc_A110
		ld	a, (hl)
		cp	' '
		jr	z, loc_A110
		ld	(hl), ' '
		jr	edit_name_loop
; ---------------------------------------------------------------------------

loc_A110:
					; updateHighScoreTab+97j
		ld	a, e
		cp	12 		;0Ch
		jr	z, edit_name_loop
		ld	a, 2Dh
		ld	c, 47h
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		dec	hl
		ld	(hl), 20h ; ' '
		dec	e
		jr	edit_name_loop
; ---------------------------------------------------------------------------

plain_char:
		ld	(hl), a
		ld	c, 46h
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		ld	a, e
		cp	13h
		jr	z, loc_A0E5
		inc	hl
		inc	e
		jr	edit_name_loop
; ---------------------------------------------------------------------------

endEnterName:
		pop	de
		ld	hl, nameBUF	; "        "
		ld	bc, 8
		ldir
		ld	a, 1
		ld	(HiScoreUpdatedFlag), a
		call	waitKEY
		jp	START

tryNextCHR:
		inc	hl
		inc	ix
		dec	b
		jp	nz, chkCurrentLP

nextRecord:
		pop	ix
		ld	de, 16
		add	ix, de
		jp	searchLoop

; ---------------------------------------------------------------------------

	include	"data_msg_hall_of_fame.asm"

nameBUF:	db '        '
