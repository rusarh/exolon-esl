; ---------------------------------------------------------------------------
xZoneBlock:	dw yellow_cap		; 0 ; DATA XREF: ShowZone2Screen+5Eo
					; sub_925F+1B3o
		dw flying_platform	; 1
		dw spaceShip		; 2
		dw planetBigRed		; 3
		dw planetSmallPurpleRed	; 4
		dw gunMachine		; 5
		dw redGroundBlock1	; 6
		dw redGroundBlock2	; 7
		dw redGroundBlock3	; 8
		dw redGroundBlock4	; 9
		dw redGroundBlock_LONG	; 10
		dw GateGreen		; 11
		dw mineYellow		; 12
		dw FigureYellow		; 13
		dw redGroundBlock_LONG2	; 14
		dw TowerDishWhite	; 15
		dw TowerRocketWhite	; 16
		dw TeleportGATE		; 17
		dw box_white		; 18
		dw box_white		; 19
		dw box_yellow		; 20
		dw bobs_circle		; 21
		dw ENIMY_10		; 22
		dw GroundGreenLONG	; 23
		dw VWALL_White		; 24
		dw ColumnGreenYellow	; 25
		dw DoubleLaserGun	; 26
		dw VWALL_PurpleRed	; 27
		dw YellowFireHead	; 28
		dw PinkAmmoBox		; 29
		dw planetMediumGreen	; 30
		dw SphereWithLinesGreen	; 31
		dw SphereBase		; 32
		dw VBricksYellow	; 33
		dw HBrickYellow		; 34
		dw planetSmallYellow	; 35
		dw planerSmallRedPurple	; 36
		dw planetBigCyan	; 37
		dw HWALL_White		; 38
		dw ENIMY_09		; 39
		dw Wagonetka		; 40
		dw HillGroundRed	; 41
		dw EndStage		; 42
		dw MarkerGreenRed	; 43
		dw gunMachineTop	; 44
		dw gunMachineBottom	; 45
		dw MushroomGreen	; 46
		dw VContainer1Yellow	; 47
		dw LUDiagonal		; 48
		dw RUDiagonal		; 49
		dw VContainer4Yekllow	; 50
		dw TwoYellowBlueSphere	; 51
		dw HLineYellow		; 52
		dw VContainer1Cyan	; 53
		dw HLineGreen		; 54
		dw HLineYellowSmal	; 55
		dw GroundBlockGreen1	; 56
		dw GroundBlockGreen2	; 57
		dw GroundBlockGreen3	; 58
		dw GroundBlockGreen4	; 59
		dw HGroundGreenBig1	; 60
		dw HGroundGreenBig2	; 61
;
yellow_cap:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_ZONE_00		; 38 chars
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db 2
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 3
		db _D5_setLoColor_06
		db 4
		db 5
		db _FF_EndMSG
;
flying_platform:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_ZONE_00		; 38 chars
		db _DB_setLoColor_12_green
		db 6
		db 7
		db _D3_setLoColor_04
		db 8
		db 9
		db 0Ah
		db _AA_deltaX__m5
		db _DD_setLoColor_14
		db 0Bh
		db 0Ch
		db _D5_setLoColor_06
		db 0Dh
		db 0Eh
		db 0Fh
		db _AA_deltaX__m5
		db _E8_LD_DB_setNoWalk
		db 2
		db _DC_setLoColor_13_blue
		db 10h
		db _E8_LD_DB_setNoWalk
		db 1
		db _DD_setLoColor_14
		db 11h
		db _D5_setLoColor_06
		db _E8_LD_DB_setNoWalk
		db 11h
		db 12h
		db _E8_LD_DB_setNoWalk
		db 1
		db 13h
		db _E8_LD_DB_setNoWalk
		db 2
		db _D4_setLoColor_05
		db 14h
		db _FF_EndMSG
;
spaceShip:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_Ship		; 42 chars
		db _DE_setLoColor_15
		db 24h
		db 25h
		db 25h
		db 0
		db 1
		db _D9_setLoColor_10_RED
		db 2
		db _D6_setLoColor_07
		db 3
		db 4
		db 25h
		db 25h
		db 24h
		db _A6_deltaX__m9_dbY
		db _DE_setLoColor_15
		db 5
		db _DC_setLoColor_13_blue
		db 6
		db 7
		db _D4_setLoColor_05
		db 8
		db 9
		db 0Ah
		db _D6_setLoColor_07
		db 0Bh
		db _A7_deltaX__m8_dbY
		db _DE_setLoColor_15
		db 20h
		db _DD_setLoColor_14
		db 0Ch
		db _DC_setLoColor_13_blue
		db 0Dh
		db 0Eh
		db _D4_setLoColor_05
		db 0Fh
		db 10h
		db 11h
		db _DD_setLoColor_14
		db 12h
		db _DE_setLoColor_15
		db 22h
		db _A6_deltaX__m9_dbY
		db _DE_setLoColor_15
		db 21h
		db _D5_setLoColor_06
		db 13h
		db _DC_setLoColor_13_blue
		db 14h
		db 15h
		db _D4_setLoColor_05
		db 16h
		db 17h
		db 18h
		db _D5_setLoColor_06
		db 19h
		db _D6_setLoColor_07
		db 23h
		db _A6_deltaX__m9_dbY
		db _E8_LD_DB_setNoWalk
		db 2
		db _DC_setLoColor_13_blue
		db _E6_DW_FONT
		dw FONT_ZONE_00		; 38 chars
		db 10h
		db _E8_LD_DB_setNoWalk
		db 1
		db _78_deltaY__p0_dbX
		db 1
		db _E6_DW_FONT
		dw FNT_Ship		; 42 chars
		db 1Ah
		db 1Bh
		db _D4_setLoColor_05
		db 1Ch
		db 1Dh
		db 1Eh
		db _78_deltaY__p0_dbX
		db 1
		db _E6_DW_FONT
		dw FONT_ZONE_00		; 38 chars
		db _E8_LD_DB_setNoWalk
		db 2
		db 14h
		db _AA_deltaX__m5
		db _E6_DW_FONT
		dw FNT_Ship		; 42 chars
		db _E8_LD_DB_setNoWalk
		db 1
		db _D4_setLoColor_05
		db 1Fh
		db _71_deltaY__m7_dbX
		db 0FDh
		db _DE_setLoColor_15
		db 27h
		db _AE_deltaX__m1
		db 26h
		db _77_deltaY__m1_dbX
		db 3
		db _D6_setLoColor_07
		db 29h
		db _AE_deltaX__m1
		db 28h
		db _FF_EndMSG
