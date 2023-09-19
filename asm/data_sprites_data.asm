;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

Shifted4Sprites:db 0C0h,   0,0E0h,   0,	14h,   0, 77h,	 0, 14h,   0,0E0h
		db    0,0C0h,	0,   0,	  0, 30h,   0, 38h,   0,   5,	0
		db  1Dh,0C0h,	5,   0,	38h,   0, 30h,	 0,   0,   0, 0Ch
		db    0, 0Eh,	0,   1,	40h,   7, 70h,	 1, 40h, 0Eh,	0
		db  0Ch,   0,	0,   0,	  3,   0,   3, 80h,   0, 50h,	1
		db 0DCh,   0, 50h,   3,	80h,   3,   0,	 0,   0,   0,	0
		db    3,   0,	7,   0,	28h,   0,0EEh,	 0, 28h,   0,	7
		db    0,   3,	0,   0,	  0,   0,0C0h,	 1,0C0h, 0Ah,	0
		db  3Bh, 80h, 0Ah,   0,	  1,0C0h,   0,0C0h,   0,   0,	0
		db  30h,   0, 70h,   2,	80h, 0Eh,0E0h,	 2, 80h,   0, 70h
		db    0, 30h,	0,   0,	  0, 0Ch,   0, 1Ch,   0,0A0h,	3
		db 0B8h,   0,0A0h,   0,	1Ch,   0, 0Ch, 1Ch,   0, 14h, 84h
		db  70h,   0,0C9h,   8,0B8h, 20h,0D2h,	 0, 70h,   4, 14h
		db  20h,   7,	0, 49h,	  0, 1Fh, 10h, 3Dh, 40h,0A6h,	4
		db  34h,0A0h, 1Ch,   8,	45h,   0,   1,0C0h, 11h, 48h,	7
		db  82h, 2Ch,0D0h, 8Ah,	80h, 0Dh,0A0h, 27h,   4,   1, 40h
		db    4, 70h,	0,0D4h,	  9,0E0h, 21h, 24h,   2, 61h, 53h
		db 0C8h,   1,0C2h,   4,	50h, 14h,   0, 40h,   0, 15h,	0
		db  88h,   0, 54h,   0,	81h,   0, 24h,	 0,   8,   0,	5
		db    0, 10h,	0,   5,	40h, 22h,   0, 15h,   0, 20h, 40h
		db    9,   0,	2,   0,	  1, 40h,   4,	 0,   1, 50h,	8
		db  80h,   5, 40h,   8,	10h,   2, 40h,	 0, 80h,   0, 50h
		db    1,   0,	0, 54h,	  2, 20h,   1, 50h,   2,   4,	0
		db  90h,   0, 20h, 10h,	  0,   4,   0, 28h,   0, 52h,	0
		db    8,   0, 50h,   0,	  4,   0,   0,	 0,   4,   0,	1
		db    0, 0Ah,	0, 14h,	80h,   2,   0, 14h,   0,   1,	0
		db    0,   0,	1,   0,	  0, 40h,   2, 80h,   5, 20h,	0
		db  80h,   5,	0,   0,	40h,   0,   0,	 0, 40h,   0, 10h
		db    0,0A0h,	1, 48h,	  0, 20h,   1, 40h,   0, 10h,	0
		db    0,   0,	0,   8,	  0,   0,   0, 2Ah,   0, 10h,	0
		db    8,   0,	0,   0,	  0,   0,   0,	 0,   2,   0,	0
		db    0, 0Ah, 80h,   4,	  0,   2,   0,	 0,   0,   0,	0
		db    0,   0,	0, 80h,	  0,   0,   2,0A0h,   1,   0,	0
		db  80h,   0,	0,   0,	  0,   0,   0,	 0, 20h,   0,	0
		db    0,0A8h,	0, 40h,	  0, 20h,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0, 3Ch,   0, 7Eh
		db    0,0FFh,	0,0FFh,	  0,0FFh,   0,0FFh,   0, 7Eh,	0
		db  3Ch,   0, 0Fh,   0,	1Fh, 80h, 3Fh,0C0h, 3Fh,0C0h, 3Fh
		db 0C0h, 3Fh,0C0h, 1Fh,	80h, 0Fh,   0,	 0,   0,   3,0C0h
		db    7,0E0h,	7,0E0h,	  7,0E0h,   7,0E0h,   3,0C0h,	0
		db    0,   0,	0,   0,0F0h,   1,0F8h,	 1,0F8h,   1,0F8h
		db    1,0F8h,	0,0F0h,	  0,   0,   0,	 0,   0,   0, 2Fh
		db    0,0EFh,	0, 2Fh,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	0Bh,0C0h, 3Bh,0C0h, 0Bh,0C0h,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   2,0F0h
		db  0Eh,0F0h,	2,0F0h,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,0BCh,   3,0BCh,	 0,0BCh,   0,	0
		db    0,   0,	0,   0
;
PLAYER_WALK:	db    0,   0,	0,   0,	10h,   0,   0, 20h,   0,   0, 21h
		db 0E0h,   0,0C7h,0F0h,	  6, 6Fh, 88h, 0Dh,0CFh, 70h, 0Bh ; 10 phases
		db 0B7h, 40h, 1Bh, 4Bh,	78h, 16h,0B5h,0B0h,   2, 7Ah,0C0h
		db  0Fh, 7Bh, 70h, 1Eh,0BBh,   0, 0Eh,0EBh, 30h,   1,0F0h
		db  7Fh,   1,0FDh, 86h,	  0, 7Dh,0F8h,	 1, 81h,0B8h,	0
		db 0FCh, 30h,	2,   0,	  0,   5, 54h,	 0, 0Ah,0A0h,	0
		db  34h, 16h,	0,   3,0EEh,   0, 0Fh, 9Eh,   0, 1Fh, 0Fh
		db    0, 15h, 0Ah, 80h,	7Ch,   7,   0,0F0h,   7,   0,0E0h
		db    3, 20h, 70h,   7,0E0h, 3Ch,   7, 80h,   0,   0,	0
		db    0,   0,	0,   0,	10h,   0,   0, 20h,   0,   0, 21h
		db 0E0h,   0,0C7h,0F0h,	  6, 6Fh, 88h, 0Dh,0CFh, 70h, 0Bh
		db 0B7h, 40h, 1Bh, 4Bh,	78h, 16h,0B5h,0B0h,   2, 7Ah,0C0h
		db  0Eh,0FBh, 70h, 1Dh,	7Bh,   0, 0Dh,0D7h, 60h,   3,0E0h
		db 0FEh,   3,0FBh, 0Ch,	  0,0FBh,0F0h,	 1,   3, 70h,	0
		db 0FCh, 60h,	2,   0,	  0,   5, 54h,	 0, 0Ah,0A2h,	0
		db  14h, 17h,	0, 21h,0F7h,   0,   2,0EEh,   0,   2,0CAh
		db    0, 0Fh, 4Eh,   0,	0Eh, 1Ch,   0, 0Ch, 0Ch,   0, 0Ch
		db  1Eh,   0,	4, 1Fh,	80h,   0,   0,	 0,   0, 10h,	0
		db    0, 20h,	0,   0,	20h,   0,   0,0C1h,0E0h,   6, 67h
		db 0F0h, 0Dh,0CFh, 88h,	0Bh,0B7h, 70h, 1Bh, 4Bh, 40h, 16h
		db 0B5h, 78h,	2, 7Ah,0B0h, 0Eh,0FBh, 50h, 1Dh, 7Bh, 20h
		db  0Dh,0D7h, 60h,   3,0E0h,0FEh,   3,0FBh, 0Ch,   0,0FBh
		db 0F0h,   1,	3, 70h,	  0,0FCh, 60h,	 2,   0,   0,	5
		db  54h,   0,	2,0A0h,	  0,   5, 18h,	 0,   8,0FCh,	0
		db    1, 78h,	0,   7,0A0h,   0,   7,	 8,   0,   7, 38h
		db    0,   6, 70h,   0,	  2, 30h,   0,	 0, 78h,   0,	0
		db  7Eh,   0,	0, 10h,	  0,   0, 20h,	 0,   0, 21h,0E0h
		db    0,0C7h,0F0h,   6,	6Fh, 88h, 0Dh,0CFh, 70h, 0Bh,0B7h
		db  40h, 1Bh, 4Bh, 78h,	16h,0B5h,0B0h,	 2, 7Ah,0C0h, 0Eh
		db 0FBh, 70h, 1Dh, 7Bh,	  0, 0Dh,0D7h, 60h,   3,0E0h,0FEh
		db    3,0FBh, 0Ch,   0,0FBh,0F0h,   1,	 3, 70h,   0,0FCh
		db  60h,   2,	0,   0,	  1, 54h,   0,	 2,0A2h,   0,	5
		db  0Fh,   0,	2,0CFh,	80h,   4, 97h, 80h,   1, 7Dh,	0
		db    1,0F0h,	0,   2,	78h,   0,   1, 1Eh,   0,   1, 80h
		db    0,   1, 80h,   0,	  3,0C0h,   0,	 3,0F0h,   0,	0
		db    0,   0,	0, 10h,	  0,   0, 20h,	 0,   0, 21h,0E0h
		db    0,0C7h,0F0h,   6,	6Fh, 88h, 0Dh,0CFh, 70h, 0Bh,0B7h
		db  40h, 1Bh, 4Bh, 78h,	16h,0B5h,0B0h,	 2, 7Ah,0C0h, 0Eh
		db 0FBh, 70h, 1Dh, 7Bh,	  0, 0Dh,0D7h, 60h,   3,0E0h,0FEh
		db    3,0FBh, 0Ch,   0,0FBh,0F0h,   1,	 3, 70h,   0,0FCh
		db  60h,   2,	0,   0,	  5, 54h,   0, 0Ah,0A2h,   0,	5
		db  1Fh,   0,	8,0EFh,	80h,   0,0F3h, 80h,   1, 45h, 40h
		db    5, 43h, 80h,   3,	83h, 80h,   7,	 7,   0, 0Eh,	7
		db  80h, 0Fh,	1,0E0h,	  7,0C0h,   0,	 0,   0,   0,	0
		db  10h,   0,	0, 20h,	  0,   0, 21h,0E0h,   0,0C7h,0F0h
		db    6, 6Fh, 88h, 0Dh,0CFh, 70h, 0Bh,0B7h, 40h, 1Bh, 4Bh
		db  78h, 16h,0B5h,0B0h,	  2, 7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh
		db  7Bh,   0, 0Dh,0D7h,	60h,   3,0E0h,0FEh,   3,0FBh, 0Ch
		db    0,0FBh,0F0h,   1,	  3, 70h,   0,0FCh, 60h,   2,	0
		db    0,   5, 54h,   0,	0Ah,0A4h,   0, 34h, 1Eh,   0,	3
		db 0BEh,   0, 0Fh, 9Eh,	  0, 1Fh, 0Fh,	 0, 15h, 0Ah, 80h
		db  7Ch,   7,	0,0F0h,	  7,   0,0E0h,	 3, 20h, 70h,	7
		db 0E0h, 3Ch,	7, 80h,	  0,   0,   0,	 0,   0,   0,	0
		db  10h,   0,	0, 20h,	  0,   0, 21h,0E0h,   0,0C7h,0F0h
		db    6, 6Fh, 88h, 0Dh,0CFh, 70h, 0Bh,0B7h, 40h, 1Bh, 4Bh
		db  78h, 16h,0B5h,0B0h,	  2, 7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh
		db  7Bh,   0, 0Dh,0D7h,	60h,   3,0E0h,0FEh,   3,0FBh, 0Ch
		db    0,0FBh,0F0h,   1,	  3, 70h,   0,0FCh, 60h,   2,	0
		db    0,   5, 54h,   0,	0Ah,0A2h,   0, 14h, 1Fh,   0, 21h
		db 0DFh,   0,	2,0DEh,	  0,   2,0AAh,	 0, 0Fh, 5Eh,	0
		db  0Eh, 1Ch,	0, 0Ch,	0Ch,   0, 0Ch, 1Eh,   0,   4, 1Fh
		db  80h,   0,	0,   0,	  0, 10h,   0,	 0, 20h,   0,	0
		db  20h,   0,	0,0C1h,0E0h,   6, 67h,0F0h, 0Dh,0CFh, 88h
		db  0Bh,0B7h, 70h, 1Bh,	4Bh, 40h, 16h,0B5h, 78h,   2, 7Ah
		db 0B0h, 0Eh,0FBh, 40h,	1Dh, 7Bh, 30h, 0Dh,0D7h, 60h,	3
		db 0E0h,0FEh,	3,0FBh,	0Ch,   0,0FBh,0F0h,   1,   3, 70h
		db    0,0FCh, 60h,   2,	  0,   0,   5, 54h,   0,   2,0A0h
		db    0,   5, 18h,   0,	  8,0F8h,   0,	 1, 78h,   0,	6
		db  70h,   0,	6,0A8h,	  0,   6, 78h,	 0,   6, 70h,	0
		db    2, 30h,	0,   0,	78h,   0,   0, 7Eh,   0,   0, 10h
		db    0,   0, 20h,   0,	  0, 21h,0E0h,	 0,0C7h,0F0h,	6
		db  6Fh, 88h, 0Dh,0CFh,	70h, 0Bh,0B7h, 40h, 1Bh, 4Bh, 78h
		db  16h,0B5h,0B0h,   2,	7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh, 7Bh
		db    0, 0Dh,0D7h, 60h,	  3,0E0h,0FEh,	 3,0FBh, 0Ch,	0
		db 0FBh,0F0h,	1,   3,	70h,   0,0FCh, 60h,   2,   0,	0
		db    5, 54h,	0,   2,0A2h,   0,   5, 1Bh,   0, 0Ah,0F7h
		db  80h,   4,0F7h, 80h,	  9,0EDh,   0,	 1,0E0h,   0,	2
		db 0A8h,   0,	3,0DEh,	  0,   3, 80h,	 0,   1, 80h,	0
		db    3,0C0h,	0,   3,0F0h,   0,   0,	 0,   0,   0, 10h
		db    0,   0, 20h,   0,	  0, 21h,0E0h,	 0,0C7h,0F0h,	6
		db  6Fh, 88h, 0Dh,0CFh,	70h, 0Bh,0B7h, 40h, 1Bh, 4Bh, 78h
		db  16h,0B5h,0B0h,   2,	7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh, 7Bh
		db    0, 0Dh,0D7h, 60h,	  3,0E0h,0FEh,	 3,0FBh, 0Ch,	0
		db 0FBh,0F0h,	1,   3,	70h,   0,0FCh, 60h,   2,   0,	0
		db    5, 54h,	0, 0Ah,0A2h,   0,   5, 1Bh,   0,   8,0F7h
		db  80h,   0,0E3h, 80h,	  3,0E5h, 40h,	 2,0A3h, 80h,	3
		db  83h, 80h,	7,   7,	  0, 0Eh,   7, 80h, 0Fh,   1,0E0h
		db    7,0C0h,	0
;
PLAYER_DUCK:	db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   8,   0,	0
		db  10h,   0,	0, 10h,0F0h,   0, 63h,0F8h,   3, 37h,0C4h
		db    6,0E7h,0B8h,   5,0DBh,0A0h, 0Dh,0A5h,0BCh, 0Bh, 5Ah
		db 0D8h,   1, 3Dh, 60h,	  7, 7Dh,0B8h, 0Eh,0BDh, 80h,	6
		db 0EBh,0B0h,	1,0F0h,	7Fh,   1,0FDh, 86h,   0, 7Dh,0F8h
		db    0, 81h,0B8h,   0,	7Eh, 30h,   1,	 0, 80h,   2,0ABh
		db 0C0h,   5, 57h,0A0h,	30h,   2, 60h, 7Eh,0F0h,0E0h,0FCh
		db 0E0h, 60h,0CDh,0E0h,0F0h, 45h,0C0h,0FCh
;
PLAYER_DIE:	db    0,   0,	0,   0,	  0,   0,   0,	 0,0E0h,   0,	1
		db 0A0h,   0,	6, 80h,	  0,   7,   0,	 0, 0Ah,   0,	0
		db  0Ch,0E0h,	0, 5Dh,0F0h,   6,0DDh, 88h, 0Ch,0BDh, 70h
		db    9,0BDh, 40h, 1Bh,	5Bh, 78h, 16h, 71h,0B0h,   2,0FAh
		db 0D7h, 0Eh,0FBh, 6Dh,	1Eh, 7Bh, 14h, 0Ch, 77h, 68h,	1
		db  86h, 70h,	1,0FEh,0C0h,   1,0FEh,	 0,   1,0FCh,	0
		db    0,0FCh,	0,   2,	  0,   2,   1, 54h,   2,   2,0A8h
		db 0D6h,   5, 53h, 5Dh,	  2,0A7h, 95h,	 5, 4Fh,0EBh, 0Ah
		db    2,0DFh, 10h,   0,	5Eh,   0,   0, 16h
;
PLAYER_2GUN_WALK10:db	 0,   0,   0,	0, 10h,	  0,   0, 20h,	 0,   0, 21h ; 10 phases, 2gun
		db 0E0h,   0,0C7h,0F0h,	  6, 6Fh, 80h, 0Dh,0CFh, 78h, 0Bh
		db 0B7h, 78h, 1Bh, 4Bh,	78h, 16h,0B5h,0B8h,   2, 7Ah,0C0h
		db  0Fh, 7Bh, 70h, 1Eh,0BBh,   0, 0Eh,0EBh, 31h,   1,0F0h
		db  7Fh,   1,0FDh, 81h,	  0, 7Dh,0F8h,	 1, 81h,0B8h,	0
		db 0FCh, 30h,	2,   0,	41h,   7,0FCh, 7Fh, 0Fh,0E0h, 31h
		db  3Ch, 16h,	0,   3,0EEh,   0, 0Fh, 9Eh,   0, 1Fh, 0Fh
		db    0, 15h, 0Ah, 80h,	7Ch,   7,   0,0F0h,   7,   0,0E0h
		db    3, 20h, 70h,   7,0E0h, 3Ch,   7, 80h,   0,   0,	0
		db    0,   0,	0,   0,	10h,   0,   0, 20h,   0,   0, 21h
		db 0E0h,   0,0C7h,0F0h,	  6, 6Fh, 80h, 0Dh,0CFh, 78h, 0Bh
		db 0B7h, 78h, 1Bh, 4Bh,	78h, 16h,0B5h,0B8h,   2, 7Ah,0C0h
		db  0Eh,0FBh, 70h, 1Dh,	7Bh,   0, 0Dh,0D7h, 62h,   3,0E0h
		db 0FEh,   3,0FBh,   2,	  0,0FBh,0F0h,	 1,   3, 70h,	0
		db 0FCh, 60h,	2,   0,	82h,   7,0FCh,0FEh, 0Fh,0E2h, 62h
		db  1Ch, 17h,	0, 21h,0F7h,   0,   2,0EEh,   0,   2,0CAh
		db    0, 0Fh, 4Eh,   0,	0Eh, 1Ch,   0, 0Ch, 0Ch,   0, 0Ch
		db  1Eh,   0,	4, 1Fh,	80h,   0,   0,	 0,   0, 10h,	0
		db    0, 20h,	0,   0,	20h,   0,   0,0C1h,0E0h,   6, 67h
		db 0F0h, 0Dh,0CFh, 80h,	0Bh,0B7h, 78h, 1Bh, 4Bh, 78h, 16h
		db 0B5h, 78h,	2, 7Ah,0B8h, 0Eh,0FBh, 40h, 1Dh, 7Bh, 20h
		db  0Dh,0D7h, 62h,   3,0E0h,0FEh,   3,0FBh,   2,   0,0FBh
		db 0F0h,   1,	3, 70h,	  0,0FCh, 60h,	 2,   0, 82h,	7
		db 0FCh,0FEh,	7,0E0h,	62h,   5, 18h,	 0,   8,0FCh,	0
		db    1, 78h,	0,   7,0A0h,   0,   7,	 8,   0,   7, 38h
		db    0,   6, 70h,   0,	  2, 30h,   0,	 0, 78h,   0,	0
		db  7Eh,   0,	0, 10h,	  0,   0, 20h,	 0,   0, 21h,0E0h
		db    0,0C7h,0F0h,   6,	6Fh, 80h, 0Dh,0CFh, 78h, 0Bh,0B7h
		db  78h, 1Bh, 4Bh, 78h,	16h,0B5h,0B8h,	 2, 7Ah,0C0h, 0Eh
		db 0FBh, 70h, 1Dh, 7Bh,	  0, 0Dh,0D7h, 62h,   3,0E0h,0FEh
		db    3,0FBh,	2,   0,0FBh,0F0h,   1,	 3, 70h,   0,0FCh
		db  60h,   2,	0, 82h,	  3,0FCh,0FEh,	 3,0E2h, 62h,	7
		db  0Fh,   0,	6,0CFh,	80h,   4, 97h, 80h,   1, 7Dh,	0
		db    1,0F0h,	0,   2,	78h,   0,   1, 1Eh,   0,   1, 80h
		db    0,   1, 80h,   0,	  3,0C0h,   0,	 3,0F0h,   0,	0
		db    0,   0,	0, 10h,	  0,   0, 20h,	 0,   0, 21h,0E0h
		db    0,0C7h,0F0h,   6,	6Fh, 80h, 0Dh,0CFh, 78h, 0Bh,0B7h
		db  78h, 1Bh, 4Bh, 78h,	16h,0B5h,0B8h,	 2, 7Ah,0C0h, 0Eh
		db 0FBh, 70h, 1Dh, 7Bh,	  0, 0Dh,0D7h, 62h,   3,0E0h,0FEh
		db    3,0FBh,	2,   0,0FBh,0F0h,   1,	 3, 70h,   0,0FCh
		db  60h,   2,	0, 82h,	  7,0FCh,0FEh, 0Fh,0E2h, 62h, 0Dh
		db  1Fh,   0,	8,0EFh,	80h,   0,0F3h, 80h,   1, 45h, 40h
		db    5, 43h, 80h,   3,	83h, 80h,   7,	 7,   0, 0Eh,	7
		db  80h, 0Fh,	1,0E0h,	  7,0C0h,   0,	 0,   0,   0,	0
		db  10h,   0,	0, 20h,	  0,   0, 21h,0E0h,   0,0C7h,0F0h
		db    6, 6Fh, 80h, 0Dh,0CFh, 78h, 0Bh,0B7h, 78h, 1Bh, 4Bh
		db  78h, 16h,0B5h,0B8h,	  2, 7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh
		db  7Bh,   0, 0Dh,0D7h,	62h,   3,0E0h,0FEh,   3,0FBh,	2
		db    0,0FBh,0F0h,   1,	  3, 70h,   0,0FCh, 60h,   2,	0
		db  82h,   7,0F4h,0FEh,	0Fh,0E4h, 62h, 3Ch, 1Eh,   0,	3
		db 0BEh,   0, 0Fh, 9Eh,	  0, 1Fh, 0Fh,	 0, 15h, 0Ah, 80h
		db  7Ch,   7,	0,0F0h,	  7,   0,0E0h,	 3, 20h, 70h,	7
		db 0E0h, 3Ch,	7, 80h,	  0,   0,   0,	 0,   0,   0,	0
		db  10h,   0,	0, 20h,	  0,   0, 21h,0E0h,   0,0C7h,0F0h
		db    6, 6Fh, 80h, 0Dh,0CFh, 78h, 0Bh,0B7h, 78h, 1Bh, 4Bh
		db  78h, 16h,0B5h,0B8h,	  2, 7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh
		db  7Bh,   0, 0Dh,0D7h,	62h,   3,0E0h,0FEh,   3,0FBh,	2
		db    0,0FBh,0F0h,   1,	  3, 70h,   0,0FCh, 60h,   2,	0
		db  82h,   7,0FCh,0FEh,	0Fh,0E2h, 62h, 1Ch, 1Fh,   0, 21h
		db 0DFh,   0,	2,0DEh,	  0,   2,0AAh,	 0, 0Fh, 5Eh,	0
		db  0Eh, 1Ch,	0, 0Ch,	0Ch,   0, 0Ch, 1Eh,   0,   4, 1Fh
		db  80h,   0,	0,   0,	  0, 10h,   0,	 0, 20h,   0,	0
		db  20h,   0,	0,0C1h,0E0h,   6, 67h,0F0h, 0Dh,0CFh, 80h
		db  0Bh,0B7h, 78h, 1Bh,	4Bh, 78h, 16h,0B5h, 78h,   2, 7Ah
		db 0B8h, 0Eh,0FBh, 40h,	1Dh, 7Bh, 30h, 0Dh,0D7h, 62h,	3
		db 0E0h,0FEh,	3,0FBh,	  2,   0,0FBh,0F0h,   1,   3, 70h
		db    0,0FCh, 60h,   2,	  0, 82h,   7,0F4h,0FEh,   7,0E0h
		db  62h,   7, 18h,   0,	  8,0F8h,   0,	 1, 78h,   0,	6
		db  70h,   0,	6,0A8h,	  0,   6, 78h,	 0,   6, 70h,	0
		db    2, 30h,	0,   0,	78h,   0,   0, 7Eh,   0,   0, 10h
		db    0,   0, 20h,   0,	  0, 21h,0E0h,	 0,0C7h,0F0h,	6
		db  6Fh, 80h, 0Dh,0CFh,	78h, 0Bh,0B7h, 78h, 1Bh, 4Bh, 78h
		db  16h,0B5h,0B8h,   2,	7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh, 7Bh
		db    0, 0Dh,0D7h, 62h,	  3,0E0h,0FEh,	 3,0FBh,   2,	0
		db 0FBh,0F0h,	1,   3,	70h,   0,0FCh, 60h,   2,   0, 82h
		db    7,0FCh,0FEh,   7,0E2h, 62h,   7, 1Bh,   0, 0Eh,0F7h
		db  80h, 0Ch,0F7h, 80h,	  9,0EDh,   0,	 1,0E0h,   0,	2
		db 0A8h,   0,	3,0DEh,	  0,   3, 80h,	 0,   1, 80h,	0
		db    3,0C0h,	0,   3,0F0h,   0,   0,	 0,   0,   0, 10h
		db    0,   0, 20h,   0,	  0, 21h,0E0h,	 0,0C7h,0F0h,	6
		db  6Fh, 80h, 0Dh,0CFh,	78h, 0Bh,0B7h, 78h, 1Bh, 4Bh, 78h
		db  16h,0B5h,0B8h,   2,	7Ah,0C0h, 0Eh,0FBh, 70h, 1Dh, 7Bh
		db    0, 0Dh,0D7h, 62h,	  3,0E0h,0FEh,	 3,0FBh,   2,	0
		db 0FBh,0F0h,	1,   3,	70h,   0,0FCh, 60h,   2,   0, 82h
		db    7,0FCh,0FEh, 0Fh,0E2h, 62h, 0Fh, 1Bh,   0,   8,0F7h
		db  80h,   0,0E3h, 80h,	  3,0E5h, 40h,	 2,0A3h, 80h,	3
		db  83h, 80h,	7,   7,	  0, 0Eh,   7, 80h, 0Fh,   1,0E0h
		db    7,0C0h,	0
;
PLAYER_2GUN_DUCK:db    0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   8,   0,	0
		db  10h,   0,	0, 10h,0F0h,   0, 63h,0F8h,   3, 37h,0C0h
		db    6,0E7h,0BCh,   5,0DBh,0BCh, 0Dh,0A5h,0BCh, 0Bh, 5Ah
		db 0DCh,   1, 3Dh, 60h,	  7, 7Dh,0B8h, 0Eh,0BDh, 80h,	6
		db 0EBh,0B1h,	1,0F0h,	7Fh,   1,0FDh, 81h,   0, 7Dh,0F8h
		db    0, 81h,0B8h,   0,	7Eh, 30h,   1,	 0, 41h,   3,0FBh
		db  7Fh,   7,0F7h,0B1h,	30h,   2, 40h, 7Eh,0F0h,0E0h,0FCh
		db 0E0h, 60h,0CDh,0E0h,0F0h, 45h,0C0h,0FCh
;
PLAYER_2GUN_DIE:db    0,   0,	0,   0,	  0,   0,   0,	 0,0E0h,   0,	1
		db 0A0h,   0,	6, 80h,	  0,   7,   0,	 0, 0Ah,   0,	0
		db  0Ch,0E0h,	0, 5Dh,0F0h,   6,0DDh, 80h, 0Ch,0BDh, 78h
		db    9,0BDh, 78h, 1Bh,	5Bh, 78h, 16h, 71h,0B8h,   2,0FAh
		db 0D7h, 0Eh,0FBh, 6Dh,	1Eh, 7Bh, 14h, 0Ch, 77h, 68h,	1
		db  86h, 70h,	1,0FEh,0C0h,   1,0FEh,	 0,   1,0FCh,	0
		db    0,0FCh,	0,   2,	  0,   2,   3,0FCh,   2,   3,0F8h
		db 0D6h,   7,0F3h, 5Dh,	  7,0E7h, 95h,	 7, 4Fh,0EBh, 0Ah
		db    2,0DFh, 10h,   0,	5Eh,   0,   0, 16h
;
Pneumo_Hammer:	db 11111111b,11110101b,01010101b
		db 11000000b,00000000b,00000010b
		db 11011111b,11111110b,10101001b
		db 11000000b,00000000b,00000010b
		db 11111111b,11010101b,01010101b
		db 00000000b,00000000b,00000000b
		db 00000000b,00110100b,00000000b
		db 00000000b,00111000b,00000000b
		db 00000000b,00110100b,00000000b
		db 00000000b,00111000b,00000000b
		db 00000000b,00110100b,00000000b
		db 00000000b,00111000b,00000000b
		db 00000000b,00110100b,00000000b
		db 00000000b,00111000b,00000000b
		db 00000000b,00110100b,00000000b
		db 00000000b,00111000b,00000000b
		db 00000000b,00000000b,00000000b
		db 00000001b,01101010b,10000000b
		db 00000010b,11111101b,01000000b
		db 00000110b,11111110b,10100000b
		db 00001101b,11111101b,01010000b
		db 00011011b,11111110b,10101000b
		db 00111011b,11111101b,01010100b
		db 00000000b,00000000b,00000000b
		db 11101111b,11111101b,01010101b
		db 11101111b,11111110b,10101010b
		db 11101111b,11111101b,01010101b
		db 11101111b,11111110b,10101010b
		db 11101111b,11111101b,01010101b
		db 11101111b,11111110b,10101010b
		db 11101111b,11111101b,01010101b
		db 11101111b,11101010b,10101010b
;
SPRITES:	db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	7
		db  6Ch, 1Eh,	1, 35h,0C0h, 44h, 10h, 4Eh,   0, 9Eh,	0
		db  9Ch,   0,0FCh,   0,0FEh,   0,0FFh,	 0,0FFh,   0, 7Eh
		db    0, 7Ch, 10h, 3Dh,0C0h, 1Eh,   1,	 7, 6Ch,   7, 68h
		db  1Eh,   4, 35h,0C1h,	44h,   0, 4Eh, 10h, 9Eh,   0, 9Ch
		db    0,0FCh,	0,0FEh,	  0,0FFh,   0,0FFh,   0, 7Eh, 10h
		db  7Ch,   0, 3Dh,0C1h,	1Eh,   4,   7, 68h,   7, 60h, 1Eh
		db  0Ch, 35h, 80h, 44h,	41h, 4Eh,   0, 9Eh, 10h, 9Ch,	0
		db 0FCh,   0,0FEh,   0,0FFh,   0,0FFh, 10h, 7Eh,   0, 7Ch
		db  41h, 3Dh, 80h, 1Eh,	0Ch,   7, 60h,	 7, 68h, 1Eh,	4
		db  35h,0C1h, 44h,   0,	4Eh, 10h, 9Eh,	 0, 9Ch,   0,0FCh
		db    0,0FEh,	0,0FFh,	  0,0FFh,   0, 7Eh, 10h, 7Ch,	0
		db  3Dh,0C1h, 1Eh,   4,	  7, 68h,   0,	 0,   2, 40h,	7
		db 0E0h, 12h, 48h, 38h,	1Ch, 11h,   8, 42h, 80h,0E5h, 24h
		db  4Bh,0CEh,	5,0A4h,	23h, 80h, 70h, 10h, 24h,0B8h, 0Fh
		db 0D0h,   4, 80h,   0,	  0,   0,   0,	 2, 40h,   5,0A0h
		db  12h, 48h, 28h, 14h,	10h,   8, 40h, 80h,0A2h,0C4h, 45h
		db  8Ah,   2, 84h, 20h,	  0, 50h, 10h, 24h,0A8h, 0Bh, 50h
		db    4, 80h,	0,   0,	  0,   0,   2, 40h,   5,0A0h, 10h
		db    8, 20h,	4, 10h,	  8, 41h, 80h, 83h,   4, 41h, 82h
		db    1,   4, 20h,   0,	40h,   0, 20h, 28h, 0Bh, 50h,	4
		db  80h,   0,	0,   0,	  0,   2, 40h,	 1, 20h,   0,	0
		db  20h,   4, 10h,   8,	  0,   0, 81h,	 0, 41h, 82h,	0
		db    4,   0,	0, 40h,	  0, 20h,   8,	 2, 50h,   4, 80h
		db    0,   0,	0,   0,	  0,   0,   1, 20h,   0,   0,	0
		db    0, 10h,	8,   0,	  0,   0,   0, 40h,   0,   0,	4
		db    0,   0,	0,   0,	20h,   0,   2, 50h,   4,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	1
		db    2,0BEh, 37h, 7Fh,0F6h,0BFh, 37h, 7Fh,   2,0BEh,	0
		db    1,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   3,	0,   7,	  0, 0Fh,   0, 1Eh,   0,   1,	2
		db 0BEh, 37h, 7Fh,0F6h,0BFh, 37h, 7Fh,	 2,0BEh,   0,	1
		db    0, 1Eh,	0, 0Fh,	  0,   7,   0,	 3,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    1,   0,	3, 80h,	  1,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   1,	 0,   1,   0,	3
		db  80h, 0Fh,0E0h,   3,	80h,   1,   0,	 1,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   1,	0,   1,	  0,   1,   0,	 5, 40h,   3, 80h
		db  3Fh,0F8h,	3, 80h,	  5, 40h,   1,	 0,   1,   0,	1
		db    0,   0,	0,   0,	  0,   0,   0,	 1,   0,   0,	0
		db    1,   0, 11h, 10h,	  1,   0,   5, 40h,   3, 80h,0BFh
		db 0FAh,   3, 80h,   5,	40h,   1,   0, 11h, 10h,   1,	0
		db    0,   0,	1,   0,	  0,   0,   7,0E0h, 1Fh,0F8h, 33h
		db 0F4h, 6Fh,0FAh, 5Fh,0FEh,0DFh,0FDh,0FFh,0FBh,0FFh,0FEh
		db 0FFh,0FDh,0FFh,0FEh,0FFh,0FDh, 7Fh,0FAh, 7Fh,0FEh, 3Fh
		db 0F4h, 1Fh,0F8h,   7,0E0h,   0,   0,	 3,0C0h, 0Fh,0F0h
		db  19h,0E8h, 37h,0F4h,	2Fh,0FAh, 6Fh,0F4h, 7Fh,0FAh, 7Fh
		db 0F4h, 7Fh,0FAh, 3Fh,0F4h, 3Fh,0FCh, 1Fh,0E8h, 0Fh,0F0h
		db    3,0C0h,	0,   0,	  0,   0,   0,	 0,   1, 80h,	7
		db 0E0h, 0Ch,0D0h, 1Bh,0E8h, 17h,0F8h, 37h,0F4h, 3Fh,0F8h
		db  1Fh,0F4h, 1Fh,0E8h,	0Fh,0F0h,   7,0E0h,   1, 80h,	0
		db    0,   0,	0,   0,	  0,   3,0C0h, 0Fh,0F0h, 19h,0E8h
		db  37h,0F4h, 2Fh,0FAh,	6Fh,0F4h, 7Fh,0FAh, 7Fh,0F4h, 7Fh
		db 0FAh, 3Fh,0F4h, 3Fh,0FCh, 1Fh,0E8h, 0Fh,0F0h,   3,0C0h
		db    0,   0,0BCh,   0,	3Dh, 80h,   1,0B8h,   0, 34h,	3
		db 0BAh, 1Bh,0BEh, 5Bh,0BDh,0DBh,0BEh,0DBh,0BDh, 5Bh,0BFh
		db  1Bh,0BCh,	3,0BAh,	  0, 34h,   1,0B8h, 3Dh, 80h,0BCh
		db    0,   0,	0,0BDh,	80h, 3Dh,0B8h,	 0, 34h,   3,0BAh
		db  1Bh,0BEh, 5Bh,0BDh,0DBh,0BEh,0DBh,0BDh, 5Bh,0BFh, 1Bh
		db 0BCh,   3,0BAh,   0,	34h, 3Dh,0B8h,0BDh, 80h,   0,	0
		db    0,   0,	1, 80h,0BDh,0B8h, 3Ch, 34h,   3,0BAh, 1Bh
		db 0BEh, 5Bh,0BDh,0DBh,0BEh,0DBh,0BDh, 5Bh,0BFh, 1Bh,0BCh
		db    3,0BAh, 3Ch, 34h,0BDh,0B8h,   1, 80h,   0,   0,	0
		db    0,0BDh, 80h, 3Dh,0B8h,   0, 34h,	 3,0BAh, 1Bh,0BEh
		db  5Bh,0BDh,0DBh,0BEh,0DBh,0BDh, 5Bh,0BFh, 1Bh,0BCh,	3
		db 0BAh,   0, 34h, 3Dh,0B8h,0BDh, 80h,	 0,   0,   0,	0
		db    0,   7,	1, 6Fh,	  0, 1Fh,   0, 3Fh,   0,   1,	2
		db 0FEh, 36h,0FFh,0F6h,0C0h, 36h,0FFh,	 2,0FEh,   0,	1
		db    0, 3Fh,	0, 1Fh,	  1, 6Fh,   0,	 7,   0,   0,	0
		db    7,   0,0AFh,   0,	1Fh,   0, 3Fh,	 0,   1,   2,0FEh
		db  36h,0FFh,0F6h,0C0h,	36h,0FFh,   2,0FEh,   0,   1,	0
		db  3Fh,   0, 1Fh,   0,0AFh,   0,   7,	 0,   0,   0,	7
		db    0, 4Fh,	0, 1Fh,	  0, 3Fh,   0,	 1,   2,0FEh, 36h
		db 0FFh,0F6h,0C0h, 36h,0FFh,   2,0FEh,	 0,   1,   0, 3Fh
		db    0, 1Fh,	0, 4Fh,	  0,   7,   0,	 0,   0,   7,	0
		db 0AFh,   0, 1Fh,   0,	3Fh,   0,   1,	 2,0FEh, 36h,0FFh
		db 0F6h,0C0h, 36h,0FFh,	  2,0FEh,   0,	 1,   0, 3Fh,	0
		db  1Fh,   0,0AFh,   0,	  7,   0,   0,	 0,   0,   0, 60h
		db    1,0A0h,	6, 10h,	18h, 10h, 60h, 10h, 80h,   8,	0
		db    8,   0,	9,   0,	0Ah,   0,   6,	 0,   4,   0,	0
		db    0,   0,	0,   0,	  4,   0, 0Ch,	 0, 0Ah,   0, 12h
		db    0, 22h,	0, 21h,	  0, 41h,   1, 81h,   2, 81h,	4
		db    0, 88h,	0, 88h,	  0, 90h,   0, 60h,   0, 40h,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0, 10h, 80h, 10h,	40h, 28h, 20h, 28h, 10h, 28h, 0Ch
		db  44h,   2, 44h,   1,	82h,   0, 82h,	 0,   3,   0,	1
		db    0,   1, 20h,   0,	30h,   0, 30h,	 0, 48h,   0, 48h
		db    0, 44h,	0, 44h,	  0, 42h,   1, 82h,   6, 81h, 18h
		db  81h, 60h, 80h, 80h,	80h,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0, 10h,	 0, 18h,   0, 28h
		db  80h, 24h, 40h, 42h,	20h, 42h, 10h, 41h,   8, 80h,	4
		db  80h,   3,	0,   1,	  0,   0,   0,	 0,   0,   0,	0
		db    0, 20h,	0, 30h,	  0, 50h,   0, 48h,   0, 88h,	0
		db  84h,   0, 82h,   1,	  2,   1,   1, 82h,   0, 42h,	0
		db  42h,   0, 24h,   0,	14h,   0, 18h,	 0,   8,   0,	2
		db    0,   5,	0,   9,	  0, 10h, 81h, 20h, 81h, 40h, 41h
		db  80h, 42h,	0, 22h,	  0, 24h,   0, 14h,   0, 14h,	0
		db    8,   0,	8,   0,	  0,   0,   0,	 0,   0,   1,	0
		db  82h, 80h, 84h, 40h,	44h, 20h, 48h, 10h, 48h, 10h, 50h
		db    8, 30h,	4, 20h,	  2,   0,   1,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0, 30h,	0
		db 0F8h,   3,0CCh, 0Dh,0B6h, 31h,0B7h,0C1h,0CEh, 7Fh,0FCh
		db    2,0AEh,	2,0AEh,	7Fh,0FCh,0C1h,0CEh, 31h,0B7h, 0Dh
		db 0B6h,   3,0CCh,   0,0F8h,   0, 30h,	 0,   3,   0,	7
		db    0, 4Fh,	2,0DFh,	  0,   0,   0, 3Eh, 6Fh, 7Fh,0E9h
		db  7Fh,0E9h, 7Fh, 6Fh,	7Fh,   0, 3Eh,	 0,   0,   2,0DFh
		db    0, 4Fh,	0,   7,	  0,   3,   0,	 3,   0,   7,	0
		db  4Fh,   2,0DFh,   0,	  0,   0, 3Eh, 6Fh, 7Fh,0E9h, 7Fh
		db 0E9h, 7Fh, 6Fh, 7Fh,	  0, 3Eh,   0,	 0,   2,0DFh,	0
		db  4Fh,   0,	7,   0,	  3,   0,   3,	 0,   7,   0, 4Fh
		db    2,0DFh,	0,   0,	  0, 3Eh, 6Fh, 7Fh,0EFh, 7Fh,0EFh
		db  7Fh, 6Fh, 7Fh,   0,	3Eh,   0,   0,	 2,0DFh,   0, 4Fh
		db    0,   7,	0,   3,	  0,   3,   0,	 7,   0, 4Fh,	2
		db 0DFh,   0,	0,   0,	3Eh, 6Fh, 7Fh,0EFh, 7Fh,0EFh, 7Fh
		db  6Fh, 7Fh,	0, 3Eh,	  0,   0,   2,0DFh,   0, 4Fh,	0
		db    7,   0,	3,   0,	  3,   3, 87h,	 6, 8Fh, 0Ch, 9Fh
		db  18h,0BFh, 10h, 80h,	5Fh,0B8h,0D0h,0BBh,0D0h,0BBh, 5Fh
		db 0B8h, 10h, 80h, 18h,0BFh, 0Ch, 9Fh,	 6, 8Fh,   3, 87h
		db    0,   3,	0,   3,	  3, 87h,   6, 8Fh, 0Ch, 9Fh, 18h
		db 0BFh, 10h, 80h, 5Fh,0B8h,0D0h,0BBh,0D0h,0BBh, 5Fh,0B8h
		db  10h, 80h, 18h,0BFh,	0Ch, 9Fh,   6, 8Fh,   3, 87h,	0
		db    3,   0,	3,   3,	87h,   6, 8Fh, 0Ch, 9Fh, 18h,0BFh
		db  10h, 80h, 5Fh,0B8h,0D0h,0BBh,0D0h,0BBh, 5Fh,0B8h, 10h
		db  80h, 18h,0BFh, 0Ch,	9Fh,   6, 8Fh,	 3, 87h,   0,	3
		db    0,   3,	3, 87h,	  6, 8Fh, 0Ch, 9Fh, 18h,0BFh, 10h
		db  80h, 5Fh,0B8h,0D0h,0BBh,0D0h,0BBh, 5Fh,0B8h, 10h, 80h
		db  18h,0BFh, 0Ch, 9Fh,	  6, 8Fh,   3, 87h,   0,   3
;
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0
;
