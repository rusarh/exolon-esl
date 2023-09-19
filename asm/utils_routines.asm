;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)


ClearToBLACK:
		ld	c, 0

; C - Attr value

ClearScreen_fromback:
		ld	hl,  ATTR_TABLE+2FFh
		ld	de,  ATTR_TABLE+2FEh
		ld	(hl), c
		ld	bc, 768-1
		lddr
		ld	(hl), 0
		ld	bc, 6143
		lddr
		ret
; =============== S U B	R O U T	I N E =======================================

clr_PlayScreen:
		ld	c, 0
		ld	hl, ATTR_TABLE
		ld	(hl), c
		ld	de,  ATTR_TABLE+1
		ld	bc, 22*32-1	;703
		ldir
;
		ld	hl, SCRLINE000
		ld	b, 176
loc_B074:
		push	bc
		push	hl
		ld	e, l
		ld	d, h
		inc	de
		ld	(hl), 0
		ld	bc, 32-1	;1Fh
		ldir
		pop	hl
		call	NextScrLineAddr
		pop	bc
		djnz	loc_B074
		ret

; =============== S U B	R O U T	I N E =======================================

; IN: D	- Y (0..191),E - X (0..127)
; OUT: HL - scr	addr

XY2SCR_ADDR:
		push	af
		ld	l, d
		ld	h, 65h          ; 6500 - Y2SCR_HI
		ld	a, (hl)
		inc	h		; 6600 - Y2SCR_LO
		ld	l, (hl)
		ld	h, a		; HL - Y-ScrAddr

		ld	a, e
		and	1111100b
		rrca
		rrca
		add	a, l
		ld	l, a		; hl+=(x&0xfc)>>2

		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


NextScrLineAddr:
		inc	h
		ld	a, h
		and	7
		ret	nz
		ld	a, l
		add	a, 20h
		ld	l, a
		ret	c
		ld	a, h
		sub	8
		ld	h, a
		ret
; ---------------------------------------------------------------------------
;UNUSED?
; 		ld	a, h
; 		dec	h
; 		and	7
; 		ret	nz
; 		ld	a, l
; 		sub	20h ; ' '
; 		ld	l, a
; 		ret	c
; 		ld	a, h
; 		add	a, 8
; 		ld	h, a
; 		ret

; =============== S U B	R O U T	I N E =======================================

; BC

_delayLDIR:
		push	bc
		push	de
		push	hl
		ld	hl, 0
		ld	de, 0
		ldir
		pop	hl
		pop	de
		pop	bc
		ret
; ---------------------------------------------------------------------------

show_A:
		push	bc
		push	hl
		ld	hl, FNT_MAIN
		ld	(FontPTR+1), hl
		ld	b, 100
		call	putDec31
		ld	b, 10
		call	putDec31
		ld	b, 1
		call	putDec31
		pop	hl
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================

putDec31:
		ld	l, 0

loc_B0E2:
		sub	b
		jr	c, loc_B0E8
		inc	l
		jr	loc_B0E2
loc_B0E8:
		add	a, b
		push	af
		ld	a, l
		add	a, 30h ; '0'
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		pop	af
		inc	e
		ret