;
planetBigRed:	db _E6_DW_FONT		; DATA XREF: RAM:71BDo	RAM:71CFo ...
		dw FONT_Planet		; 20 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _EA_setOverPlayer
		db _D9_setLoColor_10_RED
		db 0
		db 1
		db _D1_setLoColor_02
		db 2
		db 3
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 4
		db 5
		db _D1_setLoColor_02
		db 6
		db 7
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 8
		db 9
		db _D1_setLoColor_02
		db 0Ah
		db 0Bh
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 0Ch
		db 0Dh
		db _D1_setLoColor_02
		db 0Eh
		db 0Fh
		db _FF_EndMSG
;
planetSmallPurpleRed:db	_E6_DW_FONT	; DATA XREF: RAM:71B1o	RAM:71C3o ...
		dw FONT_Planet		; 20 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _EA_setOverPlayer
		db _DA_setLoColor_11_purple
		db 10h
		db _D9_setLoColor_10_RED
		db 11h
		db _AD_deltaX__m2
		db _D2_setLoColor_03
		db 12h
		db _D1_setLoColor_02
		db 13h
		db _FF_EndMSG
;
gunMachine:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GunMachine	; 32 chars
		db _E8_LD_DB_setNoWalk
		db 3
		db _DD_setLoColor_14
		db 12h
		db _E8_LD_DB_setNoWalk
		db 1
		db 13h
		db _D6_setLoColor_07
		db 0
		db _77_deltaY__m1_dbX
		db 0
		db _DB_setLoColor_12_green
		db 1
		db 2
		db _DC_setLoColor_13_blue
		db 3
		db _AC_deltaX__m3
		db _D3_setLoColor_04
		db 4
		db 5
		db _D4_setLoColor_05
		db 6
		db _AC_deltaX__m3
		db _D3_setLoColor_04
		db 7
		db 8
		db _D4_setLoColor_05
		db 9
		db _AB_deltaX__m4
		db _DE_setLoColor_15
		db 0Ah
		db 0Bh
		db _D6_setLoColor_07
		db 0Ch
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 0Dh
		db 0Eh
		db _D6_setLoColor_07
		db 0Fh
		db _FF_EndMSG
;
redGroundBlock1:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko RAM:872Fo ...
		dw FNT_RedGround	; 20 chars
		db _D9_setLoColor_10_RED
		db 0Ch
		db _D2_setLoColor_03
		db 0Dh
		db _D9_setLoColor_10_RED
		db 0Eh
		db _D2_setLoColor_03
		db 0Fh
		db _AB_deltaX__m4
		db _D2_setLoColor_03
		db 0
		db _D9_setLoColor_10_RED
		db 1
		db _D2_setLoColor_03
		db 2
		db _D9_setLoColor_10_RED
		db 3
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 10h
		db _D2_setLoColor_03
		db 11h
		db _D9_setLoColor_10_RED
		db 12h
		db _D2_setLoColor_03
		db 13h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
redGroundBlock2:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko RAM:8734o ...
		dw FNT_RedGround	; 20 chars
		db _D9_setLoColor_10_RED
		db _D9_setLoColor_10_RED
		db 0Eh
		db _D2_setLoColor_03
		db 0Fh
		db _D9_setLoColor_10_RED
		db 0Dh
		db _D2_setLoColor_03
		db 0Ch
		db _AB_deltaX__m4
		db _D2_setLoColor_03
		db 8
		db _D9_setLoColor_10_RED
		db 9
		db _D2_setLoColor_03
		db 0Ah
		db _D9_setLoColor_10_RED
		db 0Bh
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 11h
		db _D2_setLoColor_03
		db 10h
		db _D9_setLoColor_10_RED
		db 13h
		db _D2_setLoColor_03
		db 12h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
redGroundBlock3:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko RAM:8739o ...
		dw FNT_RedGround	; 20 chars
		db _D9_setLoColor_10_RED
		db _D9_setLoColor_10_RED
		db 0Eh
		db _D2_setLoColor_03
		db 0Fh
		db _D9_setLoColor_10_RED
		db 0Dh
		db _D2_setLoColor_03
		db 0Ch
		db _AB_deltaX__m4
		db _D2_setLoColor_03
		db 3
		db _D9_setLoColor_10_RED
		db 2
		db _D2_setLoColor_03
		db 1
		db _D9_setLoColor_10_RED
		db 0
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 12h
		db _D2_setLoColor_03
		db 10h
		db _D9_setLoColor_10_RED
		db 13h
		db _D2_setLoColor_03
		db 11h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
redGroundBlock4:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko RAM:873Eo ...
		dw FNT_RedGround	; 20 chars
		db _DA_setLoColor_11_purple
		db _D9_setLoColor_10_RED
		db 0Ch
		db _D2_setLoColor_03
		db 0Eh
		db _D9_setLoColor_10_RED
		db 0Dh
		db _D2_setLoColor_03
		db 0Fh
		db _AB_deltaX__m4
		db _D2_setLoColor_03
		db 0Bh
		db _D9_setLoColor_10_RED
		db 0Ah
		db _D2_setLoColor_03
		db 9
		db _D9_setLoColor_10_RED
		db 8
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 13h
		db _D2_setLoColor_03
		db 12h
		db _D9_setLoColor_10_RED
		db 11h
		db _D2_setLoColor_03
		db 10h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
