;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

; ; ---------------------------------------------------------------------------

; chr		struc ;	(sizeof=0x8)
; field_0:	db 8 dup(?)		; base 2
; chr		ends

; ; ---------------------------------------------------------------------------

; _XY_		struc ;	(sizeof=0x2)
; x:		db ?			; base 10
; y:		db ?			; base 10
; _XY_		ends
_XY_ 		macro 	x, y
		db 	x
		db 	y
		endm
; ; ---------------------------------------------------------------------------

; lvl		struc ;	(sizeof=0x3)
; y:		db ?			; base 10
; x:		db ?			; base 10
; chr:		db ?			; base 10
; lvl		ends
lvl 	macro y, x, blk
	db 	y,x,blk
	endm

; ; ---------------------------------------------------------------------------

; destroy_object_param struc ; (sizeof=0x5)
; _BLK:		db ?			; base 10
; dx_minus:	db ?			; base 10 signed
; dx_size:	db ?			; base 10
; dy_minus:	db ?			; base 10 signed
; dy_size:	db ?			; base 10
; destroy_object_param ends

destroy_object_param macro 	blk, dx_minus, dx_size, dy_minus, dy_size
			db 	blk,dx_minus,dx_size,dy_minus,dy_size
		     endm

; ; ---------------------------------------------------------------------------

; destroyableStruct struc	; (sizeof=0x7)
; x_from:		db ?			; base 10
; x_to:		db ?			; base 10
; y_from:		db ?			; base 10
; y_to:		db ?			; base 10
; X:		db ?			; base 10
; Y:		db ?			; base 10
; BLOCK:		db ?			; base 10
; destroyableStruct ends

; ; ---------------------------------------------------------------------------

; strXYF		struc ;	(sizeof=0x3)
; X:		db ?
; Y:		db ?
; flag?:		db ?
; strXYF		ends

; ; ---------------------------------------------------------------------------

; strSpheres	struc ;	(sizeof=0x4)
; x:		db ?
; y:		db ?
; fl1:		db ?
; fl2:		db ?
; strSpheres	ends

; ; ---------------------------------------------------------------------------

; strBoomParcticles struc	; (sizeof=0x4)
; x:		db ?
; y:		db ?
; flag?:		db ?
; field_3:	db ?
; strBoomParcticles ends

; ; ---------------------------------------------------------------------------

; ay_payer	struc ;	(sizeof=0xC)
; ch_Freq?:	dw ?
; field_2:	db ?
; field_3:	db ?
; field_4:	db ?
; field_5:	db ?
; ch_number:	db ?
; field_7:	db ?
; field_8:	db ?
; field_9:	db ?
; field_A:	db ?
; field_B:	db ?
; ay_payer	ends

; ; ---------------------------------------------------------------------------

; str_StartPos	struc ;	(sizeof=0x3)
; zone:		db ?			; base 10
; _x:		db ?			; base 10
; _y:		db ?			; base 10
; str_StartPos	ends
str_StartPos 	macro 	zone,x,y
		db 	zone,x,y
		endm
; ; ---------------------------------------------------------------------------

; str_enemy_params struc ; (sizeof=0x5)
; zone:		db ?			; base 10
; trajectory:	dw ?			; offset (00000000)
; sprite_id:	db ?			; enum eSPRITES
; delay_To_next:	db ?			; base 10
; str_enemy_params ends
str_enemy_params macro zone, trajectory, sprite_id, delay_To_next
		db 	zone
		dw 	trajectory
		db 	sprite_id
		db 	delay_To_next
		endm
; ; ---------------------------------------------------------------------------

; str_enemy	struc ;	(sizeof=0xA)
; X_120:		db ?			; xpos ?
; _Y:		db ?
; flag_inuse:	db ?
; stratrgy_src:	dw ?
; stratrgy_work:	dw ?
; c4_counter?:	db ?			; SpritePhase?
; phase?:		db ?			; SpritePhase?
; color?:		db ?
; str_enemy	ends

