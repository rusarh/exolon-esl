;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMSG_Bonus:	db _DF_DW_xy
		_XY_ 3, 7
		db _E0_Attribute?
		db 0
		db _E6_DW_FONT
		dw FONT_BraveryBonus
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _DD_setLoColor_14
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Fh
		db 4
		db 0
		db _D5_setLoColor_06
		db 1
		db _9C_deltaX_m19_dbY
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Fh
		db 5
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _9C_deltaX_m19_dbY
		db _E1_DBcnt_xLoopStart
		db 0Dh
		db _DD_setLoColor_14
		db 6
		db _D5_setLoColor_06
		db 7
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _DD_setLoColor_14
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Fh
		db 4
		db 0
		db _D5_setLoColor_06
		db 1
		db _9C_deltaX_m19_dbY
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Fh
		db 5
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _6A_deltaY_m14_dbX
		db 0FEh
		db _E1_DBcnt_xLoopStart
		db 0Dh
		db _DD_setLoColor_14
		db 6
		db _D5_setLoColor_06
		db 7
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _6B_deltaY_m13_dbX
		db 0F1h

		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _E1_DBcnt_xLoopStart
		db 0Dh
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Fh
		db 20h
		db _A0_deltaX_m15_dbY
		db _E2_xMSG_NEXT_e1
		db _DA_setLoColor_11_purple
		db _6C_deltaY_m12_dbX
		db 1
		db 'BRAVERY BONUS'
		db _7A_deltaY__p2_dbX
		db 0F7h
		db _DE_setLoColor_15
		db '00000'
		db _7A_deltaY__p2_dbX
		db 0F8h
		db _DB_setLoColor_12_green
		db 'LIVES BONUS'
		db _7A_deltaY__p2_dbX
		db 0F9h
		db _DD_setLoColor_14
		db 58h
		db ' 1000'
		db _7A_deltaY__p2_dbX
		db 0F5h
		db _DC_setLoColor_13_blue
		db 'PRESS FIRE TO'
		db _7A_deltaY__p2_dbX
		db 0F4h
		db 'RESUME PLAY'
		db _FF_EndMSG