redGroundBlock_LONG:db _E1_DBcnt_xLoopStart ; DATA XREF: RAM:xZoneBlocko
		db 2
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock1
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock2
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock3
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock4
		db _78_deltaY__p0_dbX
		db 4
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
;
GateGreen:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_Gate		; 20 chars
		db _E9_setNoOverPlayer
		db _E8_LD_DB_setNoWalk
		db 4
		db _D9_setLoColor_10_RED
		db 0Dh
		db _78_deltaY__p0_dbX
		db 4
		db 0Dh
		db _78_deltaY__p0_dbX
		db 4
		db 0Dh
		db _A4_deltaX_m11_dbY
		db _E8_LD_DB_setNoWalk
		db 0
		db _DB_setLoColor_12_green
		db 0Ah
		db _E4_DBcnt_DBCHR_FillCharX
		db 5
		db 0Bh
		db _D3_setLoColor_04
		db _E4_DBcnt_DBCHR_FillCharX
		db 4
		db 0Bh
		db 0Ch
		db _A5_deltaX_m10
		db _E3_DWptr_RecursiveCallxMSG
		dw byte_8777
		db _78_deltaY__p0_dbX
		db 2
		db _DB_setLoColor_12_green
		db 0Eh
		db 0Fh
		db _D3_setLoColor_04
		db 10h
		db 11h
		db 12h
		db _E3_DWptr_RecursiveCallxMSG
		dw byte_8777
		db _AB_deltaX__m4
		db _E8_LD_DB_setNoWalk
		db 4
		db _D9_setLoColor_10_RED
		db 13h
		db 13h
		db 13h
		db _FF_EndMSG
byte_8777:	db _DD_setLoColor_14	; DATA XREF: RAM:8761o	RAM:876Do
		db 8
		db _D5_setLoColor_06
		db 9
		db _AD_deltaX__m2
		db _E1_DBcnt_xLoopStart
		db 5
		db _DB_setLoColor_12_green
		db 0
		db _D3_setLoColor_04
		db 1
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _DB_setLoColor_12_green
		db 2
		db _D3_setLoColor_04
		db 3
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 4
		db 5
		db _D3_setLoColor_04
		db 6
		db 7
		db _FF_EndMSG
;
mineYellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_ZONE_00		; 38 chars
		db _DD_setLoColor_14
		db _E8_LD_DB_setNoWalk
		db 5
		db 1Bh
		db _E8_LD_DB_setNoWalk
		db 1
		db _D5_setLoColor_06
		db 1Ch
		db _FF_EndMSG
;
FigureYellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_FigYellow	; 31 char
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 2
		db 3
		db _D5_setLoColor_06
		db 4
		db 5
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 6
		db 7
		db _D5_setLoColor_06
		db 8
		db 9
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 0Ah
		db 0Bh
		db _D5_setLoColor_06
		db 0Ch
		db 0Dh
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 0Eh
		db 0Fh
		db _D5_setLoColor_06
		db 10h
		db 11h
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 12h
		db 13h
		db _D5_setLoColor_06
		db 14h
		db 15h
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 16h
		db 17h
		db _D5_setLoColor_06
		db 18h
		db 19h
		db _AA_deltaX__m5
		db _DD_setLoColor_14
		db 1Eh
		db 1Ah
		db 1Bh
		db 1Ch
		db 1Dh
		db _FF_EndMSG
;
redGroundBlock_LONG2:db	_E1_DBcnt_xLoopStart ; DATA XREF: RAM:xZoneBlocko
		db 2
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock4
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock3
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock2
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw redGroundBlock1
		db _78_deltaY__p0_dbX
		db 4
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
;
TowerDishWhite:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_WhiteDish	; 42 chars
		db _DE_setLoColor_15
		db 0
		db _D6_setLoColor_07
		db 1
		db 2
		db 3
		db 4
		db _AA_deltaX__m5
		db _DE_setLoColor_15
		db 5
		db _D6_setLoColor_07
		db 6
		db 7
		db 8
		db 9
		db _AA_deltaX__m5
		db _DE_setLoColor_15
		db 0Ah
		db _D6_setLoColor_07
		db 0Bh
		db 0Ch
		db 0Dh
		db 0Eh
		db _AB_deltaX__m4
		db _DE_setLoColor_15
		db 0Fh
		db _D6_setLoColor_07
		db 10h
		db 11h
		db _AD_deltaX__m2
		db 12h
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 13h
		db _D6_setLoColor_07
		db 14h
		db 15h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 16h
		db _D6_setLoColor_07
		db 17h
		db 18h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 16h
		db _D6_setLoColor_07
		db 19h
		db 18h
		db _FF_EndMSG
;
TowerRocketWhite:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_WhiteDish	; 42 chars
		db _DE_setLoColor_15
		db 1Ah
		db _D6_setLoColor_07
		db 1Bh
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 1Ch
		db _D6_setLoColor_07
		db 1Dh
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 1Eh
		db _D6_setLoColor_07
		db 1Fh
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 20h
		db 21h
		db _D6_setLoColor_07
		db 22h
		db 23h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 24h
		db _D6_setLoColor_07
		db 25h
		db 26h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 27h
		db _D6_setLoColor_07
		db 28h
		db 29h
		db _FF_EndMSG
