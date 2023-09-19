;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

eMSG_BonuScreen:db _E6_DW_FONT
		dw FNT_BORDER_BONUS	; 12
		db _DF_DW_xy
		_XY_ 0,0
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderHorizontal
		db _DF_DW_xy
		_XY_ 2, 0
		db _E1_DBcnt_xLoopStart
		db 0Ah
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
		db 0Ah
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
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 8, 6
		db _DE_setLoColor_15
		db 'EXOLON BONUS SCREEN!'
		db _DF_DW_xy
		_XY_ 10, 3
		db _DB_setLoColor_12_green
		db 'PRESS FIRE TO STOP POINTER'
		db _DF_DW_xy
		_XY_ 13, 9
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '01000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '03000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '05000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '07000 POINTS'
		db _FF_EndMSG
