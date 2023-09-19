;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

ZONE_TAB:	dw LVL_000
		dw LVL_001
		dw LVL_002
		dw LVL_003
		dw LVL_004
		dw LVL_005
		dw LVL_006
		dw LVL_007
		dw LVL_008
		dw LVL_009
		dw LVL_010
		dw LVL_011
		dw LVL_012
		dw LVL_013
		dw LVL_014
		dw LVL_015
		dw LVL_016
		dw LVL_017
		dw LVL_018
		dw LVL_019
		dw LVL_020
		dw LVL_021
		dw LVL_022
		dw LVL_023
		dw LVL_024
		dw LVL_025
		dw LVL_026
		dw LVL_027
		dw LVL_028
		dw LVL_029
		dw LVL_030
		dw LVL_031
		dw LVL_032
		dw LVL_033
		dw LVL_034
		dw LVL_035
		dw LVL_036
		dw LVL_037
		dw LVL_038
		dw LVL_039
		dw LVL_040
		dw LVL_041
		dw LVL_042
		dw LVL_043
		dw LVL_044
		dw LVL_045
		dw LVL_046
		dw LVL_047
		dw LVL_048
		dw LVL_049
		dw LVL_050
		dw LVL_051
		dw LVL_052
		dw LVL_053
		dw LVL_054
		dw LVL_055
		dw LVL_056
		dw LVL_057
		dw LVL_058
		dw LVL_059
		dw LVL_060
		dw LVL_061
		dw LVL_062
		dw LVL_063
		dw LVL_064
		dw LVL_065
		dw LVL_066
		dw LVL_067
		dw LVL_068
		dw LVL_069
		dw LVL_070
		dw LVL_071
		dw LVL_072
		dw LVL_073
		dw LVL_074
		dw LVL_075
		dw LVL_076
		dw LVL_077
		dw LVL_078
		dw LVL_079
		dw LVL_080
		dw LVL_081
		dw LVL_082
		dw LVL_083
		dw LVL_084
		dw LVL_085
		dw LVL_086
		dw LVL_087
		dw LVL_088
		dw LVL_089
		dw LVL_090
		dw LVL_091
		dw LVL_092
		dw LVL_093
		dw LVL_094
		dw LVL_095
		dw LVL_096
		dw LVL_097
		dw LVL_098
		dw LVL_099
		dw LVL_100
		dw LVL_101
		dw LVL_102
		dw LVL_103
		dw LVL_104
		dw LVL_105
		dw LVL_106
		dw LVL_107
		dw LVL_108
		dw LVL_109
		dw LVL_110
		dw LVL_111
		dw LVL_112
		dw LVL_113
		dw LVL_114
		dw LVL_115
		dw LVL_116
		dw LVL_117
		dw LVL_118
		dw LVL_119
		dw LVL_120
		dw LVL_121
		dw LVL_122
		dw LVL_123
		dw LVL_124
;
;	db 	y,x,blk

;STAGE 1 -----------------------------------------------------------------------------------------

LVL_000:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl   2,  0, blk_ship
		lvl   8,  0, blk_gate_green
		lvl   1, 24, blk_planet_big_red
		lvl   4, 16, blk_planet_medium_green
		lvl   5, 29, blk_small_purpleRed
		lvl  10, 29, blk_yellow_figure
		lvl  14, 20, blk_gunMachine1
		db 0FFh
;
LVL_001:	lvl  19,  0, blk_red_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  10,  7, blk_tower_dish
		lvl  12, 14, blk_tower_rocket
		lvl  12, 18, blk_tower_rocket
		lvl  12, 22, blk_tower_rocket
		lvl  16, 28, blk_box_yellow
		lvl   0,  0, blk_planet_medium_green
		lvl   3, 15, blk_planet_big_red
		lvl   2, 20, blk_small_purpleRed
		db 0FFh

LVL_002:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  11, 22, blk_ground_green_box1
		lvl  13, 22, blk_vbox_white
		lvl   5, 22, blk_teleportGate
		lvl  14, 14, blk_gunMachine1
		lvl  12,  4, blk_teleportGate
		lvl  18, 27, blk_anim_pump
		lvl   9, 28, blk_box_white
		lvl   1,  8, blk_planet_big_red
		lvl   2,  2, blk_small_purpleRed
		db 0FFh

LVL_003:	lvl  19,   0, blk_red_ground2
		lvl  18,   0, blk_H_yellow_bricks
		lvl  11, 231, blk_ground_green_box1
		lvl  13,   4, blk_vbox_white
		lvl  12,  24, blk_tower_rocket
		lvl  12,  28, blk_tower_rocket
		lvl  16,  19, blk_box_yellow
		db 0FFh

LVL_004:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl   1,  4, blk_small_purpleRed
		lvl   3, 22, blk_planet_big_red
		lvl   7, 27, blk_planet_medium_green
		lvl   2,  9, blk_ship
		lvl  10, 13, blk_tower_dish
		db 0FFh

LVL_005:	lvl  19, 242, blk_red_ground2
		lvl  18, 242, blk_H_yellow_bricks
		lvl  18,  18, blk_V_yellow_bricks
		lvl  20,  19, blk_ground_green_box1
		lvl  14,  23, blk_birthpod
		lvl   3,  11, blk_planet_big_cyan
		lvl   0,   1, blk_planet_SmallYellow
		lvl   2,  25, blk_planet_SmallRedPurple
		db 0FFh

LVL_006:	lvl  20, 247, blk_ground_green_box1
		lvl   8,   9, blk_ground_green_box1
		lvl  10,   9, blk_jump_platform_yellow
		lvl  10,  19, blk_jump_platform_yellow
		lvl   2,   9, blk_teleportGate
		lvl   6,  24, blk_box_white
		lvl   6,  27, blk_box_yellow
		lvl  18,  23, blk_V_yellow_bricks
		lvl  18,  24, blk_H_yellow_bricks
		lvl  19,  24, blk_red_ground2
		lvl  17,  18, blk_double_barrel
		lvl  12,  25, blk_teleportGate
		lvl   2,  17, blk_tower_rocket
		db 0FFh

LVL_007:	lvl  19,   0, blk_red_ground1
		lvl  18, 230, blk_H_yellow_bricks
		lvl  18,   6, blk_V_yellow_bricks
		lvl   8, 231, blk_ground_green_box1
		lvl   8,  24, blk_ground_green_box1
		lvl   8,  14, blk_jump_platform_yellow
		lvl  10,   4, blk_jump_platform_yellow
		lvl  10,  24, blk_jump_platform_yellow
		lvl   4,  12, blk_gunMachine1
		lvl  15,  26, blk_gunMachine1
		lvl  19,  10, blk_mine
		lvl  19,  15, blk_mine
		lvl  19,  20, blk_mine
		db 0FFh

LVL_008:	lvl  19, 243, blk_red_ground1
		lvl  20,  19, blk_ground_green_box1
		lvl   8, 232, blk_ground_green_box1
		lvl   2,   4, blk_teleportGate
		lvl  13,   8, blk_teleportGate
		lvl  10,   5, blk_jump_platform_yellow
		lvl  15,  21, blk_beacon_base
		lvl  11,  20, blk_control_beacon
		lvl  14,  26, blk_birthpod
		lvl   0,  17, blk_planet_big_red
		lvl   4,  25, blk_small_purpleRed
		db 0FFh

LVL_009:	lvl  20, 241, blk_ground_green_box1
		lvl  18,  18, blk_H_yellow_bricks
		lvl  18,  17, blk_V_yellow_bricks
		lvl  19,  18, blk_red_ground2
		lvl  11,  23, blk_changing_room
		lvl  16,  18, blk_box_white
		lvl  16,  29, blk_box_yellow
		lvl  14,   8, blk_tower_rocket
		lvl  20,   4, blk_anim_pump
		lvl  20,  12, blk_anim_pump
		lvl   1,   7, blk_planet_SmallRedPurple
		lvl   3,  16, blk_planet_medium_green
		lvl   0,  22, blk_planet_big_red
		db 0FFh

LVL_010:	lvl   8,  0, blk_red_ground2
		lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  11,  1, blk_vbox_green_column
		lvl  11, 29, blk_vbox_green_column
		lvl  15, 23, blk_double_barrel
		lvl  12,  6, blk_teleportGate
		lvl   2,  0, blk_teleportGate
		lvl   2, 10, blk_tower_rocket
		lvl   2, 14, blk_tower_rocket
		lvl   2, 18, blk_tower_rocket
		db 0FFh

LVL_011:	lvl  20,  11, blk_ground_green_box1
		lvl  19, 234, blk_red_ground2
		lvl  19,  24, blk_red_ground2
		lvl  18,  25, blk_H_yellow_bricks
		lvl  18, 234, blk_H_yellow_bricks
		lvl  18,  10, blk_V_yellow_bricks
		lvl  18,  24, blk_V_yellow_bricks
		lvl  10,  23, blk_tower_dish
		lvl  18,  20, blk_box_white
		lvl  16,  28, blk_box_yellow
		lvl  11,   5, blk_vbox_green_column
		lvl   8, 231, blk_red_ground2
		lvl   0,  12, blk_small_purpleRed
		lvl   2,  18, blk_planet_medium_green
		lvl  15,  16, blk_beacon_base
		lvl  11,  15, blk_control_beacon
		db 0FFh