; ; ---------------------------------------------------------------------------

; str_explosion_particle	struc ;	(sizeof=0x6)
; inUse:		db ?
; x:		db ?
; y:		db ?
; dx:		db ?
; dy:		db ?
; color?:		db ?
; str_explosion_particle	ends

; ; ---------------------------------------------------------------------------

; str_XY		struc ;	(sizeof=0x2)
; field_0:	db ?
; field_1:	db ?
; str_XY		ends

; ; ---------------------------------------------------------------------------

; strActivObj	struc ;	(sizeof=0x6)
; strAddrStart:	dw ?			; offset (00000000)
; strAddrWork:	dw ?
; strSize:	db ?
; AnimationCode:	db ?			; enum AnimID
; strActivObj	ends
strActivObj 	macro addrStart,addrWork,ssize,anim_code
		dw 	addrStart
		dw 	addrWork
		db 	ssize
		db 	anim_code
		endm

; ; ---------------------------------------------------------------------------

; str_SpriteStragegy struc ; (sizeof=0x2)
; dx:		db ?
; dy:		db ?
; str_SpriteStragegy ends

str_SpriteStragegy macro	dx,dy
		db	dx,dy
		endm

; ; ---------------------------------------------------------------------------

; ; enum p7FFD (bitfield)
; p0:		 equ 0
; p1:		 equ 1
; p2:		 equ 2
; p3:		 equ 3
; p4:		 equ 4
; p5:		 equ 5
; p6:		 equ 6
; p7:		 equ 7
; scr5:		 equ 0
; scr7:		 equ 8
; rom128:		 equ 0
; rom48:		 equ 10h
; lock48:		 equ 20h

; ; ---------------------------------------------------------------------------

; ; enum enum_1
; _:		 equ 0
; z:		 equ 1
; q:		 equ 0FFh

; ; ---------------------------------------------------------------------------

; ; enum PORTS
; xSystem__FD:	 equ 0FDh
; xSystem7FFD:	 equ 7FFDh

; ---------------------------------------------------------------------------

