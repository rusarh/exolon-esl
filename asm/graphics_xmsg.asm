;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; C - color
; HL - PRE
; E-X
; D-Y

xMSG:
		ld	a, (hl)
		inc	hl
		cp	61h
		jp	nc, ctrlChar

putCharxMSGAddr:
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	e
		jp	xMSG
; ---------------------------------------------------------------------------

ctrlChar:
		cp	90h ; 'ê'
		jp	nc, loc_AF49
		sub	_78_deltaY__p0_dbX
		add	a, d
		ld	d, a
		ld	a, (hl)
		add	a, e
		ld	e, a		; X
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF49:
		cp	0CFh
		jp	nc, loc_AF56
		inc	d
		sub	-51h
		add	a, e
		ld	e, a		; X
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF56:
		cp	0DFh
		jp	nc, loc_AF6F
		sub	_CF_setLoColor_00
		cp	8
		jp	c, loc_AF66
		sub	8
		or	40h

loc_AF66:
		ld	b, a
		ld	a, c
		and	38h
		or	b
		ld	c, a		; color
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF6F:
		cp	_DF_DW_xy
		jp	nz, loc_AF7B
		ld	d, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF7B:
		cp	_E0_Attribute?
		jp	nz, loc_AF85
		ld	c, (hl)
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF85:
		cp	_E1_DBcnt_xLoopStart
		jp	nz, loc_AF91
		ld	b, (hl)
		inc	hl

loc_AF8C:
		push	hl
		push	bc
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF91:
		cp	_E2_xMSG_NEXT_e1
		jp	nz, loc_AFA1
		pop	bc
		djnz	loc_AF9D
		pop	af
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AF9D:
		pop	hl
		jp	loc_AF8C
; ---------------------------------------------------------------------------

loc_AFA1:
		cp	_E3_DWptr_RecursiveCallxMSG
		jp	nz, loc_AFB7
		ld	a, (hl)
		inc	hl
		push	hl
		ld	h, (hl)
		ld	l, a
		push	bc
		push	de
		call	xMSG
		pop	de
		pop	bc
		pop	hl
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AFB7:
		cp	_E4_DBcnt_DBCHR_FillCharX
		jp	nz, loc_AFC9
		ld	b, (hl)
		inc	hl
		ld	a, (hl)

putChar_xMSG_E4:
					; DATA XREF: selectPutCHR+Bw
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	e
		djnz	putChar_xMSG_E4
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AFC9:
		cp	_E5_DBcnt_DBCHR_FillCharY
		jp	nz, loc_AFDB
		ld	b, (hl)
		inc	hl
		ld	a, (hl)

putChar_xMSG_E5:
					; DATA XREF: selectPutCHR+Ew
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	d
		djnz	putChar_xMSG_E5
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AFDB:
		cp	_E6_DW_FONT
		jr	nz, loc_AFEC
		ld	a, (hl)
		ld	(FontPTR+1), a
		inc	hl
		ld	a, (hl)
		ld	(FontPTR+2), a
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_AFEC:
		cp	_E7_SPACE
		jr	nz, loc_B009
		push	hl
		ld	hl, (FontPTR+1)
		push	hl
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
		ld	a, 20h ; ' '

putChar_xMSG_E7:			; DATA XREF: selectPutCHR+11w
					; xMSG+108 r
		call	PurCharAndSetVarsChkX ;	C - color
					; E-X
					; D-Y
		inc	e
		pop	hl
		ld	(FontPTR+1), hl
		pop	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_B009:
		cp	_E8_LD_DB_setNoWalk
		jr	nz, loc_B015
		ld	a, (hl)
		ld	(noWalkFlag+1),	a
		inc	hl
		jp	xMSG
; ---------------------------------------------------------------------------

loc_B015:
		cp	_E9_setNoOverPlayer
		jr	nz, loc_B020
		xor	a
		ld	(overPlayerFlag+1), a
		jp	xMSG
; ---------------------------------------------------------------------------

loc_B020:
		cp	_EA_setOverPlayer
		jr	nz, loc_B02C
		ld	a, 0FFh
		ld	(overPlayerFlag+1), a
		jp	xMSG
; ---------------------------------------------------------------------------

loc_B02C:
		cp	_EB_AnimatedObject
		ret	nz
;
		ld	a, (hl)
		push	bc
		push	de
		push	hl
		ld	hl, (putChar_xMSG_E7+1)
		ld	bc, PurCharAndSetVarsChkX ; C -	color?
					; E-X
					; D-Y
		sbc	hl, bc
		jr	nz, loc_B044
;
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	(hl), a

loc_B044:
		pop	hl
		pop	de
		pop	bc
		inc	hl
		jp	xMSG