LVL_012:	lvl   8,   0, blk_gate_green
		lvl  19, 234, blk_red_ground1
		lvl  18, 234, blk_H_yellow_bricks
		lvl  18,  10, blk_V_yellow_bricks
		lvl  20,  11, blk_ground_white_box
		lvl  14,  14, blk_teleportGate
		lvl   6,  20, blk_teleportGate
		lvl  12,  20, blk_red_ground2
		lvl  14,  20, blk_H_yellow_bricks
		lvl  16,  26, blk_gunMachine1
		lvl  15,  20, blk_vbox_purple
		lvl  10,  30, blk_box_yellow
		lvl  16,   5, blk_box_white
		db 0FFh

LVL_013:	lvl  20,  0, blk_ground_white_box
		lvl  12,  0, blk_red_ground2
		lvl  14,  0, blk_H_yellow_bricks
		lvl  15, 14, blk_vbox_purple
		lvl   6, 18, blk_birthpod
		lvl  17, 27, blk_double_barrel
		lvl  20,  6, blk_anim_pump
		lvl   0,  3, blk_planet_SmallRedPurple
		db 0FFh

LVL_014:	lvl  20, 238, blk_ground_white_box
		lvl  20,  14, blk_ground_white_box
		lvl  12,   0, blk_red_ground1
		lvl  14,   0, blk_H_yellow_bricks
		lvl  15,   4, blk_vbox_purple
		lvl   0,   3, blk_planet_SmallRedPurple
		lvl  15,  26, blk_vbox_purple
		lvl   6,   5, blk_teleportGate
		lvl   9,  18, blk_double_barrel
		lvl   6,  23, blk_teleportGate
		lvl  20,   8, blk_anim_pump
		lvl  20,  15, blk_anim_pump
		lvl  20,  22, blk_anim_pump
		db 0FFh

LVL_015:	lvl  12, 231, blk_red_ground1
		lvl  14, 231, blk_H_yellow_bricks
		lvl  15,   4, blk_vbox_purple
		lvl  20,   0, blk_ground_white_box
		lvl  11,  24, blk_control_beacon
		lvl  15,  25, blk_beacon_base
		lvl   0,   4, blk_planet_big_red
		lvl   2,  25, blk_planet_medium_green
		db 0FFh

LVL_016:	lvl  11,  29, blk_yellow_figure
		lvl  19,   9, blk_red_ground2
		lvl  20, 233, blk_ground_white_box
		lvl  19,  11, blk_mine
		lvl  19,  19, blk_mine
		lvl  15,  13, blk_gunMachine1
		lvl   2,  20, blk_planet_big_red
		lvl   5,   5, blk_planet_medium_green
		db 0FFh

LVL_017:	lvl  19,   0, blk_red_ground2
		lvl  13,   6, blk_teleportGate
		lvl   9,   0, blk_jump_platform_yellow
		lvl   9,  13, blk_jump_platform_yellow
		lvl   8, 240, blk_H_yellow_bricks
		lvl   2,   0, blk_teleportGate
		lvl   6,  10, blk_box_white
		lvl   6,  14, blk_box_yellow
		lvl  19,  18, blk_anim_pump
		db 0FFh

LVL_018:	lvl  19,  0, blk_red_ground2
		lvl  18, 15, blk_V_yellow_bricks
		lvl  18, 16, blk_H_yellow_bricks
		lvl  12, 21, blk_birthpod
		lvl  11, 16, blk_vbox_green_column
		lvl  13,  4, blk_teleportGate
		lvl   3, 16, blk_teleportGate
		lvl   4, 22, blk_vbox_white
		lvl   2, 22, blk_ground_green_box1
		lvl   9, 16, blk_ground_green_box1
		lvl  19, 11, blk_mine
		lvl  12, 28, blk_tower_rocket
		lvl   7, 27, blk_box_white
		db 0FFh

LVL_019:	lvl   2,   0, blk_ground_white_box
		lvl   9, 239, blk_ground_white_box
		lvl   9,  15, blk_ground_white_box
		lvl   4,   4, blk_vbox_purple
		lvl   4,  25, blk_vbox_purple
		lvl  19,   0, blk_red_ground1
		lvl  18,   0, blk_H_yellow_bricks
		lvl  11,  15, blk_vbox_green_column
		lvl  14,  19, blk_gunMachine1
		db 0FFh

LVL_020:	lvl  19,  0, blk_red_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl   2,  0, blk_ground_white_box
		lvl   9,  0, blk_ground_white_box
		lvl   4, 14, blk_vbox_purple
		lvl   6, 27, blk_double_barrel
		lvl  11,  1, blk_vbox_green_column
		lvl  11, 29, blk_vbox_green_column
		lvl  14, 24, blk_anim_swarm
		lvl  14, 15, blk_anim_swarm
		lvl  18,  8, blk_anim_pump
		lvl  18, 21, blk_anim_pump
		db 0FFh

LVL_021:	lvl  19,   0, blk_red_ground1
		lvl  18,   0, blk_H_yellow_bricks
		lvl  12,  24, blk_tower_rocket
		lvl  12,  28, blk_tower_rocket
		lvl  16,   4, blk_box_white
		lvl  16,  16, blk_box_yellow
		lvl  11,  10, blk_vbox_green_column
		lvl   9, 236, blk_ground_white_box
		lvl   4,   6, blk_vbox_purple
		lvl   2, 233, blk_ground_white_box
		lvl   0,  24, blk_planet_big_cyan
		lvl   5,  15, blk_anim_swarm
		db 0FFh

LVL_022:	lvl  19,   0, blk_red_ground2
		lvl  18, 244, blk_H_yellow_bricks
		lvl  17,  25, blk_ground_red_hill
		lvl  13,   8, blk_waggon
		lvl  13,  14, blk_waggon
		lvl   3,  14, blk_planet_big_cyan
		lvl   0,  24, blk_planet_big_red
		lvl   2,   2, blk_planet_medium_green
		db 0FFh

LVL_023:	lvl  19,  0, blk_red_ground1
		lvl  15, 26, blk_gunMachine_TOP
		lvl  17, 25, blk_gunMachine_BOTTOM
		lvl  19,  5, blk_anim_pump
		lvl   9, 13, blk_jump_platform_yellow
		lvl   9, 29, blk_jump_platform_yellow
		lvl   7, 13, blk_ground_white_box
		lvl   2, 14, blk_waggon
		lvl   1, 20, blk_tower_rocket
		lvl   0,  5, blk_planet_big_red
		db 0FFh

LVL_024:	lvl  19,  0, blk_red_ground2
		lvl   4, 12, blk_stage_end
		lvl   0,  3, blk_planet_SmallRedPurple
		lvl   1, 21, blk_planet_big_red
		lvl  11, 29, blk_yellow_figure
		lvl  16,  9, blk_blinker
		lvl  16, 22, blk_blinker
		db 0FFh

;STAGE 2 -----------------------------------------------------------------------------------------

LVL_025:	lvl  19,  0, blk_red_ground1
		lvl   0,  0, blk_red_ground2
		lvl  11, 29, blk_yellow_figure
		lvl   3,  2, blk_RUDiagonal
		lvl   3,  9, blk_LUDiagonal
		lvl   3, 19, blk_RUDiagonal
		lvl   3, 26, blk_LUDiagonal
		lvl   3,  5, blk_4YellowBarrel
		lvl   3, 22, blk_4YellowBarrel
		lvl  15, 11, blk_mushroom
		lvl  15, 16, blk_mushroom
		lvl   3, 11, blk_topdown_electro
		db 0FFh

LVL_026:	lvl  19,   0, blk_red_ground2
		lvl   0, 235, blk_red_ground1
		lvl   3,   2, blk_RUDiagonal
		lvl   3,   9, blk_LUDiagonal
		lvl   3,   5, blk_4YellowBarrel
		lvl  14,  11, blk_waggon
		lvl  14,  17, blk_waggon
		lvl  19,  26, blk_mine
		db 0FFh

LVL_027:	lvl  19, 232, blk_red_ground1
		lvl  17,   9, blk_jump_platform_yellow
		lvl  16,  14, blk_jump_platform_yellow
		lvl  15,  19, blk_jump_platform_yellow
		lvl  14,  24, blk_jump_platform_yellow
		lvl  13,  29, blk_jump_platform_yellow
		lvl  13,  19, blk_box_white
		lvl  11,  29, blk_box_yellow
		lvl   2,  26, blk_small_purpleRed
		lvl   0,  12, blk_planet_big_red
		lvl   3,   4, blk_planet_big_cyan
		db 0FFh

