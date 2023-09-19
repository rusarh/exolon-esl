;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

ShowHiscoreTable:
		xor	a
		ld	(HiScoreUpdatedFlag), a

ShowHiscoreTable2:
		ld	c, 44h
		call	ClearScreen_fromback ; C - Attr	value

		ld	hl, xMSG_HighScoreScreen
		call	xMSG

		ld	hl, HiscoreTable ; "RAFFAELE  001000"
		ld	(HiTabPTR), hl

		ld	bc, 960
		ld	hl, FNT_MAIN
		ld	(FontPTR+1), hl

sht_loop:
		push	bc
		nop
		nop
		nop
		ld	a, c
		and	0Fh
		or	a

		ld	bc, 400h
		call	nz, _delayLDIR

		call	z, nextHiScoreToScr

		call	ScrollHiScore_1_line

		pop	bc
		dec	bc
		ld	a, b
		or	c
		jp	z, xmenu

		call	GetKEY
		or	a
		jp	z, sht_loop

		cp	'1'
		jp	z, StartGame

		jp	xmenu
; ---------------------------------------------------------------------------
	include 	"data_msg_high_score.asm"

HiScoreUpdatedFlag:
		db 0

HiscoreTable:	db 'RAFFAELE  001000'
		db 'SURYANI   001000'
		db 'SCRAGGY   001000'
		db 'SABATTA!  001000'
		db 'PADDY     001000'
		db 'LOFTY     001000'
		db 'JIMBO     001000'
		db 'LEO       001000'
		db 'GLEN      001000'
		db 'MORANGE   001000'
		db 'PUPPY     001000'
		db 'ONION     001000'
		db 'RIP       001000'
		db 'FIGARO    001000'
		db 'INK       001000'
		db 'PEN       001000'
		db 'DUMBO     001000'
		db 'MEPHISTO  001000'
		db 'QUEEN     001000'
		db 'UNYIL ?   001000'
		db 'EQUINOX   001000'
		db 'REALMS    001000'
		db 'MAJALA    001000'
		db 'LENGKAP   001000'
		db 'JAZZ      001000'
		db 'HEWSON    001000'
		db 'TIM.M     001000'
		db 'CECCO     001000'
		db 'LUCY      001000'
		db 'ANTONY    001000'
		db 'NIAEREH   001000'
		db '*!/?!@    001000'
		db 'POD       001000'
		db 'HUTNEE    001000'
		db 'BUTNEE    001000'
		db 'JOHN.O    001000'
		db 'CARROT    001000'
		db 'COLIN     001000'
		db 'FLASH     001000'
		db 'SEVILLE   001000'
		db 'T-STATE   001000'
		db 'CLUB      001000'
		db 'HWP       001000'
		db 'CDP       001000'
		db 'TACHYON   001000'
		db 'KILLER    001000'
		db 'DROOPY    001000'
		db 'R 4 S     001000'
		db 'RZASM2    001000'
lastHiScoreROW:	db 'HUMPTY    001000'
;
HiscoreTable_StopByte:db 0FFh
;
hiTableTailBuffer:ds  10h
; ---------------------------------------------------------------------------

ScrollHiScore_1_line:
		push	bc
		ld	(_SAV_SP), sp
		ld	sp,  scr_addr_8+64	;scroll from 64 screen row
		ld	bc, 159*14		;8B2h 14 bytes in row
		pop	de

scroll_lp:
		pop	hl
		ld	(next_de+1), hl
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi		;8 - name
		inc	l	;skip 2 byte onscreen (for speedup?)
		inc	e
		inc	l
		inc	e
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi		;6 - score

next_de:	ld	de, 0
		jp	pe, scroll_lp

		ld	sp, (_SAV_SP)
		ex	de, hl
		ld	e, l
		ld	d, h
		inc	e
		ld	bc, 16	;10h
		ld	(hl), b
		ldir		;clear last line
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


nextHiScoreToScr:
		ld	hl, (HiTabPTR)
		ld	a, (hl)
		cp	0FFh
		jp	z, _delayLDIR	; BC
		ld	de, 1708h
		ld	bc, 1000h

loc_7577:
		ld	a, (hl)
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		inc	e
		inc	hl
		djnz	loc_7577

		ld	(HiTabPTR), hl

		ld	bc, 28Eh
		jp	_delayLDIR	; BC

; ---------------------------------------------------------------------------
HiTabPTR:	dw 0
