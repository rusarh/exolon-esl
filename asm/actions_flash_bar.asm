;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

update_FlashAttr:
		ld	hl, AttrFlashBuf

loop_FA:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		push	hl
		call	textXY2TABLEOFFSET ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	a, (tick_db)
		and	7
		or	40h
		ld	(hl), a
		pop	hl
		jr	loop_FA

AttrFlashBuf:
		ds 	14*2
; 		_XY_ 0
		db 0FFh