;
TeleportGATE:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_Gate2		; 12 chars
		db _DC_setLoColor_13_blue
		db 0
		db 1
		db _D4_setLoColor_05
		db 2
		db 3
		db _AB_deltaX__m4
		db 4
		db _DC_setLoColor_13_blue
		db _E8_LD_DB_setNoWalk
		db 6
		db 5
		db _E8_LD_DB_setNoWalk
		db 1
		db _D4_setLoColor_05
		db 6
		db 4
		db _AB_deltaX__m4
		db _E8_LD_DB_setNoWalk
		db 4
		db 7
		db _AE_deltaX__m1
		db _E8_LD_DB_setNoWalk
		db 0
		db _DC_setLoColor_13_blue
		db 4
		db _AE_deltaX__m1
		db _E8_LD_DB_setNoWalk
		db 4
		db 7
		db _76_deltaY__m2_dbX
		db 2
		db 7
		db _AE_deltaX__m1
		db _D4_setLoColor_05
		db _E8_LD_DB_setNoWalk
		db 0
		db 4
		db _AE_deltaX__m1
		db _E8_LD_DB_setNoWalk
		db 4
		db 7
		db _AB_deltaX__m4
		db _E8_LD_DB_setNoWalk
		db 0
		db _DC_setLoColor_13_blue
		db 8
		db 9
		db _D4_setLoColor_05
		db 0Ah
		db 0Bh
		db _FF_EndMSG
;
box_white:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
					; chkBoxAmoGrenade?+25o
		dw FNT_BOX		; 4  char
		db _E8_LD_DB_setNoWalk
		db 7
		db _DE_setLoColor_15
		db 0
		db _E8_LD_DB_setNoWalk
		db 0
		db _D6_setLoColor_07
		db 1
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 2
		db _D6_setLoColor_07
		db 3
		db _FF_EndMSG
box_yellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
					; chkBoxAmoGrenade?+7Bo
		dw FNT_BOX		; 4  char
		db _E8_LD_DB_setNoWalk
		db 8
		db _DD_setLoColor_14
		db 0
		db _E8_LD_DB_setNoWalk
		db 0
		db _D5_setLoColor_06
		db 1
		db _AD_deltaX__m2
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _FF_EndMSG
bobs_circle:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_CIRCLE		; 20 chars
		db _DC_setLoColor_13_blue
		db 0
		db 1
		db _D4_setLoColor_05
		db 2
		db 3
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 4
		db _E8_LD_DB_setNoWalk
		db 9
		db _D9_setLoColor_10_RED
		db _E7_SPACE
		db _E8_LD_DB_setNoWalk
		db 0
		db _E7_SPACE
		db _E8_LD_DB_setNoWalk
		db 1
		db _D4_setLoColor_05
		db 5
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 6
		db _E8_LD_DB_setNoWalk
		db 0
		db _D9_setLoColor_10_RED
		db _E7_SPACE
		db _E7_SPACE
		db _E8_LD_DB_setNoWalk
		db 1
		db _D4_setLoColor_05
		db 7
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 8
		db 9
		db _D4_setLoColor_05
		db 0Ah
		db 0Bh
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 0Ch
		db 0Dh
		db _D5_setLoColor_06
		db 0Eh
		db 0Fh
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 10h
		db 11h
		db _D5_setLoColor_06
		db 12h
		db 13h
		db _FF_EndMSG
;
ENIMY_10:	db _EB_AnimatedObject	; DATA XREF: RAM:xZoneBlocko
		db 0Ah
		db _FF_EndMSG
;
GroundGreenLONG:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GreenGround	; 25 chars
		db _DB_setLoColor_12_green
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 6
		db 7
		db 0
		db 1
		db 1
		db 2
		db 6
		db 7
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 0
		db 1
		db 2
		db 6
		db 7
		db 6
		db 7
		db 0
		db 1
		db 2
		db _79_deltaY__p1_dbX
		db 0E0h
		db _D3_setLoColor_04
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 8
		db 9
		db 3
		db 4
		db 4
		db 5
		db 8
		db 9
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 3
		db 4
		db 5
		db 8
		db 9
		db 8
		db 9
		db 3
		db 4
		db 5
		db _FF_EndMSG
VWALL_White:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GreenGround	; 25 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DE_setLoColor_15
		db 0Ah
		db _D6_setLoColor_07
		db 0Bh
		db 0Ch
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 0Dh
		db _D6_setLoColor_07
		db 0Eh
		db 0Fh
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 10h
		db _D6_setLoColor_07
		db 11h
		db 12h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 13h
		db _D6_setLoColor_07
		db 14h
		db 15h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 16h
		db _D6_setLoColor_07
		db 17h
		db 18h
		db _AC_deltaX__m3
		db _FF_EndMSG
ColumnGreenYellow:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko
		dw FNT_Gate		; 20 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DD_setLoColor_14
		db 8
		db _D5_setLoColor_06
		db 9
		db _AD_deltaX__m2
		db _E1_DBcnt_xLoopStart
		db 4
		db _DB_setLoColor_12_green
		db 0
		db _D3_setLoColor_04
		db 1
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _DB_setLoColor_12_green
		db 2
		db _D3_setLoColor_04
		db 3
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 4
		db 5
		db _D3_setLoColor_04
		db 6
		db 7
		db _FF_EndMSG
;
DoubleLaserGun:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_Planet2		; 18 chars
		db _E8_LD_DB_setNoWalk
		db 0Bh
		db _DB_setLoColor_12_green
		db 9
		db _E8_LD_DB_setNoWalk
		db 0Eh
		db _DE_setLoColor_15
		db 0Ah
		db _E8_LD_DB_setNoWalk
		db 0
		db _D3_setLoColor_04
		db 0Bh
		db _DD_setLoColor_14
		db 0Ch
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db _E8_LD_DB_setNoWalk
		db 0Bh
		db 9
		db _E8_LD_DB_setNoWalk
		db 0Eh
		db _DE_setLoColor_15
		db 0Ah
		db _E8_LD_DB_setNoWalk
		db 0
		db _D3_setLoColor_04
		db 0Bh
		db _D5_setLoColor_06
		db 0Dh
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 0Eh
		db _D5_setLoColor_06
		db 0Fh
		db 10h
		db 11h
		db _FF_EndMSG
