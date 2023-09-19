;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;onScreen objects (see screen 22)
;white  box - set 99 ammo
;yellow box - set 10 grenades
;when player touch it - object disappear from screen and ammo updated

chk_refill_boxes:
		ld	de, (xyBoxWhite)
		bit	7, e
		jr	nz, chkYellow

		dec	d
		dec	d
		inc	e
		call	block2xy

		ld	a, (Player_X_Pos)
		sub	e
		cp	244
		jr	c, chkYellow

		ld	a, (Player_Y_Pos)
		cp	d
		jr	nz, chkYellow

		ld	de, (xyBoxWhite)
		ld	a, pch_PutCharXorRemoveObject_noBoom	; 4
		call	selectPutCHR

		ld	hl, _blk_box_white
		ld	c, 0
		call	xMSG

		xor	a
		call	selectPutCHR

		ld	a, 0FFh
		ld	(xyBoxWhite), a		;deactivate

		ld	a, 99
		ld	(_AMMO), a

		call	osd_AMMO

		call	snd_got_white_box

		ld	a, (byte_8269)
		ld	b, a
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, b
		ld	de, (Player_X_Pos)
		call	show32xsprite


		ld	b, 5
loc_9996:
		call	sndBox48
		djnz	loc_9996

chkYellow:
		ld	de, (xyBoxYellow)
		bit	7, e
		ret	nz

		dec	d
		dec	d
		inc	e
		call	block2xy

		ld	a, (Player_X_Pos)
		sub	e
		cp	244
		ret	c

		ld	a, (Player_Y_Pos)
		cp	d
		ret	nz

		ld	de, (xyBoxYellow)
		ld	a, pch_PutCharXorRemoveObject_noBoom	;4
		call	selectPutCHR

		ld	hl, _blk_box_yellow
		ld	c, 0		; C - color
		call	xMSG

		xor	a
		call	selectPutCHR

		ld	a, 0FFh
		ld	(xyBoxYellow), a

		ld	a, 10
		ld	(_GRENADES), a

		call	osd_GRENADES
		call	snd_got_yellow_box

		ld	a, (byte_8269)
		ld	b, a
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, b
		ld	de, (Player_X_Pos)
		call	show32xsprite


		ld	b, 5
loc_99EC:
		call	sndBox48
		djnz	loc_99EC

		ret

; ---------------------------------------------------------------------------
; XY , or 0xFF if no
xyBoxWhite:	dw 0
		db 0FFh
xyBoxYellow:	dw 0
		db 0FFh


