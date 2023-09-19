;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

init_Enemies:
		xor	a
		ld	(fl_enemy), a
;
		ld	hl, tab_enemy
		ld	a, (_ZONE)
		ld	b, a

find_enemy_tab_loop:
		ld	a, (hl)
		cp	0FFh
		ret	z
		cp	b
		jr	z, enemy_exist
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		jr	find_enemy_tab_loop
; ---------------------------------------------------------------------------

enemy_exist:
		ld	a, 1
		ld	(fl_enemy), a
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(active_enemy_trajecory+1), de
		inc	hl
		ld	a, (hl)
		ld	(active_enemy_sprite_id+1), a ; sprite base number
		inc	hl
		ld	a, (hl)
		ld	(active_enemy_delay+1), a
		ret

; ---------------------------------------------------------------------------
fl_enemy:	db 0

;enemy exist on level only if exists in this table below ;)
;
;str_enemy_params	level, trajectory_id,sprite_id, new_enemy_delay

tab_enemy:	str_enemy_params   3, enemy_trajectory_01, sBall_1	, 20 ; 0
		str_enemy_params   4, enemy_trajectory_01, sBall_1	, 20 ; 1
		str_enemy_params   5, enemy_trajectory_01, sBall_1	, 20 ; 2
		str_enemy_params  10, enemy_trajectory_02, sRocket_1	, 20 ; 3
		str_enemy_params  11, enemy_trajectory_02, sRocket_1	, 40 ; 4
		str_enemy_params  13, enemy_trajectory_02, sRocket_1	, 20 ; 5
		str_enemy_params  15, enemy_trajectory_03, sShip1_1	, 13 ; 6
		str_enemy_params  16, enemy_trajectory_02, sRocket_1	, 30 ; 7
		str_enemy_params  17, enemy_trajectory_01, sBall_1	, 20 ; 8
		str_enemy_params  19, enemy_trajectory_04, sRocket_1	, 20 ; 9
		str_enemy_params  21, enemy_trajectory_01, sBall_1	, 30 ; 10
		str_enemy_params  22, enemy_trajectory_03, sShip1_1	, 13 ; 11
		str_enemy_params  26, enemy_trajectory_04, sShipBee_1	,  8 ; 12
		str_enemy_params  28, enemy_trajectory_01, sShip1_1	, 16 ; 13
		str_enemy_params  29, enemy_trajectory_04, sRocket_1	, 25 ; 14
		str_enemy_params  30, enemy_trajectory_04, sRocket_1	, 15 ; 15
		str_enemy_params  33, enemy_trajectory_01, sBall_1	, 20 ; 16
		str_enemy_params  36, enemy_trajectory_03, sShipBee_1	,  8 ; 17
		str_enemy_params  37, enemy_trajectory_02, sShip1_1	, 20 ; 18
		str_enemy_params  38, enemy_trajectory_02, sShip1_1	,  8 ; 19
		str_enemy_params  39, enemy_trajectory_01, sBall_1	, 20 ; 20
		str_enemy_params  42, enemy_trajectory_04, sRocket_1	,  8 ; 21
		str_enemy_params  43, enemy_trajectory_04, sRocket_1	,  8 ; 22
		str_enemy_params  44, enemy_trajectory_01, sBall_1	, 20 ; 23
		str_enemy_params  48, enemy_trajectory_04, sRocket_1	, 20 ; 24
		str_enemy_params  49, enemy_trajectory_03, sBall_1	,  8 ; 25
		str_enemy_params  51, enemy_trajectory_05, sRocket2_1	,  9 ; 26
		str_enemy_params  54, enemy_trajectory_06, sRocket3_1	, 30 ; 27
		str_enemy_params  55, enemy_trajectory_01, sBall_1	,  9 ; 28
		str_enemy_params  56, enemy_trajectory_02, sRocket3_1	,  9 ; 29
		str_enemy_params  58, enemy_trajectory_06, sBall_1	, 20 ; 30
		str_enemy_params  59, enemy_trajectory_04, sRocket2_1	,  9 ; 31
		str_enemy_params  62, enemy_trajectory_05, sShip1_1	,  9 ; 32
		str_enemy_params  63, enemy_trajectory_01, sRocket2_1	,  9 ; 33
		str_enemy_params  64, enemy_trajectory_04, sRocket_1	,  9 ; 34
		str_enemy_params  66, enemy_trajectory_06, sRocket_1	, 30 ; 35
		str_enemy_params  68, enemy_trajectory_01, sShipBee_1	,  8 ; 36
		str_enemy_params  69, enemy_trajectory_04, sRocket_1	, 40 ; 37
		str_enemy_params  72, enemy_trajectory_06, sBall_1	, 35 ; 38
		str_enemy_params  74, enemy_trajectory_06, sRocket_1	, 12 ; 39
		str_enemy_params  75, enemy_trajectory_01, sBall_1	,  9 ; 40
		str_enemy_params  76, enemy_trajectory_04, sBall_1	,  9 ; 41
		str_enemy_params  77, enemy_trajectory_05, sRocket2_1	,  9 ; 42
		str_enemy_params  79, enemy_trajectory_03, sShip1_1	,  9 ; 43
		str_enemy_params  80, enemy_trajectory_06, sRocket3_1	, 30 ; 44
		str_enemy_params  83, enemy_trajectory_06, sRocket3_1	,  9 ; 45
		str_enemy_params  84, enemy_trajectory_05, sRocket3_1	,  9 ; 46
		str_enemy_params  85, enemy_trajectory_03, sBall_1	,  8 ; 47
		str_enemy_params  86, enemy_trajectory_04, sShipBee_1	,  9 ; 48
		str_enemy_params  89, enemy_trajectory_02, sRocket_1	,  9 ; 49
		str_enemy_params  90, enemy_trajectory_04, sRocket2_1	,  8 ; 50
		str_enemy_params  91, enemy_trajectory_05, sRocket3_1	, 25 ; 51
		str_enemy_params  94, enemy_trajectory_02, sShipBee_1	, 16 ; 52
		str_enemy_params  96, enemy_trajectory_06, sRocket_1	, 30 ; 53
		str_enemy_params  98, enemy_trajectory_06, sRocket3_1	, 35 ; 54
		str_enemy_params  99, enemy_trajectory_03, sBall_1	,  8 ; 55
		str_enemy_params 101, enemy_trajectory_04, sShipBee_1	,  8 ; 56
		str_enemy_params 103, enemy_trajectory_01, sShip1_1	, 10 ; 57
		str_enemy_params 104, enemy_trajectory_04, sRocket_1	, 10 ; 58
		str_enemy_params 105, enemy_trajectory_04, sRocket_1	, 10 ; 59
		str_enemy_params 108, enemy_trajectory_01, sBall_1	, 10 ; 60
		str_enemy_params 111, enemy_trajectory_03, sShipBee_1	,  8 ; 61
		str_enemy_params 112, enemy_trajectory_02, sShip1_1	, 20 ; 62
		str_enemy_params 113, enemy_trajectory_02, sShip1_1	,  8 ; 63
		str_enemy_params 114, enemy_trajectory_01, sBall_1	, 10 ; 64
		str_enemy_params 117, enemy_trajectory_04, sRocket_1	,  8 ; 65
		str_enemy_params 118, enemy_trajectory_04, sRocket_1	,  8 ; 66
		str_enemy_params 119, enemy_trajectory_01, sBall_1	, 10 ; 67
		str_enemy_params 123, enemy_trajectory_04, sRocket_1	, 10 ; 68
		str_enemy_params 124, enemy_trajectory_03, sBall_1	,  8 ; 69
		db 0FFh