LVL_028:	lvl  20,  0, blk_ground_green_box1
		lvl  13,  2, blk_jump_platform_yellow
		lvl  13, 12, blk_jump_platform_yellow
		lvl  17, 16, blk_double_barrel
		lvl  14, 27, blk_birthpod
		lvl   2,  9, blk_ship
		db 0FFh

LVL_029:	lvl  20, 236, blk_ground_green_box1
		lvl  19,  12, blk_red_ground2
		lvl  18,  12, blk_ground_green_box1
		lvl  14,  20, blk_gunMachine1
		lvl  12,  27, blk_teleportGate
		lvl   8,   6, blk_jump_platform_yellow
		lvl   8,  15, blk_jump_platform_yellow
		lvl   8,  24, blk_jump_platform_yellow
		lvl   6,   0, blk_ground_white_box
		lvl   2,   6, blk_vbox_yellow_barrel
		lvl   2,  15, blk_vbox_yellow_barrel
		lvl   2,  24, blk_vbox_yellow_barrel
		lvl   0,   1, blk_teleportGate
		lvl   0,   6, blk_ground_white_box
		lvl  16,  13, blk_box_white
		db 0FFh

LVL_030:	lvl  19,   0, blk_red_ground2
		lvl  18,   0, blk_ground_green_box1
		lvl  18,  15, blk_anim_pump
		lvl   8,   6, blk_jump_platform_yellow
		lvl  10,  10, blk_jump_platform_yellow
		lvl  10,  21, blk_jump_platform_yellow
		lvl   6,  19, blk_gunMachine1
		lvl   6, 233, blk_ground_white_box
		lvl   2,   6, blk_vbox_yellow_barrel
		lvl   0, 233, blk_ground_white_box
		lvl  14,   9, blk_anim_swarm
		lvl  14,   9, blk_anim_swarm
		db 0FFh

LVL_031:	lvl  19,   0, blk_red_ground1
		lvl  18, 239, blk_ground_green_box1
		lvl  19,  15, blk_anim_pump
		lvl  19,  22, blk_anim_pump
		lvl  19,  29, blk_anim_pump
		lvl  17,  19, blk_box_white
		lvl  17,  26, blk_box_yellow
		lvl  10,   5, blk_tower_dish
		lvl  10,  10, blk_tower_dish
		lvl   2,   8, blk_planet_medium_green
		lvl   4,  21, blk_planet_big_red
		db 0FFh

LVL_032:	lvl  19,  0, blk_red_ground2
		lvl  19,  5, blk_mine
		lvl  15, 11, blk_gunMachine_TOP
		lvl  17, 10, blk_gunMachine_BOTTOM
		lvl  13, 18, blk_teleportGate
		lvl  11, 24, blk_vbox_yellow_barrel
		lvl  15, 24, blk_vbox_yellow_barrel
		lvl   9, 24, blk_ground_white_box
		lvl   3, 24, blk_teleportGate
		lvl  19, 29, blk_mine
		db 0FFh

LVL_033:	lvl  19,  0, blk_red_ground1
		lvl  11,  6, blk_vbox_yellow_barrel
		lvl  15,  6, blk_vbox_yellow_barrel
		lvl  11, 24, blk_vbox_yellow_barrel
		lvl  15, 24, blk_vbox_yellow_barrel
		lvl   9,  0, blk_ground_white_box
		lvl  17, 21, blk_box_white
		lvl   7,  3, blk_box_yellow
		lvl  13, 28, blk_teleportGate
		lvl   3,  6, blk_teleportGate
		lvl   6, 27, blk_double_barrel
		db 0FFh

LVL_034:	lvl  19,   0, blk_red_ground2
		lvl  11,   6, blk_vbox_yellow_barrel
		lvl  15,   6, blk_vbox_yellow_barrel
		lvl  11,  24, blk_vbox_yellow_barrel
		lvl  15,  24, blk_vbox_yellow_barrel
		lvl   9, 251, blk_ground_white_box
		lvl   9,  27, blk_ground_white_box
		lvl   7,  21, blk_box_white
		lvl   7,  25, blk_box_yellow
		lvl   2,  14, blk_changing_room
		lvl  19,  10, blk_mine
		lvl  19,  15, blk_mine
		lvl  19,  20, blk_mine
		lvl  15,  20, blk_anim_swarm
		lvl  15,  19, blk_anim_swarm
		db 0FFh

LVL_035:	lvl  19,   0, blk_red_ground1
		lvl   9, 233, blk_ground_white_box
		lvl  11,   6, blk_vbox_yellow_barrel
		lvl  15,   6, blk_vbox_yellow_barrel
		lvl   0,  18, blk_beam_up
		lvl  19,  19, blk_beam_down
		lvl  19,  13, blk_mine
		db 0FFh

LVL_036:	lvl  19,  0, blk_red_ground2
		lvl  18,  5, blk_V_yellow_bricks
		lvl  18,  6, blk_H_yellow_bricks
		lvl  16,  9, blk_box_white
		lvl   2,  5, blk_planet_medium_green
		lvl   0, 16, blk_planet_big_red
		db 0FFh

LVL_037:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  13,  6, blk_waggon
		lvl  13, 12, blk_waggon
		lvl  12, 18, blk_teleportGate
		lvl  11, 25, blk_vbox_green_column
		lvl   8, 18, blk_red_ground2
		lvl  10, 18, blk_H_yellow_bricks
		lvl   2, 18, blk_teleportGate
		db 0FFh

LVL_038:	lvl  19,  0, blk_red_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12,  4, blk_teleportGate
		lvl  12, 12, blk_anim_swarm
		lvl  16, 12, blk_anim_swarm
		lvl  11, 15, blk_vbox_green_column
		lvl   8,  0, blk_red_ground1
		lvl  10,  0, blk_H_yellow_bricks
		lvl   2,  4, blk_teleportGate
		lvl   5, 27, blk_double_barrel
		db 0FFh

LVL_039:	lvl  19, 236, blk_red_ground1
		lvl  18, 236, blk_H_yellow_bricks
		lvl  18,  12, blk_V_yellow_bricks
		lvl  20,  13, blk_ground_green_box1
		lvl  11,   6, blk_vbox_green_column
		lvl   8, 232, blk_red_ground1
		lvl  10, 232, blk_H_yellow_bricks
		lvl   4,   3, blk_gunMachine1
		lvl   0,  21, blk_beam_up
		lvl  18,  22, blk_beam_down
		lvl  20,  29, blk_anim_pump
		db 0FFh

LVL_040:	lvl  20,  0, blk_ground_green_box1
		lvl  18,  6, blk_box_white
		lvl  14,  9, blk_birthpod
		lvl  14, 14, blk_birthpod
		lvl  14, 20, blk_tower_rocket
		lvl  14, 24, blk_tower_rocket
		lvl  18, 28, blk_box_yellow
		lvl   4,  8, blk_planet_big_red
		lvl   2, 24, blk_small_purpleRed
		db 0FFh

LVL_041:	lvl  20, 236, blk_ground_green_box1
		lvl  19,  12, blk_red_ground1
		lvl  18,  12, blk_ground_green_box1
		lvl  18,   7, blk_beam_down
		lvl  11,  13, blk_vbox_green_column
		lvl  12,  20, blk_birthpod
		lvl  12,  27, blk_teleportGate
		lvl   8,  13, blk_red_ground2
		lvl   2,  13, blk_teleportGate
		lvl   4,  20, blk_gunMachine1
		lvl   6,  27, blk_box_white
		lvl   6,  30, blk_box_yellow
		lvl   0,   6, blk_beam_up
		db 0FFh

LVL_042:	lvl  19,   0, blk_red_ground2
		lvl  18, 233, blk_ground_green_box1
		lvl  18,   9, blk_V_yellow_bricks
		lvl  11,   7, blk_vbox_green_column
		lvl   8,   0, blk_red_ground1
		lvl   8,  19, blk_mine
		lvl  19,  14, blk_anim_pump
		lvl  19,  24, blk_anim_pump
		db 0FFh

LVL_043:	lvl  19,   0, blk_red_ground1
		lvl   8, 230, blk_red_ground1
		lvl  10,  17, blk_control_beacon
		lvl  14,  18, blk_beacon_base
		lvl  11,   3, blk_jump_platform_yellow
		lvl   0,  25, blk_planet_medium_green
		lvl  17,   8, blk_box_white
		lvl  19,  13, blk_mine
		lvl  19,  23, blk_mine
		lvl  15,  26, blk_mushroom
		db 0FFh

LVL_044:	lvl  19,  0, blk_red_ground2
		lvl  13,  6, blk_tower_rocket
		lvl  13, 22, blk_tower_rocket
		lvl  17, 14, blk_box_yellow
		lvl   9, 10, blk_gate_green
		db 0FFh