;
VWALL_PurpleRed:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GreenGround	; 25 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DA_setLoColor_11_purple
		db 0Ah
		db _D2_setLoColor_03
		db 0Bh
		db _D9_setLoColor_10_RED
		db 0Ch
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 0Dh
		db _D2_setLoColor_03
		db 0Eh
		db _D9_setLoColor_10_RED
		db 0Fh
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 10h
		db _D2_setLoColor_03
		db 11h
		db _D9_setLoColor_10_RED
		db 12h
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 13h
		db _D2_setLoColor_03
		db 14h
		db _D9_setLoColor_10_RED
		db 15h
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 16h
		db _D2_setLoColor_03
		db 17h
		db _D9_setLoColor_10_RED
		db 18h
		db _FF_EndMSG
YellowFireHead:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_YellowTopDown	; 37 chars
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db 2
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 3
		db _D5_setLoColor_06
		db 4
		db 5
		db _AD_deltaX__m2
		db _E8_LD_DB_setNoWalk
		db 2
		db _D9_setLoColor_10_RED
		db 6
		db _FF_EndMSG
PinkAmmoBox:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_YellowTopDown	; 37 chars
		db _DA_setLoColor_11_purple
		db _E8_LD_DB_setNoWalk
		db 0Ch
		db 7
		db _E8_LD_DB_setNoWalk
		db 1
		db 8
		db _D2_setLoColor_03
		db 9
		db _AD_deltaX__m2
		db _E8_LD_DB_setNoWalk
		db 0
		db _DA_setLoColor_11_purple
		db 0Ah
		db _AE_deltaX__m1
		db 0Bh
		db _AE_deltaX__m1
		db 0Bh
		db _AE_deltaX__m1
		db 0Ch
		db _AC_deltaX__m3
		db _E8_LD_DB_setNoWalk
		db 1
		db 0Dh
		db 0Eh
		db 0Fh
		db _D2_setLoColor_03
		db 10h
		db 11h
		db _AB_deltaX__m4
		db _DA_setLoColor_11_purple
		db 12h
		db _D2_setLoColor_03
		db 13h
		db 14h
		db _73_deltaY__m5_dbX
		db 0FCh
		db _EA_setOverPlayer
		db _E8_LD_DB_setNoWalk
		db 0
		db _DE_setLoColor_15
		db 15h
		db _AE_deltaX__m1
		db 16h
		db _AE_deltaX__m1
		db 17h
		db _AE_deltaX__m1
		db 18h
		db _75_deltaY__m3_dbX
		db 3
		db 19h
		db _AE_deltaX__m1
		db 1Ah
		db _AE_deltaX__m1
		db 1Bh
		db _AE_deltaX__m1
		db 1Ch
		db _FF_EndMSG
planetMediumGreen:db _E6_DW_FONT	; DATA XREF: RAM:71ABo	RAM:71B7o ...
		dw FONT_Planet2		; 18 chars
		db _EA_setOverPlayer
		db _E8_LD_DB_setNoWalk
		db 0
		db _DB_setLoColor_12_green
		db 0
		db _D3_setLoColor_04
		db 1
		db 2
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 3
		db _D3_setLoColor_04
		db 4
		db 5
		db _AC_deltaX__m3
		db 6
		db 7
		db 8
		db _FF_EndMSG
SphereWithLinesGreen:db	_E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko
		dw FNT_SphreWithHead	; 22 chars
		db _E8_LD_DB_setNoWalk
		db 0Dh
		db _DE_setLoColor_15
		db 0
		db _E8_LD_DB_setNoWalk
		db 1
		db 1
		db _D6_setLoColor_07
		db 2
		db 3
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 4
		db _D6_setLoColor_07
		db 5
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 6
		db _DB_setLoColor_12_green
		db 7
		db _D3_setLoColor_04
		db 8
		db _D6_setLoColor_07
		db 9
		db _AB_deltaX__m4
		db _DE_setLoColor_15
		db 0Ah
		db _DB_setLoColor_12_green
		db 0Bh
		db _D3_setLoColor_04
		db 0Ch
		db _D6_setLoColor_07
		db 0Dh
		db _FF_EndMSG
SphereBase:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_SphreWithHead	; 22 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DE_setLoColor_15
		db 0Eh
		db _D6_setLoColor_07
		db 0Fh
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 10h
		db _D6_setLoColor_07
		db 11h
		db _AD_deltaX__m2
		db _DA_setLoColor_11_purple
		db 12h
		db _D2_setLoColor_03
		db 13h
		db _AD_deltaX__m2
		db _DA_setLoColor_11_purple
		db 12h
		db _D2_setLoColor_03
		db 13h
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 14h
		db 12h
		db _D2_setLoColor_03
		db 13h
		db 15h
		db _FF_EndMSG
VBricksYellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_SmallHLIne	; 4 chars
		db _E1_DBcnt_xLoopStart
		db 10h
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
HBrickYellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_SmallHLIne	; 4 chars
		db _DD_setLoColor_14
		db _E5_DBcnt_DBCHR_FillCharY
		db 4
		db 2
		db _FF_EndMSG
planetSmallYellow:db _E6_DW_FONT	; DATA XREF: RAM:71D5o	RAM:xZoneBlocko
		dw FONT_Planet		; 20 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _EA_setOverPlayer
		db _DD_setLoColor_14
		db 10h
		db _D5_setLoColor_06
		db 11h
		db _AD_deltaX__m2
		db _DD_setLoColor_14
		db 12h
		db _D5_setLoColor_06
		db 13h
		db _FF_EndMSG
