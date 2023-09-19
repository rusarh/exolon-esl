;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; =============== S U B	R O U T	I N E =======================================

; C - color
; E-X
; D-Y

;вывесьти символ и установить noWalkFlag & over_player_tab
;они модифицируются из xMSG

PurCharAndSetVarsChkX:
		bit	5, e
		ret	nz
;
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl		; *8

FontPTR:
		ld	bc, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		add	hl, bc
; CALC scr addr	- D,E
		ld	a, d
		and	0F8h ; 'ш'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
;
		ld	b, 8

char_lp:
		ld	a, (hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	char_lp
;cal ATTR addr
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'       ; 5800 - ATTR_TABLE
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
;
		ld	de, 900h	; 6100 - no_walk_tab
		add	hl, de

noWalkFlag:
		ld	(hl), 1
		ld	de, -600h	; 5B00 - over_player_tab
		add	hl, de

overPlayerFlag:
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================

; A - chr
; C - COLOR
; E-X
; D-Y

putChar:
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ш'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AE46:
		ld	a, (hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AE46
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
		pop	hl
		pop	de
		pop	af
		ret
; End of function putChar


; =============== S U B	R O U T	I N E =======================================
; A - chr
; C - COLOR
; E-X
; D-Y
;same as putChar but XOR instead set
putCharXOR:
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ш'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AE7D:
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AE7D
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
		pop	hl
		pop	de
		pop	af
		ret
; End of function putCharXOR


; =============== S U B	R O U T	I N E =======================================

;используется для стирания объектов
;очищает таблицу занятости 
;и заодно добавляет две части взырва
;уничтожение активных объектов

PutCharXorRemoveObject_2boom:

		bit	5, e
		ret	nz

		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ш'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AEB8:
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AEB8
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	l, e
		ld	de, over_player_tab
		add	hl, de
		pop	bc
		ld	(hl), 0FFh
		ld	de, 300h	; 5b00
		add	hl, de
		ld	(hl), 0
		ld	de, 300h	; 6100
		add	hl, de
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		call	add_explosion_particle ; e-x (/4)
					; d-y (/8)
		jp	add_explosion_particle ; e-x (/4)

; ---------------------------------------------------------------------------
;используется для стирания объектов
;очищает таблицу занятости  
;бех взырва

PutCharXorRemoveObject_noBoom:
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ш'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AF04:
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AF04
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	l, e
		ld	de, over_player_tab
		add	hl, de
		pop	bc
		ld	(hl), 0FFh
		ld	de, 300h	; 5b00
		add	hl, de
		ld	(hl), 0
		ld	de, 300h	; 6100
		add	hl, de
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		ret
