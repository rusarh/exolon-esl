;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)


init_Level_Actions:
		ld	hl, AnimInitTab		; Objects with code 2..16
		ld	b, 16

;init all tables, set to empty
prepare_tables_loop:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)

		ld	a, 0FFh			; set object to noop
		ld	(de), a

		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		inc	hl
		inc	hl
		djnz	prepare_tables_loop

;table inited in "BUILD LEVEL"
;find "objects" and init it if found (code >2)
;replace init mark

		ld	hl, no_walk_tab		; ?AnimationTab?
		ld	bc, 704

chk_animation_loop:
		ld	a, (hl)
		cp	2
		call	nc, addCoordToAnimTab 	;	a - code
						; hl - noWalkTab
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jr	nz, chk_animation_loop
		ret

; =============== S U B	R O U T	I N E =======================================

; a - code
; hl - noWalkTab

addCoordToAnimTab:
		push	bc
		push	hl
		ex	af, af'
		ld	de, -no_walk_tab	;-6100h
		add	hl, de
;
		ld	a, l
		and	1Fh
		ld	e, a		; x
;
		ld	a, l
		srl	h
		rra
		srl	h
		rra
		and	0F8h
		rrca
		rrca
		rrca
		ld	d, a		; y
;
		ex	af, af'
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	b, h
		ld	c, l
		add	hl, hl		; a*6
		add	hl, bc
;
; 		ld	bc, AnimInitTab_MINUS_12 ; AnimInitTab-(6*2) (code starts from 2)
		ld	bc, AnimInitTab-(6*2) 	 ;(code starts from 2)
		add	hl, bc
;
		push	hl
		pop	ix
;
		ld	l, (ix+2)	; getNextAddr
		ld	h, (ix+3)
;
		ld	(hl), e		; writeXY to next str record
		inc	hl
		ld	(hl), d
;
		ld	c, (ix+4)	; add str size
		ld	b, 0
		dec	c
		add	hl, bc
		ld	(ix+2),	l	; ptr to next str record

; AnimInitTab_MINUS_12:
		ld	(ix+3),	h
;
		ld	(hl), 0FFh	; termination
;
		pop	hl
;
		ld	a, (ix+5)
		ld	(hl), a		; replace code in noWalkTab, mute animation?
		pop	bc
		ret

; strActivObj 	macro addrStart,addrWork,ssize,anim_code
; 		dw 	addrStart
; 		dw 	addrWork
; 		db 	ssize
; 		db 	anim_code
; 		endm
AnimInitTab:	;	    struct_addr		  ,work_addr,onerecord size, replaced to
		strActivObj xyTorchs	          , 0, 2, anim_NOOP
		strActivObj xyGunMachine          , 0, 3, anim_GunMachine
		strActivObj AttrFlashBuf          , 0, 2, anim_NOOP
		strActivObj xyMines	          , 0, 3, anim_Checker
		strActivObj xyTeleport1           , 0, 2, anim_Checker
		strActivObj xyBoxWhite	          , 0, 2, anim_NOOP
		strActivObj xyBoxYellow           , 0, 2, anim_NOOP
		strActivObj xySphereHome          , 0, 2, anim_NOOP
		strActivObj xyPump	          , 0, 3, anim_Checker
		strActivObj xyRocketLauncher      , 0, 2, anim_NOOP
		strActivObj xyChangingRoom        , 0, 2, anim_Checker
		strActivObj xyGreenSphereWithLines, 0, 2, anim_GreenSphere
		strActivObj xyBONUS	 	  , 0, 3, anim_NOOP
		strActivObj xyHighVoltage	  , 0, 2, anim_NOOP
		strActivObj xyEndLevel	 	  , 0, 2, anim_NOOP
		strActivObj xyBeam	 	  , 0, 2, anim_Checker