planerSmallRedPurple:db	_E6_DW_FONT	; DATA XREF: RAM:71DBo	RAM:xZoneBlocko
		dw FONT_Planet2		; 18 chars
		db _EA_setOverPlayer
		db _E8_LD_DB_setNoWalk
		db 0
		db _DA_setLoColor_11_purple
		db 0
		db _D2_setLoColor_03
		db 1
		db _D9_setLoColor_10_RED
		db 2
		db _AC_deltaX__m3
		db _DA_setLoColor_11_purple
		db 3
		db _D2_setLoColor_03
		db 4
		db _D9_setLoColor_10_RED
		db 5
		db _AC_deltaX__m3
		db 6
		db 7
		db 8
		db _FF_EndMSG
planetBigCyan:	db _E6_DW_FONT		; DATA XREF: RAM:71C9o	RAM:71E1o ...
		dw FONT_Planet		; 20 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _EA_setOverPlayer
		db _DC_setLoColor_13_blue
		db 0
		db 1
		db _D4_setLoColor_05
		db 2
		db 3
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 4
		db 5
		db _D4_setLoColor_05
		db 6
		db 7
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 8
		db 9
		db _D4_setLoColor_05
		db 0Ah
		db 0Bh
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 0Ch
		db 0Dh
		db _D4_setLoColor_05
		db 0Eh
		db 0Fh
		db _FF_EndMSG
;
HWALL_White:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GreenGround	; 25 chars
		db _DE_setLoColor_15
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 6
		db 7
		db 0
		db 1
		db 1
		db 2
		db 6
		db 7
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 0
		db 1
		db 2
		db 6
		db 7
		db 6
		db 7
		db 0
		db 1
		db 2
		db _79_deltaY__p1_dbX
		db 0E0h
		db _D6_setLoColor_07
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 8
		db 9
		db 3
		db 4
		db 4
		db 5
		db 8
		db 9
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 3
		db 4
		db 5
		db 8
		db 9
		db 8
		db 9
		db 3
		db 4
		db 5
		db _FF_EndMSG
;
ENIMY_09:	db _EB_AnimatedObject	; DATA XREF: RAM:xZoneBlocko
		db 9
		db _FF_EndMSG
;
Wagonetka:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GroundRed	; 28 chars
		db _D9_setLoColor_10_RED
		db 0
		db 1
		db 2
		db _D1_setLoColor_02
		db 3
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 4
		db 5
		db 5
		db _D3_setLoColor_04
		db 6
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 7
		db 8
		db _D3_setLoColor_04
		db 9
		db 0Ah
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 0Bh
		db 0Ch
		db _D3_setLoColor_04
		db 0Dh
		db 0Eh
		db _AB_deltaX__m4
		db _DE_setLoColor_15
		db 0Fh
		db _D6_setLoColor_07
		db 10h
		db 11h
		db 12h
		db _FF_EndMSG
;
HillGroundRed:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GroundRed	; 28 chars
		db _D9_setLoColor_10_RED
		db 13h
		db _D2_setLoColor_03
		db 14h
		db _D9_setLoColor_10_RED
		db 15h
		db _AB_deltaX__m4
		db _D9_setLoColor_10_RED
		db 16h
		db _D2_setLoColor_03
		db 17h
		db _D9_setLoColor_10_RED
		db 18h
		db _D2_setLoColor_03
		db 19h
		db _D9_setLoColor_10_RED
		db 1Ah
		db _D2_setLoColor_03
		db 1Bh
		db _A9_deltaX__m6_dbY
		db _E6_DW_FONT
		dw FNT_RedGround	; 20 chars
		db _D2_setLoColor_03
		db 0
		db _D9_setLoColor_10_RED
		db 1
		db _D2_setLoColor_03
		db 2
		db _D9_setLoColor_10_RED
		db 3
		db _D2_setLoColor_03
		db 4
		db _D9_setLoColor_10_RED
		db 5
		db _FF_EndMSG
;
EndStage:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_EndLevel	; 29 chars
		db _E3_DWptr_RecursiveCallxMSG
		dw EndStageColumn
		db _78_deltaY__p0_dbX
		db 2
		db _EB_AnimatedObject
		db 0Fh
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw EndStageColumn
		db _86_deltaY_014_dbX
		db 0FCh
		db _E8_LD_DB_setNoWalk
		db 1
		db _DC_setLoColor_13_blue
		db 10h
		db 11h
		db _D4_setLoColor_05
		db 12h
		db 13h
		db _73_deltaY__m5_dbX
		db 0FDh
		db _EB_AnimatedObject
		db 10h
		db _FF_EndMSG
;
EndStageColumn:	db _E8_LD_DB_setNoWalk	; DATA XREF: RAM:8B5Bo	RAM:8B64o
		db 0
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _AD_deltaX__m2
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 4
		db _D6_setLoColor_07
		db 5
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 6
		db _D4_setLoColor_05
		db 7
		db _AD_deltaX__m2
		db _DB_setLoColor_12_green
		db 8
		db _D3_setLoColor_04
		db 9
		db _AD_deltaX__m2
		db _DB_setLoColor_12_green
		db 0Ah
		db _D3_setLoColor_04
		db 0Bh
		db _AD_deltaX__m2
		db _DA_setLoColor_11_purple
		db 0Ch
		db _D2_setLoColor_03
		db 0Dh
		db _AD_deltaX__m2
		db _E1_DBcnt_xLoopStart
		db 6
		db _DA_setLoColor_11_purple
		db 0Eh
		db _D2_setLoColor_03
		db 0Fh
		db _AD_deltaX__m2
		db _E2_xMSG_NEXT_e1
		db _DA_setLoColor_11_purple
		db 14h
		db _D2_setLoColor_03
		db 15h
		db _AD_deltaX__m2
		db _DA_setLoColor_11_purple
		db 16h
		db _D2_setLoColor_03
		db 17h
		db _FF_EndMSG
;
MarkerGreenRed:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_EndLevel	; 29 chars
		db _E8_LD_DB_setNoWalk
		db 4
		db _E0_Attribute?
		db 3
		db 18h
		db _AE_deltaX__m1
		db _E8_LD_DB_setNoWalk
		db 0
		db _DB_setLoColor_12_green
		db 19h
		db _AD_deltaX__m2
		db 1Ah
		db _D3_setLoColor_04
		db 1Bh
		db 1Ch
		db _FF_EndMSG
