;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMsg_FULL_COMBAT_ABILITY:
		db _E6_DW_FONT
		dw FNT_BORDER_BONUS	; 12
		db _DF_DW_xy
		_XY_ 0,0
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderHorizontal
		db _DF_DW_xy
		_XY_ 2, 0
		db _E1_DBcnt_xLoopStart
		db 10
		db _DC_setLoColor_13_blue
		db 4
		db _D4_setLoColor_05
		db 5
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 6
		db _D4_setLoColor_05
		db 7
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderHorizontal
		db _DF_DW_xy
		_XY_ 2, 30
		db _E1_DBcnt_xLoopStart
		db 10
		db _DC_setLoColor_13_blue
		db 4
		db _D4_setLoColor_05
		db 5
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 6
		db _D4_setLoColor_05
		db 7
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _DF_DW_xy
		_XY_ 3, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _DF_DW_xy
		_XY_ 8, 8
		db _E0_Attribute?
		db 46h
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db 'CONGRATULATIONS!'
		db _7A_deltaY__p2_dbX
		db -12h
		db _DB_setLoColor_12_green
		db 'YOU HAVE PROVEN YOUR'
		db _7A_deltaY__p2_dbX
		db -12h
		db _DA_setLoColor_11_purple
		db 'COMBAT ABILITIES'
		db _7A_deltaY__p2_dbX
		db 0F2h
		db _DE_setLoColor_15
		db 'TO THE FULL'
		db _7B_deltaY__p3_dbX
		db 0F4h
		db _DC_setLoColor_13_blue
		db 'PRESS FIRE TO'
		db _7A_deltaY__p2_dbX
		db 0F4h
		db _DC_setLoColor_13_blue
		db 'RESUME PLAY'
		db _FF_EndMSG
