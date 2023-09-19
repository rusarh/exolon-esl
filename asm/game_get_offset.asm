;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; in:
; d - y	(0..23)
; e - x	(0..31)
; out:
; hl=Y*32+X

textXY2TABLEOFFSET:
		ld	a, d
		sra	a
		sra	a
		sra	a
		ld	h, a		; y/8
;
		ld	a, d
		and	111b		; 0000111 -> 11100000
		rrca
		rrca
		rrca
		add	a, e		; y/8+x
;
		ld	l, a
;
		ret

; ---------------------------------------------------------------------------
;UNUSED???
; 		push	af
; 		push	de
; ;
; 		ld	a, e
; 		and	1111100b
; 		rrca
; 		rrca
; 		ld	e, a		; x/4
; ;
; 		ld	a, d
; 		and	11111000b
; 		rrca
; 		rrca
; 		rrca
; 		ld	d, a		; y/8
; ;
; 		call	textXY2TABLEOFFSET ; in:
; 					; d - y	(0..23)
; 					; e - x	(0..31)
; 					; out:
; 					; hl=Y*32+X
; 		ld	de, over_player_tab
; 		add	hl, de
; 		pop	de
; 		pop	af
; 		ret

; =============== S U B	R O U T	I N E =======================================

; d-y (0..191) ,e-x (0..127)
; ret
; hl-NoWalkaddr

getNowalkAddrForXY:
		push	af
		push	de
		ld	a, e		; x
		and	1111100b
		rrca
		rrca
		ld	e, a		; x/4
;
		ld	a, d
		and	11111000b
		rrca
		rrca
		rrca
		ld	d, a		; y/8
;
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, no_walk_tab	; ?AnimationTab?
		add	hl, de
		pop	de
		pop	af
		ret
; End of function getNowalkAddrForXY


; =============== S U B	R O U T	I N E =======================================

; d-y (0..191) ,e-x (0..127)
; ret
; hl-AttrTableCopy

getATTR_TABLE_COPY_for_XY:
		push	af
		push	de
;
		ld	a, e
		and	1111100b
		rrca
		rrca
		ld	e, a		; x/4
;
		ld	a, d
		and	11111000b
		rrca
		rrca
		rrca
		ld	d, a		; y/8
;
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE_COPY
		add	hl, de
		pop	de
		pop	af
		ret
; End of function getATTR_TABLE_COPY_for_XY


; =============== S U B	R O U T	I N E =======================================


;in de-xy
;out a=0 if can walk

chk_can_move_right:

		push	bc
		push	de
		push	hl
		ld	a, e
		cp	116		;74h ; 't'
		ld	a, 0
		jr	nc, loc_811D
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_811D
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		inc	l
		inc	l
		inc	l
		ld	bc, 32 		;20h	; ' '
		ld	a, (hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_811D
		add	hl, bc
		or	(hl)

loc_811D:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_80F3


; =============== S U B	R O U T	I N E =======================================


;in de-xy
;out a=0 if can walk

chk_can_move_left:

		push	bc
		push	de
		push	hl
		ld	a, e
		or	a
		ld	a, 1
		jr	z, loc_8149

		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_8149

		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		dec	l
		ld	bc, 32		;20h	; ' '
		ld	a, (hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_8149
		add	hl, bc
		or	(hl)

loc_8149:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_8122


; =============== S U B	R O U T	I N E =======================================


; sub_814E:

;in de-xy
;out a=0 if can walk
chk_can_move_down:
		push	bc
		push	de
		push	hl
;
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_8174
;
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, 128		; 4*32
		add	hl, bc

		ld	a, (hl)
		ld	d, a
		ld	a, e
		cp	116 		;74h ; 't'
		ld	a, d
		jr	nc, loc_8174

		inc	l
		or	(hl)
		inc	l
		or	(hl)

		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_8174

		inc	l
		or	(hl)


loc_8174:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================

;in de-xy
;out a=0 if can walk

; chk_can_move_up:
chk_can_move_up:

		push	bc
		push	de
		push	hl

		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_819F

		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, -32 	;0FFE0h
		add	hl, bc

		ld	a, (hl)
		ld	d, a
		ld	a, e
		cp	116 		;74h ; 't'
		ld	a, d
		jr	nc, loc_819F

		inc	l
		or	(hl)
		inc	l
		or	(hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_819F

		inc	l
		or	(hl)

loc_819F:
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
