;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMSG_Congratualtion:
		db _E6_DW_FONT
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
		db _DF_DW_xy
		_XY_ 8, 8
		db _E0_Attribute?
		db 46h
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db 'CONGRATULATIONS!'
		db _7A_deltaY__p2_dbX
		db 0EDh
		db _DB_setLoColor_12_green
		db 'PLEASE ENTER YOUR NAME'
		db _7A_deltaY__p2_dbX
		db 0E7h
		db _DA_setLoColor_11_purple
		db 'INTO THE EXOLON HALL OF FAME'
		db _7B_deltaY__p3_dbX
		db 0EEh
		db _DE_setLoColor_15
		db '--------'
		db _7B_deltaY__p3_dbX
		db 0F2h
		db _DC_setLoColor_13_blue
		db 'PRESS CAPS TO DELETE'
		db _7A_deltaY__p2_dbX
		db 0EDh
		db _DD_setLoColor_14
		db 'PRESS ENTER TO END'
		db _FF_EndMSG

xMSG_BorderHorizontal:
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderCorner?
		db _DC_setLoColor_13_blue
		db _78_deltaY__p0_dbX
		db 2
		db _E1_DBcnt_xLoopStart
		db 14
		db 8
		db 9
		db _E2_xMSG_NEXT_e1
		db _93_deltaX_m28
		db _D4_setLoColor_05
		db _E1_DBcnt_xLoopStart
		db 14
		db 0Ah
		db 0Bh
		db _E2_xMSG_NEXT_e1
		db _77_deltaY__m1_dbX
		db 0
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderCorner?
		db 0FFh

xMSG_BorderCorner?:
		db _DC_setLoColor_13_blue
		db 0
		db _D4_setLoColor_05
		db 1
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 2
		db _D4_setLoColor_05
		db 3
		db _FF_EndMSG