;
gunMachineTop:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GunMachine	; 32 chars
		db _E8_LD_DB_setNoWalk
		db 3
		db _DD_setLoColor_14
		db 12h
		db _E8_LD_DB_setNoWalk
		db 1
		db 13h
		db _E6_DW_FONT
		dw FONT_GunMachineBottom ; 25 chars
		db _DE_setLoColor_15
		db 0
		db 1
		db _D6_setLoColor_07
		db 2
		db 3
		db _AA_deltaX__m5
		db _DB_setLoColor_12_green
		db 4
		db 5
		db _D3_setLoColor_04
		db 6
		db 7
		db _FF_EndMSG
;
gunMachineBottom:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FONT_GunMachineBottom ; 25 chars
		db _DD_setLoColor_14
		db _E8_LD_DB_setNoWalk
		db 0Bh
		db 8
		db _E8_LD_DB_setNoWalk
		db 0Eh
		db _D5_setLoColor_06
		db 9
		db _DB_setLoColor_12_green
		db 0Ah
		db 0Bh
		db _D3_setLoColor_04
		db _E8_LD_DB_setNoWalk
		db 0
		db 0Ch
		db 0Dh
		db _AB_deltaX__m4
		db _DD_setLoColor_14
		db 0Eh
		db 0Fh
		db _D5_setLoColor_06
		db 0Fh
		db 10h
		db _FF_EndMSG
;
MushroomGreen:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_MushRoom		; 31 chars
		db _DB_setLoColor_12_green
		db 0
		db 1
		db _D3_setLoColor_04
		db 2
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 3
		db 4
		db _D3_setLoColor_04
		db 5
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 6
		db _D3_setLoColor_04
		db 7
		db 8
		db _AC_deltaX__m3
		db _DB_setLoColor_12_green
		db 9
		db _D3_setLoColor_04
		db 0Ah
		db 0Bh
		db _FF_EndMSG
;
VContainer1Yellow:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko RAM:8C51o
		dw FNT_MushRoom		; 31 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DD_setLoColor_14
		db 0Ch
		db _D5_setLoColor_06
		db 0Dh
		db 0Eh
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 0Fh
		db _D5_setLoColor_06
		db 10h
		db 11h
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 0Fh
		db _D5_setLoColor_06
		db 10h
		db 11h
		db _AC_deltaX__m3
		db _DD_setLoColor_14
		db 12h
		db _D5_setLoColor_06
		db 13h
		db 14h
		db _FF_EndMSG
;
LUDiagonal:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_MushRoom		; 31 chars
		db _EA_setOverPlayer
		db _DE_setLoColor_15
		db 15h
		db _D6_setLoColor_07
		db 16h
		db _AC_deltaX__m3
		db _DE_setLoColor_15
		db 17h
		db _D6_setLoColor_07
		db 18h
		db _AD_deltaX__m2
		db 19h
		db _FF_EndMSG
;
RUDiagonal:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_MushRoom		; 31 chars
		db _EA_setOverPlayer
		db _DE_setLoColor_15
		db 1Ah
		db _D6_setLoColor_07
		db 1Bh
		db _AE_deltaX__m1
		db _DE_setLoColor_15
		db 1Ch
		db _D6_setLoColor_07
		db 1Dh
		db _AE_deltaX__m1
		db _DE_setLoColor_15
		db 1Eh
		db _FF_EndMSG
;
VContainer4Yekllow:db _E1_DBcnt_xLoopStart ; DATA XREF:	RAM:xZoneBlocko
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw VContainer1Yellow
		db _7C_deltaY__p4_dbX
		db 0
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
;
TwoYellowBlueSphere:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko
		dw FNT_DOWNSPH		; 12 chars
		db _E3_DWptr_RecursiveCallxMSG
		dw YellowBlueSphere
		db _7C_deltaY__p4_dbX
		db 2
		db _EB_AnimatedObject
		db 0Fh
		db _74_deltaY__m4_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw YellowBlueSphere
		db _FF_EndMSG
;
YellowBlueSphere:db _DD_setLoColor_14	; DATA XREF: RAM:8C5Bo	RAM:8C64o
		db 0
		db _D5_setLoColor_06
		db 1
		db _AD_deltaX__m2
		db _DD_setLoColor_14
		db 2
		db _D5_setLoColor_06
		db 3
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 4
		db _DC_setLoColor_13_blue
		db 5
		db _AD_deltaX__m2
		db _DE_setLoColor_15
		db 6
		db _DC_setLoColor_13_blue
		db 7
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 8
		db _D4_setLoColor_05
		db 9
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 0Ah
		db _D4_setLoColor_05
		db 0Bh
		db _FF_EndMSG
;
HLineYellow:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_YellowHLine	; 19 chars
		db _DD_setLoColor_14
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 6
		db 7
		db 0
		db 1
		db 1
		db 2
		db 6
		db 7
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 0
		db 1
		db 2
		db 6
		db 7
		db 6
		db 7
		db 0
		db 1
		db 2
		db _79_deltaY__p1_dbX
		db 0E0h
		db _D5_setLoColor_06
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 8
		db 9
		db 3
		db 4
		db 4
		db 5
		db 8
		db 9
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 3
		db 4
		db 5
		db 8
		db 9
		db 8
		db 9
		db 3
		db 4
		db 5
		db _FF_EndMSG