; enum xMsgConsts
_61_deltaY_m23_dbX equ	61h
_62_deltaY_m22_dbX equ	62h
_63_deltaY_m21_dbX equ	63h
_64_deltaY_m20_dbX equ	64h
_65_deltaY_m19_dbX equ	65h
_66_deltaY_m18_dbX equ	66h
_67_deltaY_m17_dbX equ	67h
_68_deltaY_m16_dbX equ	68h
_69_deltaY_m15_dbX equ	69h
_6A_deltaY_m14_dbX equ	6Ah
_6B_deltaY_m13_dbX equ	6Bh
_6C_deltaY_m12_dbX equ	6Ch
_6D_deltaY_m11_dbX equ	6Dh
_6E_deltaY_m10_dbX equ	6Eh
_6F_deltaY__m9_dbX equ	6Fh
_70_deltaY__m8_dbX equ	70h
_71_deltaY__m7_dbX equ	71h
_72_deltaY__m6_dbX equ	72h
_73_deltaY__m5_dbX equ	73h
_74_deltaY__m4_dbX equ	74h
_75_deltaY__m3_dbX equ	75h
_76_deltaY__m2_dbX equ	76h
_77_deltaY__m1_dbX equ	77h
_78_deltaY__p0_dbX equ	78h
_79_deltaY__p1_dbX equ	79h
_7A_deltaY__p2_dbX equ	7Ah
_7B_deltaY__p3_dbX equ	7Bh
_7C_deltaY__p4_dbX equ	7Ch
_7D_deltaY__p5_dbX equ	7Dh
_7E_deltaY__p6_dbX equ	7Eh
_7F_deltaY__p7_dbX equ	7Fh
_80_deltaY__p8_dbX equ	80h
_81_deltaY__p9_dbX equ	81h
_82_deltaY_010_dbX equ	82h
_83_deltaY_011_dbX equ	83h
_84_deltaY_012_dbX equ	84h
_85_deltaY_013_dbX equ	85h
_86_deltaY_014_dbX equ	86h
_87_deltaY_015_dbX equ	87h
_88_deltaY_016_dbX equ	88h
_89_deltaY_017_dbX equ	89h
_8A_deltaY_018_dbX equ	8Ah
_8B_deltaY_019_dbX equ	8Bh
_8C_deltaY_020_dbX equ	8Ch
_8D_deltaY_021_dbX equ	8Dh
_8E_deltaY_022_dbX equ	8Eh
_8F_deltaY_023	 equ 8Fh
_90_deltaY_024	 equ 90h
_91_deltaX_m30	 equ 91h
_92_deltaX_m29	 equ 92h
_93_deltaX_m28	 equ 93h
_94_deltaX_m27	 equ 94h
_95_deltaX_m26	 equ 95h
_96_deltaX_m25	 equ 96h
_97_deltaX_m24_dbY equ	97h
_98_deltaX_m23_dbY equ	98h
_99_deltaX_m22_dbY equ	99h
_9A_deltaX_m21_dbY equ	9Ah
_9B_deltaX_m20_dbY equ	9Bh
_9C_deltaX_m19_dbY equ	9Ch
_9D_deltaX_m18_dbY equ	9Dh
_9E_deltaX_m17_dbY equ	9Eh
_9F_deltaX_m16_dbY equ	9Fh
_A0_deltaX_m15_dbY equ	0A0h
_A1_deltaX_m14_dbY equ	0A1h
_A2_deltaX_m13_dbY equ	0A2h
_A3_deltaX_m12_dbY equ	0A3h
_A4_deltaX_m11_dbY equ	0A4h
_A5_deltaX_m10	 equ 0A5h
_A6_deltaX__m9_dbY equ	0A6h
_A7_deltaX__m8_dbY equ	0A7h
_A8_deltaX__m7_dbY equ	0A8h
_A9_deltaX__m6_dbY equ	0A9h
_AA_deltaX__m5	 equ 0AAh
_AB_deltaX__m4	 equ 0ABh
_AC_deltaX__m3	 equ 0ACh
_AD_deltaX__m2	 equ 0ADh
_AE_deltaX__m1	 equ 0AEh
_AF_deltaX__p0_dbY equ	0AFh
_B0_deltaX__p1_dbY equ	0B0h
_B1_deltaX__p2_dbY equ	0B1h
_B2_deltaX__p3_dbY equ	0B2h
_B3_deltaX__p4_dbY equ	0B3h
_B4_deltaX__p5_dbY equ	0B4h
_B5_deltaX__p6_dbY equ	0B5h
_B6_deltaX__p7_dbY equ	0B6h
_B7_deltaX__p8_dbY equ	0B7h
_B8_deltaX__p9_dbY equ	0B8h
_B9_deltaX_010_dbY equ	0B9h
_BA_deltaX_011_dbY equ	0BAh
_BB_deltaX_012_dbY equ	0BBh
_BC_deltaX_013_dbY equ	0BCh
_BD_deltaX_014_dbY equ	0BDh
_BE_deltaX_015_dbY equ	0BEh
_BF_deltaX_016_dbY equ	0BFh
_C0_deltaX_017_dbY equ	0C0h
_C1_deltaX_018_dbY equ	0C1h
_C2_deltaX_019_dbY equ	0C2h
_C3_deltaX_020_dbY equ	0C3h
_C4_deltaX_021_dbY equ	0C4h
_C5_deltaX_022_dbY equ	0C5h
_C6_deltaX_023_dbY equ	0C6h
_C7_deltaX_024_dbY equ	0C7h
_C8_deltaX_025_dbY equ	0C8h
_C9_deltaX_026_dbY equ	0C9h
_CA_deltaX_027_dbY equ	0CAh
_CB_deltaX_028_dbY equ	0CBh
_CC_deltaX_029_dbY equ	0CCh
_CD_deltaX_030_dbY equ	0CDh
_CE_deltaX_031_dbY equ	0CEh
_CF_setLoColor_00 equ 0CFh
_D0_setLoColor_01 equ 0D0h
_D1_setLoColor_02 equ 0D1h
_D2_setLoColor_03 equ 0D2h
_D3_setLoColor_04 equ 0D3h
_D4_setLoColor_05 equ 0D4h
_D5_setLoColor_06 equ 0D5h
_D6_setLoColor_07 equ 0D6h
_D7_setLoColor_08 equ 0D7h
_D8_setLoColor_09 equ 0D8h
_D9_setLoColor_10_RED equ 0D9h
_DA_setLoColor_11_purple equ 0DAh
_DB_setLoColor_12_green equ 0DBh
_DC_setLoColor_13_blue	equ 0DCh
_DD_setLoColor_14 equ 0DDh
_DE_setLoColor_15 equ 0DEh
_DF_DW_xy	 equ 0DFh
_E0_Attribute?	 equ 0E0h
_E1_DBcnt_xLoopStart equ 0E1h
_E2_xMSG_NEXT_e1 equ 0E2h
_E3_DWptr_RecursiveCallxMSG equ 0E3h
_E4_DBcnt_DBCHR_FillCharX equ 0E4h
_E5_DBcnt_DBCHR_FillCharY equ 0E5h
_E6_DW_FONT	 equ 0E6h
_E7_SPACE	 equ 0E7h
_E8_LD_DB_setNoWalk equ 0E8h
_E9_setNoOverPlayer equ 0E9h
_EA_setOverPlayer equ 0EAh
_EB_AnimatedObject equ	0EBh
_FF_EndMSG	 equ 0FFh

; ---------------------------------------------------------------------------

; enum eSPRITES
sEMPTY 		 equ 0
sShip1_1 	 equ 1
sShip1_2 	 equ 2
sShip1_3 	 equ 3
sShip1_4 	 equ 4
sCircle1_1 	 equ 5
sCircle1_2 	 equ 6
sCircle1_3 	 equ 7
sCircle1_4 	 equ 8
sCircle1_5 	 equ 9
sRocketGreen 	 equ 0Ah
sRocketGreenTail equ 0Bh
sStar_1 	 equ 0Ch
sStar_2 	 equ 0Dh
sStar_3 	 equ 0Eh
sStar_4 	 equ 0Fh
sBall_1 	 equ 10h
sBall_2 	 equ 11h
sBall_3 	 equ 12h
sBall_4 	 equ 13h
sShipBee_1 	 equ 14h
sShipBee_2 	 equ 15h
sShipBee_3 	 equ 16h
sShipBee_4 	 equ 17h
sRocket_1 	 equ 18h
sRocket_2 	 equ 19h
sRocket_3 	 equ 1Ah
sRocket_4 	 equ 1Bh
sHighVoltage1	 equ 1Ch
sHighVoltage2	 equ 1Dh
sHighVoltage3	 equ 1Eh
sHighVoltage4	 equ 1Fh
sHighVoltage5	 equ 20h
sHighVoltage6	 equ 21h
sHighVoltage7	 equ 22h
sHighVoltage8	 equ 23h
sLongDelayKiller equ 24h
sRocket2_1 	 equ 25h
sRocket2_2 	 equ 26h
sRocket2_3 	 equ 27h
sRocket2_4 	 equ 28h
sRocket3_1 	 equ 29h
sRocket3_2 	 equ 2Ah
sRocket3_3 	 equ 2Bh
sRocket3_4 	 equ 2Ch

; ---------------------------------------------------------------------------

; enum AY_REGS
AY_CH_A_FREQ0 	 equ 0
AY_CH_A_FREQ1 	 equ 1
AY_CH_B_FREQ0 	 equ 2
AY_CH_B_FREQ1 	 equ 3
AY_CH_C_FREQ0 	 equ 4
AY_CH_C_FREQ1 	 equ 5
AY_NOISE_PERIOD  equ 6
AY_VIOCE_ENABLE  equ 7
AY_CH_A_Volume 	 equ 8
AY_CH_B_Volume 	 equ 9
AY_CH_C_Volume 	 equ 0Ah
AY_ENVELOP_PERIOD0  equ	0Bh
AY_ENVELOP_PERIOD1  equ	0Ch
AY_ENVELOP_SHAPE  equ 0Dh
AY_IOPORT_A 	 equ 0Eh
AY_IOPORT_B 	 equ 0Fh

; ---------------------------------------------------------------------------

; enum AnimID
anim_NOOP 	 equ 0
anim_Checker 	 equ 1
anim_GunMachine  equ 3
anim_GreenSphere equ 0Dh

; ---------------------------------------------------------------------------

; enum ayplayer
ayp_01_freqhi 	 equ 0
ayp_02_freqlo 	 equ 1
ayp_06_ch 	 equ 6


sprPlayerPhase0  equ 0
sprPlayerPhase1  equ 1
sprPlayerPhase2  equ 2
sprPlayerPhase3  equ 3
sprPlayerPhase4  equ 4
sprPlayerPhase5  equ 5
sprPlayerPhase6  equ 6
sprPlayerPhase7  equ 7
sprPlayerPhase8  equ 8
sprPlayerPhase9  equ 9
sprPlayerDuck	 equ 10
sprPlayerDie 	 equ 11

sprPlayerCount 	 equ 12


pch_PutCharXorRemoveObject_2boom 	equ 	3
pch_PutCharXorRemoveObject_noBoom 	equ 	4

blk_beam_down 		equ 	 0
blk_beam_up		equ	 1
blk_ship		equ 	 2
blk_planet_big_red	equ	 3
blk_small_purpleRed	equ 	 4
blk_gunMachine1		equ 	 5

blk_red_ground1_1	equ 	6
blk_red_ground1_2	equ 	7
;blk_red_ground1_3	equ 	8
;blk_red_ground1_4	equ 	9

blk_red_ground1		equ 	10
blk_mine		equ 	12
blk_gate_green		equ 	11
blk_yellow_figure	equ 	13
blk_red_ground2		equ 	14
blk_tower_dish		equ 	15
blk_tower_rocket	equ 	16

blk_teleportGate	equ 	17
; blk_box_white		equ	18
blk_box_white		equ	19
blk_box_yellow		equ 	20
blk_birthpod		equ 	21
blk_anim_pump		equ 	22
blk_ground_green_box1	equ 	23
blk_vbox_white		equ	24
blk_vbox_green_column	equ 	25
blk_double_barrel	equ 	26
blk_vbox_purple 	equ 	27
blk_jump_platform_yellow equ 	28
blk_changing_room	equ 	29
blk_planet_medium_green	equ 	30
blk_control_beacon	equ 	31
blk_beacon_base 	equ 	32
blk_H_yellow_bricks	equ 	33
blk_V_yellow_bricks	equ 	34
blk_planet_SmallYellow	equ	35
blk_planet_SmallRedPurple equ	36
blk_planet_big_cyan	equ	37
blk_ground_white_box	equ 	38
blk_anim_swarm 		equ	39
blk_waggon 		equ 	40
blk_ground_red_hill	equ 	41
blk_stage_end		equ 	42
blk_blinker		equ 	43
blk_gunMachine_TOP	equ 	44
blk_gunMachine_BOTTOM	equ 	45
blk_mushroom		equ 	46
blk_vbox_yellow_barrel	equ 	47
blk_LUDiagonal		equ 	48
blk_RUDiagonal		equ 	49
blk_4YellowBarrel	equ 	50
blk_topdown_electro 	equ 	51
blk_ground_yellow_box	equ 	52
blk_vbox_blue_transparent equ 	53
blk_ground_green_box2	equ 	54
blk_h_yellow_small_brick equ 	55

; blk_green_ground1_1	equ 	56
; blk_green_ground1_2	equ 	57
blk_green_ground1_3	equ 	58
blk_green_ground1_4	equ 	59

blk_green_ground1	equ 	60
blk_green_ground2	equ 	61
