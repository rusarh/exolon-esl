;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMSG_HighScoreScreen:db	_DF_DW_xy
		_XY_ 0, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _E0_Attribute?
		db 43h
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 4, 16
		db _E1_DBcnt_xLoopStart
		db 19
		db '        '
		db _A7_deltaX__m8_dbY
		db -30
		db _DF_DW_xy
		_XY_ 0,0
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_medium_green
		db _DF_DW_xy
		_XY_ 1, 5
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_small_purpleRed
		db _DF_DW_xy
		_XY_ 5, 3
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_medium_green
		db _DF_DW_xy
		_XY_ 10, 0
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_big_red
		db _DF_DW_xy
		_XY_ 16, 4
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_small_purpleRed
		db _DF_DW_xy
		_XY_ 19, 1
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_big_cyan
		db _DF_DW_xy
		_XY_ 0, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_big_red
		db _DF_DW_xy
		_XY_ 5, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_SmallYellow
		db _DF_DW_xy
		_XY_ 9, 28
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_SmallRedPurple
		db _DF_DW_xy
		_XY_ 14, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_big_cyan
		db _DF_DW_xy
		_XY_ 18, 30
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_small_purpleRed
		db _DF_DW_xy
		_XY_ 21, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw _blk_planet_medium_green
		db _FF_EndMSG