;
VContainer1Cyan:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_YellowHLine	; 19 chars
		db _E8_LD_DB_setNoWalk
		db 0
		db _DC_setLoColor_13_blue
		db 0Ah
		db 0Bh
		db _D4_setLoColor_05
		db 0Ch
		db _AC_deltaX__m3
		db _DC_setLoColor_13_blue
		db 0Dh
		db _78_deltaY__p0_dbX
		db 1
		db _D4_setLoColor_05
		db 0Eh
		db _AC_deltaX__m3
		db _DC_setLoColor_13_blue
		db 0Dh
		db _D6_setLoColor_07
		db 12h
		db _D4_setLoColor_05
		db 0Eh
		db _AC_deltaX__m3
		db _DC_setLoColor_13_blue
		db 0Dh
		db _78_deltaY__p0_dbX
		db 1
		db _D4_setLoColor_05
		db 0Eh
		db _AC_deltaX__m3
		db _DC_setLoColor_13_blue
		db 0Fh
		db _D4_setLoColor_05
		db 10h
		db 11h
		db _FF_EndMSG
;
HLineGreen:	db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_YellowHLine	; 19 chars
		db _DB_setLoColor_12_green
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 6
		db 7
		db 0
		db 1
		db 1
		db 2
		db 6
		db 7
		db 0
		db 1
		db 2
		db 6
		db 7
		db 0
		db 2
		db 0
		db 1
		db 2
		db 6
		db 7
		db 6
		db 7
		db 0
		db 1
		db 2
		db _79_deltaY__p1_dbX
		db 0E0h
		db _D3_setLoColor_04
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 8
		db 9
		db 3
		db 4
		db 4
		db 5
		db 8
		db 9
		db 3
		db 4
		db 5
		db 8
		db 9
		db 3
		db 5
		db 3
		db 4
		db 5
		db 8
		db 9
		db 8
		db 9
		db 3
		db 4
		db 5
		db _FF_EndMSG
;
HLineYellowSmal:db _E6_DW_FONT		; DATA XREF: RAM:xZoneBlocko
		dw FNT_SmallHLIne	; 4 chars
		db _E1_DBcnt_xLoopStart
		db 2
		db _DD_setLoColor_14
		db 0
		db _D5_setLoColor_06
		db 1
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
;
GroundBlockGreen1:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko RAM:8DC8o ...
		dw FNT_RedGround	; 20 chars
		db _DC_setLoColor_13_blue
		db 0Ch
		db _DB_setLoColor_12_green
		db 0Dh
		db _DC_setLoColor_13_blue
		db 0Eh
		db _DB_setLoColor_12_green
		db 0Fh
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 0
		db _DC_setLoColor_13_blue
		db 1
		db _DB_setLoColor_12_green
		db 2
		db _DC_setLoColor_13_blue
		db 3
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 10h
		db _DB_setLoColor_12_green
		db 11h
		db _DC_setLoColor_13_blue
		db 12h
		db _DB_setLoColor_12_green
		db 13h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
GroundBlockGreen2:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko RAM:8DCDo
		dw FNT_RedGround	; 20 chars
		db _DC_setLoColor_13_blue
		db _DC_setLoColor_13_blue
		db 0Eh
		db _DB_setLoColor_12_green
		db 0Fh
		db _DC_setLoColor_13_blue
		db 0Dh
		db _DB_setLoColor_12_green
		db 0Ch
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 8
		db _DC_setLoColor_13_blue
		db 9
		db _DB_setLoColor_12_green
		db 0Ah
		db _DC_setLoColor_13_blue
		db 0Bh
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 11h
		db _DB_setLoColor_12_green
		db 10h
		db _DC_setLoColor_13_blue
		db 13h
		db _DB_setLoColor_12_green
		db 12h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
GroundBlockGreen3:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko RAM:8DD2o ...
		dw FNT_RedGround	; 20 chars
		db _DC_setLoColor_13_blue
		db _DC_setLoColor_13_blue
		db 0Eh
		db _DB_setLoColor_12_green
		db 0Fh
		db _DC_setLoColor_13_blue
		db 0Dh
		db _DB_setLoColor_12_green
		db 0Ch
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 3
		db _DC_setLoColor_13_blue
		db 2
		db _DB_setLoColor_12_green
		db 1
		db _DC_setLoColor_13_blue
		db 0
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 12h
		db _DB_setLoColor_12_green
		db 10h
		db _DC_setLoColor_13_blue
		db 13h
		db _DB_setLoColor_12_green
		db 11h
		db _AB_deltaX__m4
		db _FF_EndMSG
;
GroundBlockGreen4:db _E6_DW_FONT	; DATA XREF: RAM:xZoneBlocko RAM:8DD7o ...
		dw FNT_RedGround	; 20 chars
		db _DB_setLoColor_12_green
		db _DC_setLoColor_13_blue
		db 0Ch
		db _DB_setLoColor_12_green
		db 0Eh
		db _DC_setLoColor_13_blue
		db 0Dh
		db _DB_setLoColor_12_green
		db 0Fh
		db _AB_deltaX__m4
		db _DB_setLoColor_12_green
		db 0Bh
		db _DC_setLoColor_13_blue
		db 0Ah
		db _DB_setLoColor_12_green
		db 9
		db _DC_setLoColor_13_blue
		db 8
		db _AB_deltaX__m4
		db _DC_setLoColor_13_blue
		db 13h
		db _DB_setLoColor_12_green
		db 12h
		db _DC_setLoColor_13_blue
		db 11h
		db _DB_setLoColor_12_green
		db 10h
		db _AB_deltaX__m4
		db _FF_EndMSG
HGroundGreenBig1:
		db _E1_DBcnt_xLoopStart ; DATA	XREF: RAM:xZoneBlocko
		db 2
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen1
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen2
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen3
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen4
		db _78_deltaY__p0_dbX
		db 4
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
HGroundGreenBig2:
		db _E1_DBcnt_xLoopStart ; DATA	XREF: RAM:xZoneBlocko
		db 2
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen4
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen3
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen2
		db _78_deltaY__p0_dbX
		db 4
		db _E3_DWptr_RecursiveCallxMSG
		dw GroundBlockGreen1
		db _78_deltaY__p0_dbX
		db 4
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG

