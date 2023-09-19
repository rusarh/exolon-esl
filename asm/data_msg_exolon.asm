;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

xMsgEXOLON?:	db _E6_DW_FONT
		dw FNT_EXOLON		; 50 chars
		db _E0_Attribute?
		db 47h
		db _DE_setLoColor_15
		db 0,1,2,3,4,5,6,7
		db _A7_deltaX__m8_dbY
		db _DD_setLoColor_14
		db 8,9,0Ah,0Bh,0Ch,0Dh,0Eh,0Fh
		db _A7_deltaX__m8_dbY
		db _D5_setLoColor_06
		db 10h,11h,12h,13h,14h,15h,16h,17h
		db _76_deltaY__m2_dbX
		db 0
		db _DE_setLoColor_15
		db 18h,19h,1Ah,1Bh,1Ch,1Dh,1Eh,1Fh
		db _A7_deltaX__m8_dbY
		db _DD_setLoColor_14
		db 20h,21h,22h,23h,24h,25h,26h,27h
		db _A7_deltaX__m8_dbY
		db _D5_setLoColor_06
		db 28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,2Fh
		db _79_deltaY__p1_dbX
		db 0F2h
		db 30h,31h
		db _FF_EndMSG
