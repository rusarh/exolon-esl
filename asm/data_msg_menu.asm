;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMSG_MENU:	db _E8_LD_DB_setNoWalk
		db 1
		db _DF_DW_xy
		_XY_ 0, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 7, 7
		db _E0_Attribute?
		db 44h
		db 'BY  RAFFAELE CECCO'
		db _DF_DW_xy
		_XY_ 11, 9
		db _DA_setLoColor_11_purple
		db '1'
		db _DC_setLoColor_13_blue
		db ' START GAME'
		db _7A_deltaY__p2_dbX
		db -0Ch
		db _DA_setLoColor_11_purple
		db '2'
		db _DC_setLoColor_13_blue
		db ' DEFINE KEYS'
		db _7A_deltaY__p2_dbX
		db -0Dh
		db _DA_setLoColor_11_purple
		db '3'
		db _DC_setLoColor_13_blue
		db ' KEYBOARD'
		db _7A_deltaY__p2_dbX
		db -0Ah
		db _DA_setLoColor_11_purple
		db '4'
		db _DC_setLoColor_13_blue
		db ' INTERFACE 2'
		db _7A_deltaY__p2_dbX
		db -0Dh
		db _DA_setLoColor_11_purple
		db '5'
		db _DC_setLoColor_13_blue
		db ' KEMPSTON'
		db _DF_DW_xy
		_XY_ 23, 2
		db _D9_setLoColor_10_RED
		db 'EXOLON COPYRIGHT 1987 HEWSON'
		db _FF_EndMSG
