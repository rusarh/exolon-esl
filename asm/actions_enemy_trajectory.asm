;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;db 	dx,dy
;exit if dx=0xc3
;repeat next row dy times if dx=0xc4

enemy_trajectory_01:
		db	-1,  0
		db	-1,  0
		db	-1, -1
		db	-1, -1
		db	-1, -2
		db	-1, -2
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -2
		db	-1, -2
		db	-1, -1
		db	-1, -1
		db	-1,  0
		db	-1,  1
		db	-1,  1
		db	-1,  2
		db	-1,  2
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  2
		db	-1,  2
		db	-1,  1
		db	-1,  1
		db 0C3h
enemy_trajectory_02:
		db	-1,  0
		db	-1,  0
		db	-1, -1
		db	-1, -1
		db	-1, -2
		db	-1, -2
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -3
		db	-1, -2
		db	-1, -2
		db	-1, -1
		db	-1, -1
		db	-1,  0
		db	-1,  1
		db	-1,  1
		db	-1,  2
		db	-1,  2
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  3
		db	-1,  2
		db	-1,  2
		db	-1,  1
		db	-1,  1
		db	0C4h,  0Fh, -1,  0
		db	0C4h,    6, -2,  0
		db	0C4h,  64h, -4,  0
		db 0C3h
enemy_trajectory_03:
		db	0C4h,  22h, -2,  0
		db	0C4h,    4, -2, -2
		db	0C4h,    2, -2, -8
		db	0C4h,    3,  0, -8
		db	0C4h,    2,  2, -8
		db	0C4h,    4,  2, -2
		db	0C4h,    6,  2,  0
		db	0C4h,    4,  2,  2
		db	0C4h,    2,  2,  8
		db	0C4h,    3,  0,  8
		db	0C4h,    2, -2,  8
		db	0C4h,    4, -2,  2
		db	0C4h,  64h, -2,  0
		db 0C3h
enemy_trajectory_04:
		db	0C4h,  28h, -1,  0
		db	0C4h,  64h, -4,  0
		db 0C3h
enemy_trajectory_05:
		db	0C4h,  12h, -2,  0
		db	0C4h,  20h,  0, -1
		db	0C4h,  18h,  0,  1
		db	0C4h,    6,  0,  0
		db	0C4h,  64h, -4,  0
		db 0C3h
enemy_trajectory_06:
		db	0C4h,    8, -2, -4
		db	0C4h,    8, -2,  4
		db	0C4h,    8, -2, -4
		db	0C4h,    8,  0,  4
		db	0C4h,  18h, -2,  0
		db	0C4h,    6,  0, -4
		db	0C4h,    6,  2,  0
		db	0C4h,    6,  0,  4
		db	0C4h,  64h, -4,  0
		db 0C3h
;