LVL_045:	lvl  19, 233, blk_red_ground2
		lvl  20,   9, blk_ground_white_box
		lvl  14,  19, blk_teleportGate
		lvl  12,  12, blk_vbox_yellow_barrel
		lvl  16,  12, blk_vbox_yellow_barrel
		lvl  12,  27, blk_vbox_yellow_barrel
		lvl  16,  27, blk_vbox_yellow_barrel
		lvl  10,  12, blk_ground_white_box
		lvl   4,  12, blk_teleportGate
		lvl   6,  25, blk_gunMachine_TOP
		lvl   8,  24, blk_gunMachine_BOTTOM
		lvl   0,   0, blk_planet_big_red
		db 0FFh

LVL_046:	lvl  20,  0, blk_ground_white_box
		lvl  10,  0, blk_ground_white_box
		lvl  12,  3, blk_vbox_yellow_barrel
		lvl  16,  3, blk_vbox_yellow_barrel
		lvl  12, 26, blk_vbox_yellow_barrel
		lvl  16, 26, blk_vbox_yellow_barrel
		lvl  16, 20, blk_gunMachine_TOP
		lvl  18, 19, blk_gunMachine_BOTTOM
		lvl   6, 20, blk_gunMachine_TOP
		lvl   8, 19, blk_gunMachine_BOTTOM
		lvl   8,  6, blk_box_white
		lvl   8,  9, blk_box_yellow
		lvl  18, 10, blk_anim_swarm
		lvl  16, 15, blk_anim_swarm
		db 0FFh

LVL_047:	lvl  20,   0, blk_ground_white_box
		lvl  12,   6, blk_vbox_yellow_barrel
		lvl  16,   6, blk_vbox_yellow_barrel
		lvl  10, 233, blk_ground_white_box
		lvl   4,   5, blk_birthpod
		lvl   9,  14, blk_jump_platform_yellow
		lvl   7,  18, blk_jump_platform_yellow
		lvl   7,  28, blk_jump_platform_yellow
		lvl   3,  16, blk_gunMachine1
		lvl  20,  11, blk_anim_pump
		lvl  20,  18, blk_anim_pump
		lvl  20,  25, blk_anim_pump
		db 0FFh

LVL_048:	lvl  20, 233, blk_ground_white_box
		lvl  19,   9, blk_red_ground1
		lvl  15,   5, blk_waggon
		lvl  13,  15, blk_teleportGate
		lvl  16,  28, blk_double_barrel
		lvl  11,  21, blk_vbox_yellow_barrel
		lvl  15,  21, blk_vbox_yellow_barrel
		lvl   9,  21, blk_ground_green_box1
		lvl   8,  21, blk_H_yellow_bricks
		lvl   2,  21, blk_teleportGate
		lvl   7,   0, blk_jump_platform_yellow
		lvl  10,   4, blk_jump_platform_yellow
		db 0FFh

LVL_049:	lvl  19,   0, blk_red_ground1
		lvl  18,  11, blk_V_yellow_bricks
		lvl  18,  12, blk_H_yellow_bricks
		lvl  11,   6, blk_vbox_yellow_barrel
		lvl  15,   6, blk_vbox_yellow_barrel
		lvl  15,  13, blk_blinker
		lvl  15,  28, blk_blinker
		lvl   9, 233, blk_ground_green_box1
		lvl   8, 233, blk_H_yellow_bricks
		lvl   3,  17, blk_stage_end
		db 0FFh

;STAGE 3 -----------------------------------------------------------------------------------------

LVL_050:	lvl  19,  0, blk_red_ground2
		lvl  19,  3, blk_mine
		lvl  19,  6, blk_mine
		lvl  19,  9, blk_mine
		lvl  19, 12, blk_mine
		lvl  19, 15, blk_mine
		lvl  19, 18, blk_mine
		lvl   8,  0, blk_jump_platform_yellow
		lvl   8, 10, blk_jump_platform_yellow
		lvl  14, 20, blk_jump_platform_yellow
		lvl  14, 24, blk_beacon_base
		lvl  10, 23, blk_control_beacon
		lvl   0, 27, blk_beam_up
		lvl  19, 28, blk_beam_down
		db 0FFh

LVL_051:	lvl  19,  0, blk_red_ground1
		lvl   0,  7, blk_planet_SmallRedPurple
		lvl   2, 27, blk_planet_medium_green
		lvl  14, 15, blk_beacon_base
		lvl  10, 14, blk_control_beacon
		lvl   9,  0, blk_gate_green
		lvl   9, 21, blk_gate_green
		db 0FFh

LVL_052:	lvl  19, 234, blk_red_ground1
		lvl  20,  10, blk_ground_yellow_box
		lvl  13,  11, blk_ground_yellow_box
		lvl  13,   6, blk_teleportGate
		lvl   7,  11, blk_teleportGate
		lvl  15,  11, blk_vbox_blue_transparent
		lvl  15,  28, blk_vbox_blue_transparent
		lvl  17,  24, blk_double_barrel
		lvl   9,  29, blk_anim_swarm
		lvl   9,  28, blk_anim_swarm
		db 0FFh

LVL_053: 	lvl  20,   0, blk_ground_yellow_box
		lvl  13, 242, blk_ground_yellow_box
		lvl  13,  23, blk_ground_yellow_box
		lvl  15,   6, blk_vbox_blue_transparent
		lvl   8,   6, blk_vbox_blue_transparent
		lvl   8,  23, blk_vbox_blue_transparent
		lvl  15,  23, blk_vbox_blue_transparent
		lvl   5,   6, blk_red_ground2
		lvl  18,  14, blk_box_white
		lvl  18,  27, blk_box_yellow
		lvl   9,  13, blk_gunMachine_TOP
		lvl  11,  12, blk_gunMachine_BOTTOM
		lvl   1,  10, blk_mushroom
		lvl   1,  16, blk_mushroom
		db 0FFh

LVL_054:	lvl  20,   0, blk_ground_yellow_box
		lvl  13, 239, blk_ground_yellow_box
		lvl  15,   6, blk_vbox_blue_transparent
		lvl   8,   6, blk_vbox_blue_transparent
		lvl   8,  10, blk_waggon
		lvl   5, 233, blk_red_ground2
		lvl  18,  24, blk_box_white
		db 0FFh

LVL_055:	lvl  20, 230, blk_ground_yellow_box
		lvl  18,  6, blk_V_yellow_bricks
		lvl  18,  7, blk_H_yellow_bricks
		lvl  19,  7, blk_red_ground1
		lvl  12,  7, blk_tower_rocket
		lvl  12, 11, blk_tower_rocket
		lvl  16, 15, blk_box_yellow
		lvl  12, 18, blk_tower_rocket
		lvl  12, 22, blk_tower_rocket
		lvl  18, 29, blk_anim_pump
		db 0FFh

LVL_056:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12, 14, blk_teleportGate
		lvl  13, 20, blk_vbox_blue_transparent
		lvl  11, 20, blk_ground_yellow_box
		lvl   0, 14, blk_ground_yellow_box
		lvl   2, 14, blk_jump_platform_yellow
		lvl   2, 29, blk_jump_platform_yellow
		lvl  16, 26, blk_box_white
		lvl   5, 20, blk_teleportGate
		db 0FFh

LVL_057:	lvl  19,  0, blk_red_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  13,  9, blk_vbox_blue_transparent
		lvl  13, 20, blk_vbox_blue_transparent
		lvl  14, 26, blk_gunMachine_TOP
		lvl  16, 25, blk_gunMachine_BOTTOM
		lvl  11, 236, blk_ground_yellow_box
		lvl  11, 20, blk_ground_yellow_box
		lvl   9, 23, blk_box_yellow
		lvl   9, 26, blk_box_white
		lvl   2,  3, blk_jump_platform_yellow
		lvl   2, 27, blk_jump_platform_yellow
		lvl   0,  0, blk_ground_yellow_box
		db 0FFh

LVL_058:	lvl  19,   0, blk_red_ground1
		lvl  18,   0, blk_H_yellow_bricks
		lvl  11, 230, blk_ground_yellow_box
		db 0FFh

LVL_059:	lvl  20, 245, blk_ground_yellow_box
		lvl  19, 232, blk_red_ground1
		lvl  18, 232, blk_H_yellow_bricks
		lvl  18,   8, blk_V_yellow_bricks
		lvl  21,  21, blk_H_yellow_bricks
		lvl  12,   5, blk_teleportGate
		lvl   9,   0, blk_jump_platform_yellow
		lvl   9,   3, blk_jump_platform_yellow
		lvl   3,   0, blk_teleportGate
		lvl  15,  12, blk_vbox_blue_transparent
		lvl  15,  15, blk_vbox_blue_transparent
		lvl  11,  12, blk_vbox_yellow_barrel
		lvl  11,  15, blk_vbox_yellow_barrel
		lvl   6,  14, blk_beacon_base
		lvl   2,  13, blk_control_beacon
		lvl   0,  24, blk_planet_big_red
		lvl   7,   4, blk_box_white
		db 0FFh

LVL_060:	lvl  21, 236, blk_H_yellow_bricks
		lvl  20, 12, blk_ground_yellow_box
		lvl  18, 24, blk_V_yellow_bricks
		lvl  18, 25, blk_H_yellow_bricks
		lvl  19, 25, blk_red_ground2
		lvl  13,  6, blk_tower_dish
		lvl  18, 13, blk_box_yellow
		lvl  17, 18, blk_blinker
		lvl  16, 24, blk_box_white
		lvl  11, 27, blk_changing_room
		lvl   0,  2, blk_planet_SmallRedPurple
		lvl   3, 18, blk_planet_big_cyan
		db 0FFh

LVL_061:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  11,  7, blk_vbox_green_column
		lvl  11, 21, blk_vbox_green_column
		lvl  12, 11, blk_teleportGate
		lvl  16, 24, blk_gunMachine_BOTTOM
		lvl  14, 25, blk_gunMachine_TOP
		lvl   9,  7, blk_ground_yellow_box
		lvl   3,  7, blk_teleportGate
		lvl   6, 15, blk_blinker
		lvl   6, 21, blk_blinker
		lvl   6, 27, blk_blinker
		db 0FFh

LVL_062:	lvl  19,   0, blk_red_ground2
		lvl  18,   0, blk_H_yellow_bricks
		lvl  11,   7, blk_vbox_green_column
		lvl   9, 234, blk_ground_yellow_box
		lvl  10,  22, blk_red_ground1
		lvl  13,  22, blk_vbox_blue_transparent
		lvl  13,  25, blk_vbox_blue_transparent
		lvl   0,  14, blk_beam_up
		lvl  16,  15, blk_beam_down
		db 0FFh

LVL_063:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  13,  6, blk_vbox_blue_transparent
		lvl  13, 23, blk_vbox_blue_transparent
		lvl  10,  0, blk_red_ground2
		db 0FFh

LVL_064:	lvl  19,   0, blk_red_ground2
		lvl  18,   0, blk_H_yellow_bricks
		lvl  13,   6, blk_vbox_white
		lvl  13,  23, blk_vbox_white
		lvl  10, 233, blk_red_ground2
		lvl  10,  23, blk_red_ground1
		lvl  18,  10, blk_anim_pump
		lvl  18,  19, blk_anim_pump
		lvl   0,   5, blk_planet_medium_green
		db 0FFh

LVL_065:	lvl  19, 241, blk_red_ground1
		lvl  18, 233, blk_H_yellow_bricks
		lvl  18,   8, blk_V_yellow_bricks
		lvl  20,  17, blk_ground_green_box2
		lvl  13,   6, blk_vbox_blue_transparent
		lvl  14,  11, blk_waggon
		lvl  14,  18, blk_birthpod
		lvl  14,  27, blk_birthpod
		lvl  10, 233, blk_red_ground1
		db 0FFh

LVL_066:	lvl  20,  0, blk_ground_green_box2
		lvl  12, 15, blk_vbox_yellow_barrel
		lvl  16, 15, blk_vbox_yellow_barrel
		lvl  14, 19, blk_teleportGate
		lvl  10, 15, blk_ground_green_box2
		lvl   2, 15, blk_vbox_yellow_barrel
		lvl   6, 15, blk_vbox_yellow_barrel
		lvl   4, 19, blk_teleportGate
		lvl   4, 27, blk_tower_rocket
		lvl   0,  6, blk_ground_green_box2
		lvl   2,  6, blk_topdown_electro
		lvl  16, 11, blk_anim_swarm
		lvl  16,  8, blk_anim_swarm
		db 0FFh

LVL_067:	lvl  20,  0, blk_ground_green_box2
		lvl  12,  6, blk_vbox_yellow_barrel
		lvl  16,  6, blk_vbox_yellow_barrel
		lvl  12, 23, blk_vbox_yellow_barrel
		lvl  16, 23, blk_vbox_yellow_barrel
		lvl  12, 14, blk_tower_dish
		lvl  10,  0, blk_ground_green_box2
		lvl   2,  6, blk_vbox_yellow_barrel
		lvl   6,  6, blk_vbox_yellow_barrel
		lvl   2, 23, blk_vbox_yellow_barrel
		lvl   6, 23, blk_vbox_yellow_barrel
		lvl   8, 10, blk_box_white
		lvl   7, 27, blk_double_barrel
		lvl   5, 14, blk_anim_swarm
		lvl  20, 10, blk_anim_pump
		lvl   0,  0, blk_ground_green_box2
		db 0FFh

LVL_068:	lvl  20, 239, blk_ground_green_box2
		lvl  18, 15, blk_V_yellow_bricks
		lvl  18, 16, blk_H_yellow_bricks
		lvl  19, 16, blk_red_ground1
		lvl  18, 11, blk_box_white
		lvl  16, 16, blk_box_yellow
		lvl  18, 19, blk_anim_pump
		lvl   0, 27, blk_beam_up
		lvl  16, 28, blk_beam_down
		lvl  12,  6, blk_vbox_yellow_barrel
		lvl  16,  6, blk_vbox_yellow_barrel
		lvl  10, 233, blk_ground_green_box2
		lvl   2,  6, blk_vbox_yellow_barrel
		lvl   6,  6, blk_vbox_yellow_barrel
		lvl   0, 233, blk_ground_green_box2
		db 0FFh

LVL_069:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_h_yellow_small_brick
		lvl  18,  4, blk_V_yellow_bricks
		lvl  18,  8, blk_V_yellow_bricks
		lvl  18,  9, blk_h_yellow_small_brick
		lvl  18, 13, blk_V_yellow_bricks
		lvl  18, 17, blk_V_yellow_bricks
		lvl  18, 18, blk_h_yellow_small_brick
		lvl  18, 22, blk_V_yellow_bricks
		lvl  18, 26, blk_V_yellow_bricks
		lvl  18, 27, blk_h_yellow_small_brick
		lvl  18, 31, blk_V_yellow_bricks
		lvl  14, 18, blk_mushroom
		lvl  12, 27, blk_birthpod
		lvl  19,  5, blk_anim_pump
		lvl  19, 14, blk_anim_pump
		lvl  19, 23, blk_anim_pump
		lvl   2, 20, blk_planet_SmallRedPurple
		lvl   0,  5, blk_planet_big_red
		db 0FFh

LVL_070:	lvl  19,  0, blk_red_ground2
		lvl  18,  0, blk_h_yellow_small_brick
		lvl  18,  4, blk_V_yellow_bricks
		lvl  18,  8, blk_V_yellow_bricks
		lvl  18,  9, blk_h_yellow_small_brick
		lvl  18, 13, blk_V_yellow_bricks
		lvl  18, 17, blk_V_yellow_bricks
		lvl  18, 18, blk_h_yellow_small_brick
		lvl  18, 22, blk_V_yellow_bricks
		lvl  18, 26, blk_V_yellow_bricks
		lvl  18, 27, blk_h_yellow_small_brick
		lvl  18, 31, blk_V_yellow_bricks
		lvl  12, 17, blk_teleportGate
		lvl  11, 28, blk_vbox_green_column
		lvl   9, 28, blk_ground_green_box2
		lvl   3, 28, blk_teleportGate
		lvl  19,  6, blk_mine
		lvl  19, 15, blk_mine
		lvl  19, 24, blk_mine
		lvl   9,  9, blk_control_beacon
		lvl  13, 10, blk_beacon_base
		db 0FFh

LVL_071:	lvl  19,  0, blk_red_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  11, 13, blk_vbox_green_column
		lvl  11, 22, blk_vbox_green_column
		lvl   9, 239, blk_ground_green_box2
		lvl   9, 22, blk_ground_green_box2
		lvl   1, 11, blk_tower_dish
		lvl   1, 21, blk_tower_dish
		lvl  14, 26, blk_gunMachine_TOP
		lvl  16, 25, blk_gunMachine_BOTTOM
		lvl  12, 18, blk_anim_swarm
		lvl  11, 18, blk_anim_swarm
		db 0FFh

LVL_072:	lvl  19, 233, blk_red_ground2
		lvl  18, 233, blk_H_yellow_bricks
		lvl  18,  8, blk_V_yellow_bricks
		lvl  20,  9, blk_ground_yellow_box
		lvl  11,  5, blk_vbox_green_column
		lvl   9, 231, blk_ground_green_box2
		lvl  16, 26, blk_gunMachine1
		lvl  20, 18, blk_anim_pump
		lvl   0, 18, blk_planet_big_cyan
		lvl   3, 30, blk_small_purpleRed
		db 0FFh

LVL_073:	lvl  20,  0, blk_ground_yellow_box
		lvl  18,  6, blk_V_yellow_bricks
		lvl  18,  7, blk_h_yellow_small_brick
		lvl  18, 11, blk_V_yellow_bricks
		lvl  18, 18, blk_V_yellow_bricks
		lvl  18, 19, blk_h_yellow_small_brick
		lvl  18, 23, blk_V_yellow_bricks
		lvl  19,  7, blk_red_ground1_1
		lvl  19, 19, blk_red_ground1_2
		lvl  14, 18, blk_gunMachine_TOP
		lvl  16, 17, blk_gunMachine_BOTTOM
		db 0FFh

LVL_074:	lvl  20,  0, blk_ground_green_box2
		lvl   5, 12, blk_stage_end
		lvl   0,  3, blk_planet_medium_green
		lvl   1, 21, blk_planet_big_cyan
		lvl  12, 29, blk_yellow_figure
		lvl  17,  9, blk_blinker
		lvl  17, 22, blk_blinker
		db 0FFh

;STAGE 4 -----------------------------------------------------------------------------------------

LVL_075:	lvl  19, 232, blk_green_ground1
		lvl  18, 232, blk_H_yellow_bricks
		lvl  18,  8, blk_V_yellow_bricks
		lvl  13,  2, blk_waggon
		lvl  17, 16, blk_blinker
		lvl  15, 20, blk_waggon
		lvl  12, 29, blk_yellow_figure
		lvl   2,  9, blk_ship
		lvl   0,  3, blk_planet_big_red
		lvl  20,  9, blk_ground_yellow_box
		db 0FFh

LVL_076:	lvl  20,  0, blk_ground_green_box2
		lvl  18, 12, blk_V_yellow_bricks
		lvl  18, 13, blk_h_yellow_small_brick
		lvl  18, 17, blk_V_yellow_bricks
		lvl  18, 26, blk_V_yellow_bricks
		lvl  18, 27, blk_h_yellow_small_brick
		lvl  18, 31, blk_V_yellow_bricks
		lvl  19, 13, blk_green_ground1_4
		lvl  19, 27, blk_green_ground1_3
		lvl  14, 27, blk_vbox_yellow_barrel
		lvl  10, 27, blk_vbox_yellow_barrel
		lvl   8, 27, blk_ground_green_box2
		lvl   0, 15, blk_planet_medium_green
		lvl   2,  6, blk_planet_SmallRedPurple
		lvl  16, 14, blk_box_white
		lvl  18, 22, blk_box_yellow
		db 0FFh

LVL_077:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12,  3, blk_teleportGate
		lvl  15, 21, blk_double_barrel
		lvl  10,  6, blk_jump_platform_yellow
		lvl  10, 24, blk_jump_platform_yellow
		lvl   8,  0, blk_ground_green_box2
		lvl   2,  0, blk_teleportGate
		db 0FFh

LVL_078:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_h_yellow_small_brick
		lvl  18,  4, blk_V_yellow_bricks
		lvl  18,  9, blk_V_yellow_bricks
		lvl  18, 10, blk_h_yellow_small_brick
		lvl  18, 14, blk_V_yellow_bricks
		lvl  18, 19, blk_V_yellow_bricks
		lvl  18, 20, blk_h_yellow_small_brick
		lvl  18, 24, blk_V_yellow_bricks
		lvl  18, 29, blk_V_yellow_bricks
		lvl  18, 30, blk_h_yellow_small_brick
		lvl  19,  6, blk_mine
		lvl  19, 16, blk_mine
		lvl  19, 26, blk_mine
		lvl  13, 10, blk_waggon
		lvl   8,  0, blk_ground_green_box2
		lvl   6, 10, blk_gunMachine_BOTTOM
		lvl   4, 11, blk_gunMachine_TOP
		lvl   3, 18, blk_waggon
		db 0FFh

LVL_079:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12,  8, blk_birthpod
		lvl  10, 14, blk_vbox_yellow_barrel
		lvl  14, 14, blk_vbox_yellow_barrel
		lvl   8, 241, blk_ground_green_box2
		lvl   5, 15, blk_blinker
		lvl  16,  2, blk_box_white
		lvl  16,  5, blk_box_yellow
		db 0FFh

LVL_080:	lvl  20,  11, blk_ground_yellow_box
		lvl  19, 234, blk_green_ground1
		lvl  19,  22, blk_green_ground2
		lvl  18,  10, blk_V_yellow_bricks
		lvl  18,  21, blk_V_yellow_bricks
		lvl  18,  22, blk_H_yellow_bricks
		lvl  18, 234, blk_H_yellow_bricks
		lvl  16,   3, blk_box_white
		lvl  11,  14, blk_control_beacon
		lvl  15,  15, blk_beacon_base
		db 0FFh

LVL_081:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12,  8, blk_teleportGate
		lvl   4, 18, blk_teleportGate
		lvl  18,  4, blk_anim_pump
		lvl  18, 13, blk_anim_pump
		lvl  13, 18, blk_vbox_blue_transparent
		lvl  10, 18, blk_red_ground1
		lvl  10, 28, blk_mine
		lvl  14, 24, blk_gunMachine_TOP
		lvl  16, 23, blk_gunMachine_BOTTOM
		db 0FFh

LVL_082:	lvl  19, 236, blk_green_ground1
		lvl  18, 236, blk_H_yellow_bricks
		lvl  18,  12, blk_V_yellow_bricks
		lvl  20,  13, blk_ground_green_box2
		lvl  14,  22, blk_birthpod
		lvl  11,  27, blk_control_beacon
		lvl  15,  28, blk_beacon_base
		lvl  13,   4, blk_vbox_blue_transparent
		lvl  13,   9, blk_vbox_blue_transparent
		lvl  10, 236, blk_red_ground2
		lvl   0,  21, blk_planet_big_red
		lvl   5,  26, blk_planet_medium_green
		lvl  18,  14, blk_box_white
		lvl  18,  17, blk_box_yellow
		db 0FFh

LVL_083:	lvl  19,  4, blk_green_ground2
		lvl  20, 228, blk_ground_green_box2
		lvl  16,  7, blk_blinker
		lvl  16, 24, blk_blinker
		lvl   0,  5, blk_planet_medium_green
		lvl   3, 17, blk_planet_big_red
		lvl   1, 29, blk_small_purpleRed
		db 0FFh

LVL_084:	lvl  19,  0, blk_green_ground1
		lvl  18, 16, blk_H_yellow_bricks
		lvl  18, 15, blk_V_yellow_bricks
		lvl  16, 12, blk_blinker
		lvl  17,  4, blk_box_white
		lvl  16, 28, blk_box_yellow
		lvl  12, 18, blk_tower_rocket
		lvl  12, 24, blk_tower_rocket
		lvl   0,  2, blk_planet_big_red
		db 0FFh

LVL_085:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl   0,  0, blk_planet_big_cyan
		lvl   4,  9, blk_planet_medium_green
		lvl   0, 25, blk_planet_medium_green
		db 0FFh

LVL_086:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  16,  4, blk_box_white
		lvl  12,  7, blk_teleportGate
		lvl  10, 12, blk_vbox_yellow_barrel
		lvl  14, 12, blk_vbox_yellow_barrel
		lvl   8, 12, blk_ground_green_box2
		lvl  11, 20, blk_ground_green_box2
		lvl  13, 20, blk_vbox_blue_transparent
		lvl   2, 12, blk_teleportGate
		db 0FFh

LVL_087:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  16,  4, blk_box_white
		lvl  11, 235, blk_ground_green_box2
		lvl  10, 14, blk_vbox_yellow_barrel
		lvl  14, 14, blk_vbox_yellow_barrel
		lvl   8,  0, blk_ground_green_box2
		lvl  13,  8, blk_vbox_blue_transparent
		lvl   5, 27, blk_double_barrel
		lvl  15, 26, blk_double_barrel
		db 0FFh

LVL_088:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl   8, 239, blk_ground_green_box2
		lvl   0, 22, blk_planet_big_red
		lvl  10, 12, blk_vbox_yellow_barrel
		lvl  14, 12, blk_vbox_yellow_barrel
		lvl  18, 18, blk_anim_pump
		lvl  13, 26, blk_beacon_base
		lvl   9, 25, blk_control_beacon
		db 0FFh

LVL_089:	lvl  19,  0, blk_green_ground2
		lvl  18, 237, blk_H_yellow_bricks
		lvl  16,  8, blk_box_white
		lvl  16, 11, blk_box_yellow
		lvl  18, 12, blk_V_yellow_bricks
		lvl  19, 18, blk_mine
		lvl  19, 22, blk_mine
		lvl  19, 29, blk_mine
		lvl   4, 17, blk_ship
		lvl   2,  3, blk_planet_medium_green
		lvl   0,  9, blk_small_purpleRed
		db 0FFh

LVL_090:	lvl  19, 230, blk_green_ground2
		lvl  20,  6, blk_ground_green_box2
		lvl  17,  4, blk_box_white
		lvl  18,  7, blk_box_yellow
		lvl  13, 12, blk_changing_room
		lvl  12, 19, blk_vbox_yellow_barrel
		lvl  16, 19, blk_vbox_yellow_barrel
		lvl  20, 23, blk_anim_pump
		lvl  20, 27, blk_anim_pump
		lvl  10, 19, blk_ground_green_box1
		lvl   5, 19, blk_vbox_white
		lvl   6, 23, blk_mushroom
		lvl   6, 28, blk_mushroom
		lvl   3, 19, blk_ground_green_box1
		lvl   1,  4, blk_planet_SmallRedPurple
		db 0FFh

LVL_091:	lvl  20,  0, blk_ground_green_box2
		lvl  14,  6, blk_teleportGate
		lvl  12, 15, blk_vbox_yellow_barrel
		lvl  16, 15, blk_vbox_yellow_barrel
		lvl  15, 19, blk_waggon
		lvl  15, 24, blk_waggon
		lvl  10,  0, blk_ground_green_box1
		lvl   3, 230, blk_ground_green_box1
		lvl   5,  3, blk_vbox_white
		lvl   4,  7, blk_teleportGate
		db 0FFh

LVL_092:	lvl  20,  0, blk_ground_green_box2
		lvl  10, 236, blk_ground_green_box1
		lvl  12,  9, blk_vbox_yellow_barrel
		lvl  16,  9, blk_vbox_yellow_barrel
		lvl  11, 19, blk_control_beacon
		lvl  15, 20, blk_beacon_base
		lvl   0, 25, blk_beam_up
		lvl  18, 26, blk_beam_down
		db 0FFh

LVL_093:	lvl  20, 233, blk_ground_green_box2
		lvl  19,  9, blk_green_ground2
		lvl  19, 11, blk_mine
		lvl  19, 16, blk_mine
		lvl  17, 13, blk_box_white
		lvl  18, 19, blk_V_yellow_bricks
		lvl  18, 20, blk_H_yellow_bricks
		lvl  16, 22, blk_box_yellow
		lvl  14, 25, blk_gunMachine1
		lvl   5, 26, blk_planet_medium_green
		lvl   0,  9, blk_planet_big_red
		lvl   2,  0, blk_small_purpleRed
		db 0FFh

LVL_094:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  13,  6, blk_waggon
		lvl  13, 11, blk_waggon
		lvl  13, 16, blk_waggon
		lvl  12, 21, blk_birthpod
		lvl  12, 26, blk_birthpod
		lvl   0, 12, blk_planet_medium_green
		lvl   5, 24, blk_planet_SmallRedPurple
		db 0FFh

LVL_095:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12, 12, blk_teleportGate
		lvl  15, 27, blk_double_barrel
		lvl  10, 17, blk_jump_platform_yellow
		lvl  10, 28, blk_jump_platform_yellow
		lvl   7, 17, blk_green_ground2
		lvl   1, 17, blk_teleportGate
		lvl   5, 23, blk_box_white
		lvl  16, 23, blk_box_yellow
		db 0FFh

LVL_096:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl   7,  0, blk_green_ground1
		lvl  10,  0, blk_jump_platform_yellow
		lvl  10, 29, blk_jump_platform_yellow
		lvl  18, 14, blk_anim_pump
		lvl   7,  6, blk_mine
		lvl   7, 10, blk_mine
		lvl   7, 15, blk_mine
		lvl   7, 21, blk_mine
		lvl   7, 28, blk_mine
		lvl  12, 24, blk_birthpod
		db 0FFh

LVL_097:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl   7,  0, blk_green_ground2
		lvl  16,  7, blk_box_white
		lvl   5, 12, blk_box_yellow
		lvl  10,  9, blk_jump_platform_yellow
		lvl  10, 19, blk_jump_platform_yellow
		lvl   3, 26, blk_gunMachine_TOP
		lvl   5, 25, blk_gunMachine_BOTTOM
		lvl  14, 26, blk_gunMachine_TOP
		lvl  16, 25, blk_gunMachine_BOTTOM
		db 0FFh

LVL_098:	lvl  19,  0, blk_green_ground2
		lvl  18, 234, blk_H_yellow_bricks
		lvl  18, 10, blk_V_yellow_bricks
		lvl  19, 13, blk_mine
		lvl  19, 19, blk_mine
		lvl  19, 25, blk_mine
		lvl  16, 16, blk_anim_swarm
		lvl  16, 23, blk_anim_swarm
		lvl   4, 17, blk_ship
		lvl  10,  7, blk_tower_dish
		db 0FFh

LVL_099:	lvl  19,  0, blk_green_ground2
		lvl   4, 12, blk_stage_end
		lvl   0,  1, blk_planet_big_red
		lvl   1, 23, blk_planet_medium_green
		lvl  11, 29, blk_yellow_figure
		lvl  16,  9, blk_blinker
		lvl  16, 22, blk_blinker
		lvl  19,  5, blk_mine
		db 0FFh

;STAGE 5 -----------------------------------------------------------------------------------------

LVL_100:	lvl  19,  0, blk_green_ground2
		lvl  18, 236, blk_H_yellow_bricks
		lvl  18, 12, blk_V_yellow_bricks
		lvl   2,  0, blk_ship
		lvl   8,  0, blk_gate_green
		lvl   0, 25, blk_planet_big_red
		lvl   5, 18, blk_planet_SmallRedPurple
		lvl  11, 29, blk_yellow_figure
		db 0FFh

LVL_101:	lvl  19,  0, blk_green_ground1
		lvl  14, 14, blk_waggon
		lvl  14, 20, blk_waggon
		lvl  19, 28, blk_mine
		lvl   0,  5, blk_planet_big_red
		lvl   3, 15, blk_planet_medium_green
		db 0FFh

LVL_102:	lvl  19, 232, blk_green_ground2
		lvl  17,  9, blk_jump_platform_yellow
		lvl  16, 14, blk_jump_platform_yellow
		lvl  15, 19, blk_jump_platform_yellow
		lvl  14, 24, blk_jump_platform_yellow
		lvl  13, 29, blk_jump_platform_yellow
		lvl  13, 19, blk_box_white
		lvl  11, 29, blk_box_yellow
		lvl   2, 26, blk_small_purpleRed
		lvl   0, 12, blk_planet_big_red
		lvl   3,  4, blk_planet_big_cyan
		db 0FFh

LVL_103:	lvl  20,  0, blk_ground_green_box1
		lvl  13,  2, blk_jump_platform_yellow
		lvl  13, 12, blk_jump_platform_yellow
		lvl  17, 16, blk_double_barrel
		lvl  14, 27, blk_birthpod
		lvl   2,  9, blk_ship
		db 0FFh

LVL_104:	lvl  20, 236, blk_ground_green_box1
		lvl  19, 12, blk_green_ground1
		lvl  18, 12, blk_ground_green_box1
		lvl  14, 20, blk_gunMachine1
		lvl  12, 27, blk_teleportGate
		lvl   8,  6, blk_jump_platform_yellow
		lvl   8, 15, blk_jump_platform_yellow
		lvl   8, 24, blk_jump_platform_yellow
		lvl   6,  0, blk_ground_white_box
		lvl   2,  6, blk_vbox_yellow_barrel
		lvl   2, 15, blk_vbox_yellow_barrel
		lvl   2, 24, blk_vbox_yellow_barrel
		lvl   0,  1, blk_teleportGate
		lvl   0,  6, blk_ground_white_box
		lvl  16, 13, blk_box_white
		db 0FFh

LVL_105:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_ground_green_box1
		lvl  18, 15, blk_anim_pump
		lvl   8,  6, blk_jump_platform_yellow
		lvl  10, 10, blk_jump_platform_yellow
		lvl  10, 21, blk_jump_platform_yellow
		lvl   6, 19, blk_gunMachine1
		lvl   6, 233, blk_ground_white_box
		lvl   2,  6, blk_vbox_yellow_barrel
		lvl   0, 233, blk_ground_white_box
		lvl  14,  9, blk_anim_swarm
		lvl  14,  9, blk_anim_swarm
		db 0FFh

LVL_106:	lvl  19,  0, blk_green_ground2
		lvl  18, 239, blk_ground_green_box1
		lvl  19, 15, blk_anim_pump
		lvl  19, 22, blk_anim_pump
		lvl  19, 29, blk_anim_pump
		lvl  17, 19, blk_box_white
		lvl  17, 26, blk_box_yellow
		lvl  10,  5, blk_tower_dish
		lvl  10, 10, blk_tower_dish
		lvl   2,  8, blk_planet_medium_green
		lvl   4, 21, blk_planet_big_red
		db 0FFh

LVL_107:	lvl  19,  0, blk_green_ground1
		lvl  19,  5, blk_mine
		lvl  15, 11, blk_gunMachine_TOP
		lvl  17, 10, blk_gunMachine_BOTTOM
		lvl  13, 18, blk_teleportGate
		lvl  11, 24, blk_vbox_yellow_barrel
		lvl  15, 24, blk_vbox_yellow_barrel
		lvl   9, 24, blk_ground_white_box
		lvl   3, 24, blk_teleportGate
		lvl  19, 29, blk_mine
		db 0FFh

LVL_108:	lvl  19,  0, blk_green_ground2
		lvl  11,  6, blk_vbox_yellow_barrel
		lvl  15,  6, blk_vbox_yellow_barrel
		lvl  11, 24, blk_vbox_yellow_barrel
		lvl  15, 24, blk_vbox_yellow_barrel
		lvl   9,  0, blk_ground_white_box
		lvl  17, 21, blk_box_white
		lvl   7,  3, blk_box_yellow
		lvl  13, 28, blk_teleportGate
		lvl   3,  6, blk_teleportGate
		lvl   6, 27, blk_double_barrel
		db 0FFh

