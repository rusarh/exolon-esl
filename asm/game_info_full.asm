;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

show2BottomLine:
		ld	hl, xMSG_bottomText
		call	xMSG

		call	osd_AMMO
		call	osd_GRENADES
		call	osd_LIVES
		jp	osd_ZONE

xMSG_bottomText:db _DF_DW_xy
		_XY_ 22, 0
		db _E6_DW_FONT
		dw FNT_MAIN
		db _E8_LD_DB_setNoWalk
		db 1
		db _E9_setNoOverPlayer
		db _DC_setLoColor_13_blue
		db 'AMMO '
		db _DD_setLoColor_14
		db 'GRENADES '
		db _DB_setLoColor_12_green
		db 'POINTS '
		db _DE_setLoColor_15
		db 'LIVES '
		db _DA_setLoColor_11_purple
		db 'ZONES'
		db _DF_DW_xy
		_XY_ 23, 0
		db _E4_DBcnt_DBCHR_FillCharX
		db 32
		db ' '
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_Points
		db 0FFh