LVL_109:	lvl  19,  0, blk_green_ground1
		lvl  11,  6, blk_vbox_yellow_barrel
		lvl  15,  6, blk_vbox_yellow_barrel
		lvl  11, 24, blk_vbox_yellow_barrel
		lvl  15, 24, blk_vbox_yellow_barrel
		lvl   9, 251, blk_ground_white_box
		lvl   9, 27, blk_ground_white_box
		lvl   7, 21, blk_box_white
		lvl   7, 25, blk_box_yellow
		lvl   2, 14, blk_changing_room
		lvl  19, 10, blk_mine
		lvl  19, 15, blk_mine
		lvl  19, 20, blk_mine
		lvl  15, 20, blk_anim_swarm
		lvl  15, 19, blk_anim_swarm
		db 0FFh

LVL_110:	lvl  19,  0, blk_green_ground2
		lvl   9, 233, blk_ground_white_box
		lvl  11,  6, blk_vbox_yellow_barrel
		lvl  15,  6, blk_vbox_yellow_barrel
		lvl   0, 18, blk_beam_up
		lvl  19, 19, blk_beam_down
		lvl  19, 13, blk_mine
		db 0FFh

LVL_111:	lvl  19,  0, blk_green_ground1
		lvl  18,  5, blk_V_yellow_bricks
		lvl  18,  6, blk_H_yellow_bricks
		lvl  16,  9, blk_box_white
		lvl   2,  5, blk_planet_medium_green
		lvl   0, 16, blk_planet_big_red
		db 0FFh

LVL_112:	lvl  19,  0, blk_green_ground2
		lvl  18,  0, blk_H_yellow_bricks
		lvl  13,  6, blk_waggon
		lvl  13, 12, blk_waggon
		lvl  12, 18, blk_teleportGate
		lvl  11, 25, blk_vbox_green_column
		lvl   8, 18, blk_green_ground1
		lvl  10, 18, blk_H_yellow_bricks
		lvl   2, 18, blk_teleportGate
		db 0FFh

LVL_113:	lvl  19,  0, blk_green_ground1
		lvl  18,  0, blk_H_yellow_bricks
		lvl  12,  4, blk_teleportGate
		lvl  12, 12, blk_anim_swarm
		lvl  16, 12, blk_anim_swarm
		lvl  11, 15, blk_vbox_green_column
		lvl   8,  0, blk_green_ground2
		lvl  10,  0, blk_H_yellow_bricks
		lvl   2,  4, blk_teleportGate
		lvl   5, 27, blk_double_barrel
		db 0FFh

LVL_114:	lvl  19, 236, blk_green_ground2
		lvl  18, 236, blk_H_yellow_bricks
		lvl  18,  12, blk_V_yellow_bricks
		lvl  20,  13, blk_ground_green_box1
		lvl  11,   6, blk_vbox_green_column
		lvl   8, 232, blk_green_ground2
		lvl  10, 232, blk_H_yellow_bricks
		lvl   4,   3, blk_gunMachine1
		lvl   0,  21, blk_beam_up
		lvl  18,  22, blk_beam_down
		lvl  20,  29, blk_anim_pump
		db 0FFh

LVL_115:	lvl  20,  0, blk_ground_green_box1
		lvl  18,  6, blk_box_white
		lvl  14,  9, blk_birthpod
		lvl  14, 14, blk_birthpod
		lvl  14, 20, blk_tower_rocket
		lvl  14, 24, blk_tower_rocket
		lvl  18, 28, blk_box_yellow
		lvl   4,  8, blk_planet_big_red
		lvl   2, 24, blk_small_purpleRed
		db 0FFh

LVL_116:	lvl  20, 236, blk_ground_green_box1
		lvl  19,  12, blk_green_ground2
		lvl  18,  12, blk_ground_green_box1
		lvl  18,   7, blk_beam_down
		lvl  11,  13, blk_vbox_green_column
		lvl  12,  20, blk_birthpod
		lvl  12,  27, blk_teleportGate
		lvl   8,  13, blk_green_ground1
		lvl   2,  13, blk_teleportGate
		lvl   4,  20, blk_gunMachine1
		lvl   6,  27, blk_box_white
		lvl   6,  30, blk_box_yellow
		lvl   0,   6, blk_beam_up
		db 0FFh

LVL_117:	lvl  19,   0, blk_green_ground1
		lvl  18, 233, blk_ground_green_box1
		lvl  18,   9, blk_V_yellow_bricks
		lvl  11,   7, blk_vbox_green_column
		lvl   8,   0, blk_green_ground2
		lvl   8,  19, blk_mine
		lvl  19,  14, blk_anim_pump
		lvl  19,  24, blk_anim_pump
		db 0FFh

LVL_118:	lvl   19,   0, blk_green_ground2
		lvl    8, 230, blk_green_ground2
		lvl   10,  17, blk_control_beacon
		lvl   14,  18, blk_beacon_base
		lvl   11,   3, blk_jump_platform_yellow
		lvl    0,  25, blk_planet_medium_green
		lvl   17,   8, blk_box_white
		lvl   19,  13, blk_mine
		lvl   19,  23, blk_mine
		lvl   15,  26, blk_mushroom
		db 0FFh

LVL_119:	lvl   19,   0, blk_green_ground1
		lvl   13,   6, blk_tower_rocket
		lvl   13,  22, blk_tower_rocket
		lvl   17,  14, blk_box_yellow
		lvl    9,  10, blk_gate_green
		db 0FFh

LVL_120:	lvl  19, 233, blk_green_ground1
		lvl  20,  9, blk_ground_white_box
		lvl  14, 19, blk_teleportGate
		lvl  12, 12, blk_vbox_yellow_barrel
		lvl  16, 12, blk_vbox_yellow_barrel
		lvl  12, 27, blk_vbox_yellow_barrel
		lvl  16, 27, blk_vbox_yellow_barrel
		lvl  10, 12, blk_ground_white_box
		lvl   4, 12, blk_teleportGate
		lvl   6, 25, blk_gunMachine_TOP
		lvl   8, 24, blk_gunMachine_BOTTOM
		lvl   0,  0, blk_planet_big_red
		db 0FFh

LVL_121:	lvl  20,  0, blk_ground_white_box
		lvl  10,  0, blk_ground_white_box
		lvl  12,  3, blk_vbox_yellow_barrel
		lvl  16,  3, blk_vbox_yellow_barrel
		lvl  12, 26, blk_vbox_yellow_barrel
		lvl  16, 26, blk_vbox_yellow_barrel
		lvl  16, 20, blk_gunMachine_TOP
		lvl  18, 19, blk_gunMachine_BOTTOM
		lvl   6, 20, blk_gunMachine_TOP
		lvl   8, 19, blk_gunMachine_BOTTOM
		lvl   8,  6, blk_box_white
		lvl   8,  9, blk_box_yellow
		lvl  18, 10, blk_anim_swarm
		lvl  16, 15, blk_anim_swarm
		db 0FFh

LVL_122:	lvl   20,   0, blk_ground_white_box
		lvl   12,   6, blk_vbox_yellow_barrel
		lvl   16,   6, blk_vbox_yellow_barrel
		lvl   10, 233, blk_ground_white_box
		lvl    4,   5, blk_birthpod
		lvl    9,  14, blk_jump_platform_yellow
		lvl    7,  18, blk_jump_platform_yellow
		lvl    7,  28, blk_jump_platform_yellow
		lvl    3,  16, blk_gunMachine1
		lvl   20,  11, blk_anim_pump
		lvl   20,  18, blk_anim_pump
		lvl   20,  25, blk_anim_pump
		db 0FFh

LVL_123:	lvl   20, 233, blk_ground_white_box
		lvl   19,   9, blk_green_ground2
		lvl   15,   5, blk_waggon
		lvl   13,  15, blk_teleportGate
		lvl   16,  28, blk_double_barrel
		lvl   11,  21, blk_vbox_yellow_barrel
		lvl   15,  21, blk_vbox_yellow_barrel
		lvl    9,  21, blk_ground_green_box1
		lvl    8,  21, blk_H_yellow_bricks
		lvl    2,  21, blk_teleportGate
		lvl    7,   0, blk_jump_platform_yellow
		lvl   10,   4, blk_jump_platform_yellow
		db 0FFh

LVL_124:	lvl   19,   0, blk_green_ground2
		lvl   18,  11, blk_V_yellow_bricks
		lvl   18,  12, blk_H_yellow_bricks
		lvl   11,   6, blk_vbox_yellow_barrel
		lvl   15,   6, blk_vbox_yellow_barrel
		lvl   15,  13, blk_blinker
		lvl   15,  28, blk_blinker
		lvl    9, 233, blk_ground_green_box1
		lvl    8, 233, blk_H_yellow_bricks
		lvl    3,  17, blk_stage_end
		db 0FFh
