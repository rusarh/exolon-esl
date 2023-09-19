	;sna header
	;    0        1      byte   I
	;    1        8      word   HL',DE',BC',AF'
	;    9        10     word   HL,DE,BC,IY,IX
	;    19       1      byte   Interrupt (bit 2 contains IFF2, 1=EI/0=DI)
	;    20       1      byte   R
	;    21       4      words  AF,SP
	;    25       1      byte   IntMode (0=IM0/1=IM1/2=IM2)
	;    26       1      byte   BorderColor (0..7, not used by Spectrum 1.7)
	;    27       49152  bytes  RAM dump 16384..65535
	org 	0x4000-27
	db 	0x3f
	dw 	0,0,0,0
	dw 	0,0,0,0,0
	db 	0
	db 	0
	dw 	0,_stack
	db 	1
	db 	3
	.assert	$==0x4000


	ORG	0x4000
SCRLINE000:
	db	0
SCRLINE136	equ	0x5020
	ORG	0x5800
ATTR_TABLE:
	db   	0

	ORG	0x5b00
over_player_tab:
; 		db q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q
; 					; DATA XREF: RAM:777F o	RAM:79DD o ...
; 		db q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,_,_,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,_,_,_,_,_,_,_,_,_,_,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; 		db q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q
; ;
; ;

; 		db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh ; unused !!!
; 		db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,	 0
; 		db    0, 2Ch,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0, 35h, 30h
;
		ORG	0x5e00
ATTR_TABLE_COPY:
	 	db 	0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 					; DATA XREF: getATTR_TABLE_COPY_for_XY+12 o
; 					; sub_82FC+25 o	...
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,46h,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  6,	 6,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,44h,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,43h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,43h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,43h,45h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,47h,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,43h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,45h,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,43h,45h,45h,45h,45h,45h,45h,45h,45h,45h,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0
; 		db   0,	 0,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h,42h
; ?
; 		db  42h, 42h, 42h, 42h,	42h, 42h, 42h, 42h,   0,   0
;array 32x24
;=0 - empty
;=1 - not empty, player	can't walk
;=xx - animation code
		ORG	0x6100
no_walk_tab: 	db 	0
; 		db _,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_
; 					; DATA XREF: starsAnimationStep+34 o
; 					; getNowalkAddrForXY+12 o ...
; 		db _,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_ ; ?AnimationTab?
; 		db _,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,z,z,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,z,z,z,z,z,z,z,z,z,z,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; 		db _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_
; ;
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 0 ;	unused tail (round to xx00)
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 16
; 		db    0,   0,	1,   1,	  1,   1,   1,	 1,   1,   1,	1,   1,	  1,   1,   1,	 1; 32
; 		db    1,   1,	1,   1,	  1,   1,   1,	 1,   1,   1,	1,   1,	  1,   1,   0,	 0; 48
;
		ORG	0x6400
bitSwapTab:
		db 	0
; 		db    0, 80h, 40h,0C0h,	20h,0A0h, 60h,0E0h, 10h, 90h, 50h,0D0h,	30h,0B0h, 70h,0F0h
; 					; DATA XREF: initBitSwapTab o
; 		db    8, 88h, 48h,0C8h,	28h,0A8h, 68h,0E8h, 18h, 98h, 58h,0D8h,	38h,0B8h, 78h,0F8h ; swapped bits
; 		db    4, 84h, 44h,0C4h,	24h,0A4h, 64h,0E4h, 14h, 94h, 54h,0D4h,	34h,0B4h, 74h,0F4h ; 01234567 -> 76543210
; 		db  0Ch, 8Ch, 4Ch,0CCh,	2Ch,0ACh, 6Ch,0ECh, 1Ch, 9Ch, 5Ch,0DCh,	3Ch,0BCh, 7Ch,0FCh
; 		db    2, 82h, 42h,0C2h,	22h,0A2h, 62h,0E2h, 12h, 92h, 52h,0D2h,	32h,0B2h, 72h,0F2h
; 		db  0Ah, 8Ah, 4Ah,0CAh,	2Ah,0AAh, 6Ah,0EAh, 1Ah, 9Ah, 5Ah,0DAh,	3Ah,0BAh, 7Ah,0FAh
; 		db    6, 86h, 46h,0C6h,	26h,0A6h, 66h,0E6h, 16h, 96h, 56h,0D6h,	36h,0B6h, 76h,0F6h
; 		db  0Eh, 8Eh, 4Eh,0CEh,	2Eh,0AEh, 6Eh,0EEh, 1Eh, 9Eh, 5Eh,0DEh,	3Eh,0BEh, 7Eh,0FEh
; 		db    1, 81h, 41h,0C1h,	21h,0A1h, 61h,0E1h, 11h, 91h, 51h,0D1h,	31h,0B1h, 71h,0F1h
; 		db    9, 89h, 49h,0C9h,	29h,0A9h, 69h,0E9h, 19h, 99h, 59h,0D9h,	39h,0B9h, 79h,0F9h
; 		db    5, 85h, 45h,0C5h,	25h,0A5h, 65h,0E5h, 15h, 95h, 55h,0D5h,	35h,0B5h, 75h,0F5h
; 		db  0Dh, 8Dh, 4Dh,0CDh,	2Dh,0ADh, 6Dh,0EDh, 1Dh, 9Dh, 5Dh,0DDh,	3Dh,0BDh, 7Dh,0FDh
; 		db    3, 83h, 43h,0C3h,	23h,0A3h, 63h,0E3h, 13h, 93h, 53h,0D3h,	33h,0B3h, 73h,0F3h
; 		db  0Bh, 8Bh, 4Bh,0CBh,	2Bh,0ABh, 6Bh,0EBh, 1Bh, 9Bh, 5Bh,0DBh,	3Bh,0BBh, 7Bh,0FBh
; 		db    7, 87h, 47h,0C7h,	27h,0A7h, 67h,0E7h, 17h, 97h, 57h,0D7h,	37h,0B7h, 77h,0F7h
; 		db  0Fh, 8Fh, 4Fh,0CFh,	2Fh,0AFh, 6Fh,0EFh, 1Fh, 9Fh, 5Fh,0DFh,	3Fh,0BFh, 7Fh,0FFh
;
		ORG	0x6500
Y2SCR_HI:
		db 	0

; 		db  40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h, 40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h
; 					; DATA XREF: InitScrAddtTables+2 o
; 		db  40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h, 40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h
; 		db  40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h, 40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h
; 		db  40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h, 40h, 41h, 42h, 43h,	44h, 45h, 46h, 47h
; 		db  48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh, 48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh
; 		db  48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh, 48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh
; 		db  48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh, 48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh
; 		db  48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh, 48h, 49h, 4Ah, 4Bh,	4Ch, 4Dh, 4Eh, 4Fh
; 		db  50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h, 50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h
; 		db  50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h, 50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h
; 		db  50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h, 50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h
; 		db  50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h, 50h, 51h, 52h, 53h,	54h, 55h, 56h, 57h
; ;
; 		db    1,   5,	0,0EDh,0B0h, 3Eh,   9, 32h, 7Ah, 8Eh, 3Ah,0F0h,	71h,0B7h,0C2h, 45h ; unused tail (round	to xx00)
; 		db  71h,0CDh, 4Bh,0B0h,0CDh,0F5h, 8Dh,0CDh,   3, 8Eh,	1, 1Fh,	  0,0EDh,0B0h, 21h
; 		db  17h, 6Eh,0CDh, 2Bh,0AFh,0CDh, 90h, 6Fh,0CDh,0ECh,0B6h, 3Ah,	67h, 7Dh,0B7h, 28h
; 		db  10h,0AFh, 32h, 67h,	7Dh, 3Ah, 16h, 6Eh,0B7h, 20h,	6, 21h,0A3h, 7Dh,0CDh, 17h
;
		ORG	0x6600
Y2SCR_LO:
		db 	0
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0, 20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h
; 					; DATA XREF: InitScrAddtTables+6 o
; 		db  40h, 40h, 40h, 40h,	40h, 40h, 40h, 40h, 60h, 60h, 60h, 60h,	60h, 60h, 60h, 60h
; 		db  80h, 80h, 80h, 80h,	80h, 80h, 80h, 80h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h
; 		db 0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0, 20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h
; 		db  40h, 40h, 40h, 40h,	40h, 40h, 40h, 40h, 60h, 60h, 60h, 60h,	60h, 60h, 60h, 60h
; 		db  80h, 80h, 80h, 80h,	80h, 80h, 80h, 80h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h
; 		db 0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h
; 		db    0,   0,	0,   0,	  0,   0,   0,	 0, 20h, 20h, 20h, 20h,	20h, 20h, 20h, 20h
; 		db  40h, 40h, 40h, 40h,	40h, 40h, 40h, 40h, 60h, 60h, 60h, 60h,	60h, 60h, 60h, 60h
; 		db  80h, 80h, 80h, 80h,	80h, 80h, 80h, 80h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h,0A0h
; 		db 0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h,0E0h
; ;
; 		db  4Fh, 4Eh, 20h, 43h,	4Fh, 50h, 59h, 52h, 49h, 47h, 48h, 54h,	20h, 31h, 39h, 38h ; unused tail (round	to xx00)
; 		db  37h, 20h, 48h, 45h,	57h, 53h, 4Fh, 4Eh,0FFh,0F5h,0C5h,0D5h,0E5h,0FDh,0E5h,0FDh
; 		db  21h, 81h,0B1h, 21h,	5Eh, 6Fh, 5Eh,0CBh, 7Bh, 28h,	7,0FDh,0E1h,0E1h,0D1h,0C1h
; 		db 0F1h,0C9h,0E5h, 23h,	56h, 23h, 7Eh,0B7h, 20h, 34h,0CDh, 36h,0ADh,0E6h, 1Eh, 5Fh
;
		ORG	0x6700
scr_addr_8:	
		db 	0
; 		dw  4008h, 4108h, 4208h, 4308h,	4408h, 4508h, 4608h, 4708h, 4028h, 4128h, 4228h, 4328h,	4428h, 4528h, 4628h, 4728h
; 					; DATA XREF: InitScrAddtTables+21 o
; 		dw  4048h, 4148h, 4248h, 4348h,	4448h, 4548h, 4648h, 4748h, 4068h, 4168h, 4268h, 4368h,	4468h, 4568h, 4668h, 4768h ; unused !!!
; 		dw  4088h, 4188h, 4288h, 4388h,	4488h, 4588h, 4688h, 4788h, 40A8h, 41A8h, 42A8h, 43A8h,	44A8h, 45A8h, 46A8h, 47A8h
; 		dw  40C8h, 41C8h, 42C8h, 43C8h,	44C8h, 45C8h, 46C8h, 47C8h, 40E8h, 41E8h, 42E8h, 43E8h,	44E8h, 45E8h, 46E8h, 47E8h
; 		dw  4808h, 4908h, 4A08h, 4B08h,	4C08h, 4D08h, 4E08h, 4F08h, 4828h, 4928h, 4A28h, 4B28h,	4C28h, 4D28h, 4E28h, 4F28h
; 		dw  4848h, 4948h, 4A48h, 4B48h,	4C48h, 4D48h, 4E48h, 4F48h, 4868h, 4968h, 4A68h, 4B68h,	4C68h, 4D68h, 4E68h, 4F68h
; 		dw  4888h, 4988h, 4A88h, 4B88h,	4C88h, 4D88h, 4E88h, 4F88h, 48A8h, 49A8h, 4AA8h, 4BA8h,	4CA8h, 4DA8h, 4EA8h, 4FA8h
; 		dw  48C8h, 49C8h, 4AC8h, 4BC8h,	4CC8h, 4DC8h, 4EC8h, 4FC8h, 48E8h, 49E8h, 4AE8h, 4BE8h,	4CE8h, 4DE8h, 4EE8h, 4FE8h
; 		dw  5008h, 5108h, 5208h, 5308h,	5408h, 5508h, 5608h, 5708h, 5028h, 5128h, 5228h, 5328h,	5428h, 5528h, 5628h, 5728h
; 		dw  5048h, 5148h, 5248h, 5348h,	5448h, 5548h, 5648h, 5748h, 5068h, 5168h, 5268h, 5368h,	5468h, 5568h, 5668h, 5768h
; 		dw  5088h, 5188h, 5288h, 5388h,	5488h, 5588h, 5688h, 5788h, 50A8h, 51A8h, 52A8h, 53A8h,	54A8h, 55A8h, 56A8h, 57A8h
; 		dw  50C8h, 51C8h, 52C8h, 53C8h,	54C8h, 55C8h, 56C8h, 57C8h, 50E8h, 51E8h, 52E8h, 53E8h,	54E8h, 55E8h, 56E8h, 57E8h
;
; UNUSED??????:	db  1Dh, 9Dh, 21h, 68h,	7Dh,0CCh, 17h, 7Dh,0C3h,0A1h, 6Dh, 3Fh,	7Ah,0FFh,0FFh, 53h
; 		db  50h, 41h, 43h, 45h,	7Ah,0FBh,0FFh, 45h, 4Eh, 54h, 45h, 52h,	7Ah,0FBh,0FFh, 43h
; 		db  41h, 50h, 53h, 20h,	53h, 48h, 49h, 46h, 54h, 7Ah,0F6h,0FFh,	53h, 59h, 4Dh, 42h
; 		db  4Fh, 4Ch, 20h, 53h,	48h, 49h, 46h, 54h, 7Ah,0F4h,0FFh,   0,	  0,   0,   0,	 0
; 		db  5Ah, 4Fh, 52h, 42h,	41h,0DFh,   0,	 8,0E3h,0FFh, 70h,0E0h,	46h,0DFh,   6,	 7
; 		db 0E6h,0E0h,0D7h, 53h,	45h, 4Ch, 45h, 43h, 54h, 20h, 4Bh, 45h,	59h, 20h, 46h, 4Fh
; 		db  52h, 2Eh, 2Eh, 2Eh,	2Eh,0DEh, 7Bh,0EEh, 4Ch, 45h, 46h, 54h,	7Ah,0FCh, 52h, 49h
; 		db  47h, 48h, 54h, 7Ah,0FBh, 4Ah, 55h, 4Dh, 50h, 7Ah,0FCh, 44h,	55h, 43h, 4Bh, 7Ah
; 		db 0FCh, 46h, 49h, 52h,	45h, 70h,   4,0E5h,   9, 20h,0DFh, 17h,	  2,0D9h, 45h, 58h
; 		db  4Fh, 4Ch, 4Fh, 4Eh,	20h, 43h, 4Fh, 50h, 59h, 52h, 49h, 47h,	48h, 54h, 20h, 31h
; 		db  39h, 38h, 37h, 20h,	48h, 45h, 57h, 53h, 4Fh, 4Eh,0FFh,0E6h,0E0h,0D7h,0FFh,0E6h
; 		db 0B0h,0E6h,0E0h, 47h,0DEh,   0,   1,	 2,   3,   4,	5,   6,	  7,0A7h,0DDh,	 8
; 		db    9, 0Ah, 0Bh, 0Ch,	0Dh, 0Eh, 0Fh,0A7h,0D5h, 10h, 11h, 12h,	13h, 14h, 15h, 16h
; 		db  17h, 76h,	0,0DEh,	18h, 19h, 1Ah, 1Bh, 1Ch, 1Dh, 1Eh, 1Fh,0A7h,0DDh, 20h, 21h
; 		db  22h, 23h, 24h, 25h,	26h, 27h,0A7h,0D5h, 28h, 29h, 2Ah, 2Bh,	2Ch, 2Dh, 2Eh, 2Fh
; 		db  79h,0F2h, 30h, 31h,0FFh,0AFh, 32h,0F0h, 71h, 0Eh, 44h,0CDh,	4Dh,0B0h, 21h, 8Dh
; 		db  71h,0CDh, 2Bh,0AFh,	21h,0F1h, 71h, 22h, 88h, 75h,	1,0C0h,	  3, 21h,0E0h,0D7h
; 		db  22h,0EFh,0ADh,0C5h,	  0,   0,   0, 79h,0E6h, 0Fh,0B7h,   1,	  0,   4,0C4h,0B7h
; 		db 0B0h,0CCh, 68h, 75h,0CDh, 22h, 75h,0C1h, 0Bh, 78h,0B1h,0CAh,0A1h, 6Dh,0CDh,0D1h
; 		db 0ACh,0B7h,0CAh, 63h,	71h,0FEh, 31h,0CAh, 8Ah, 75h,0C3h,0A1h,	6Dh,0DFh,   0,	 8
; 		db 0E3h,0FFh, 70h,0E0h,	43h,0E6h,0E0h,0D7h,0DFh,   4, 10h,0E1h,	13h, 20h, 20h, 20h
; 		db  20h, 20h, 20h, 20h,	20h,0A7h,0E2h,0DFh,   0,   0,0E3h,   7,	8Ah,0DFh,   1,	 5
; 		db 0E3h, 71h, 86h,0DFh,	  5,   3,0E3h,	 7, 8Ah,0DFh, 0Ah,   0,0E3h, 4Fh, 86h,0DFh
; 		db  10h,   4,0E3h, 71h,	86h,0DFh, 13h,	 1,0E3h, 9Dh, 8Ah,0DFh,	  0, 1Ah,0E3h, 4Fh
; 		db  86h,0DFh,	5, 1Ah,0E3h, 75h, 8Ah,0DFh,   9, 1Ch,0E3h, 85h,	8Ah,0DFh, 0Eh, 1Ah
; 		db 0E3h, 9Dh, 8Ah,0DFh,	12h, 1Eh,0E3h, 71h, 86h,0DFh, 15h, 1Ah,0E3h,   7, 8Ah,0FFh
; 		db    0, 52h, 41h, 46h,	46h, 41h, 45h, 4Ch, 45h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 53h, 55h, 52h,	59h, 41h, 4Eh, 49h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 53h, 43h, 52h,	41h, 47h, 47h, 59h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 53h, 41h, 42h,	41h, 54h, 54h, 41h, 21h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 50h, 41h, 44h,	44h, 59h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ch, 4Fh, 46h,	54h, 59h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ah, 49h, 4Dh,	42h, 4Fh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ch, 45h, 4Fh,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 47h, 4Ch, 45h,	4Eh, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Dh, 4Fh, 52h,	41h, 4Eh, 47h, 45h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 50h, 55h, 50h,	50h, 59h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Fh, 4Eh, 49h,	4Fh, 4Eh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 52h, 49h, 50h,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 46h, 49h, 47h,	41h, 52h, 4Fh, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 49h, 4Eh, 4Bh,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 50h, 45h, 4Eh,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 44h, 55h, 4Dh,	42h, 4Fh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Dh, 45h, 50h,	48h, 49h, 53h, 54h, 4Fh, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 51h, 55h, 45h,	45h, 4Eh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 55h, 4Eh, 59h,	49h, 4Ch, 20h, 3Fh, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 45h, 51h, 55h,	49h, 4Eh, 4Fh, 58h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 52h, 45h, 41h,	4Ch, 4Dh, 53h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Dh, 41h, 4Ah,	41h, 4Ch, 41h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ch, 45h, 4Eh,	47h, 4Bh, 41h, 50h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ah, 41h, 5Ah,	5Ah, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 48h, 45h, 57h,	53h, 4Fh, 4Eh, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 54h, 49h, 4Dh,	2Eh, 4Dh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 43h, 45h, 43h,	43h, 4Fh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ch, 55h, 43h,	59h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 41h, 4Eh, 54h,	4Fh, 4Eh, 59h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Eh, 49h, 41h,	45h, 52h, 45h, 48h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 2Ah, 21h, 2Fh,	3Fh, 21h, 40h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 50h, 4Fh, 44h,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 48h, 55h, 54h,	4Eh, 45h, 45h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 42h, 55h, 54h,	4Eh, 45h, 45h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Ah, 4Fh, 48h,	4Eh, 2Eh, 4Fh, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 43h, 41h, 52h,	52h, 4Fh, 54h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 43h, 4Fh, 4Ch,	49h, 4Eh, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 46h, 4Ch, 41h,	53h, 48h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 53h, 45h, 56h,	49h, 4Ch, 4Ch, 45h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 54h, 2Dh, 53h,	54h, 41h, 54h, 45h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 43h, 4Ch, 55h,	42h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 48h, 57h, 50h,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 43h, 44h, 50h,	20h, 20h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 54h, 41h, 43h,	48h, 59h, 4Fh, 4Eh, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 4Bh, 49h, 4Ch,	4Ch, 45h, 52h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 44h, 52h, 4Fh,	4Fh, 50h, 59h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 52h, 20h, 34h,	20h, 53h, 20h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 52h, 5Ah, 41h,	53h, 4Dh, 32h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h, 48h, 55h, 4Dh,	50h, 54h, 59h, 20h, 20h, 20h, 20h, 30h,	30h, 31h, 30h, 30h
; 		db  30h,0FFh,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0
; 		db    0,   0,0C5h,0EDh,	73h,0DAh, 78h, 31h, 40h, 67h,	1,0B2h,	  8,0D1h,0E1h, 22h
; ; ---------------------------------------------------------------------------
; ; START	OF FUNCTION CHUNK FOR CheckGameRestart7890
	include	"defs.asm"

		ORG	0x6D60
START:					; CODE XREF: CheckGameRestart7890+7 j
					; RAM:A04C j ...
		.assert START==0x6d60

		di
		ld	sp, 0
		ld	a, (0x386E) ; ZX48 - FF, ZX128 - 37
		sub	0FFh
		ld	(FlagZX128), a	; 00 - zx48
;
		xor	a
		out	(0FEh),	a
;
		ld	(Die_Animation_Step), a
		ld	(SuperShieldFlag), a
		ld	(_ZONE), a
;
		ld	hl, 0
		ld	(addBonusCount), hl
;
		inc	a
		ld	(flag_BeeperMenuMusic),	a ; play beeper	music first time only
;
		call	InitScrAddtTables
		call	initBitSwapTab
;
		ld	hl, points	; "000000"
		ld	de,  points+1
		ld	(hl), '0'
		ld	bc, 5
		ldir
;
		ld	a, 9
		ld	(LIVES?), a
;
		ld	a, (HiScoreUpdatedFlag)
		or	a
		jp	nz, ShowHiscoreTable

xmenu:					; CODE XREF: CheckGameRestart7890-29D6 j
					; CheckGameRestart7890-29C1 j ...
		call	ClearToBLACK
		call	clr_no_walk_tab
		call	clr_over_player_tab
		ld	bc, 31		; force	last line to
		ldir
;
		ld	hl, xMSG_MENU
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
;
		call	highLightSelectedContorol
		call	Init_AY_Music?
;
		ld	a, (flag_BeeperMenuMusic)
		or	a
		jr	z, skipBeeperMenuMsic
;
		xor	a
		ld	(flag_BeeperMenuMusic),	a
;
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, skipBeeperMenuMsic
;
		ld	hl, menuMusic
		call	playBeeperMusic

skipBeeperMenuMsic:			; CODE XREF: CheckGameRestart7890-2C5Aj
					; CheckGameRestart7890-2C50j
		call	_save_attr_table
		call	clr_Sprite_BUFFER???
		call	clearStarsData
;
		ld	bc, 2500	; Delay	to show	hiscore
;

menuLoop:				; CODE XREF: CheckGameRestart7890-2C06 j
		call	starsAnimationStep
		call	GetKEY
		cp	'1'
		jr	c, noMenuKEY
		cp	'6'
		jr	nc, noMenuKEY
		cp	'1'
		jp	z, StartGame
		cp	'2'
		jp	z, DefineKeys
		sub	'3'
		ld	e, a
		ld	a, (active_control)
		cp	e
		jr	z, noMenuKEY
		ld	a, e
		ld	(active_control), a
		ld	hl, xMSG_MENU
		push	bc
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		call	highLightSelectedContorol
		pop	bc

noMenuKEY:				; CODE XREF: CheckGameRestart7890-2C34j
					; CheckGameRestart7890-2C30j ...
		dec	bc
		ld	a, b
		or	c
		jp	z, ShowHiscoreTable2
		jp	menuLoop
; END OF FUNCTION CHUNK	FOR CheckGameRestart7890
; ---------------------------------------------------------------------------
FlagZX128:	db 0DEh			; DATA XREF: CheckGameRestart7890-2CB0w
					; CheckGameRestart7890-2C54r ...
					; 00 - zx48
xMSG_MENU:	db _E8_LD_DB_setNoWalk	; DATA XREF: CheckGameRestart7890-2C6Ao
					; CheckGameRestart7890-2C17o
		db 1
		db _DF_DW_xy
		_XY_ 0, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 7, 7
		db _E0_Attribute?
		db 44h
		db 'BY  RAFFAELE CECCO'
		db _DF_DW_xy
		_XY_ 11, 9
		db _DA_setLoColor_11_purple
		db '1'
		db _DC_setLoColor_13_blue
		db ' START GAME'
		db _7A_deltaY__p2_dbX
		db -0Ch
		db _DA_setLoColor_11_purple
		db '2'
		db _DC_setLoColor_13_blue
		db ' DEFINE KEYS'
		db _7A_deltaY__p2_dbX
		db -0Dh
		db _DA_setLoColor_11_purple
		db '3'
		db _DC_setLoColor_13_blue
		db ' KEYBOARD'
		db _7A_deltaY__p2_dbX
		db -0Ah
		db _DA_setLoColor_11_purple
		db '4'
		db _DC_setLoColor_13_blue
		db ' INTERFACE 2'
		db _7A_deltaY__p2_dbX
		db -0Dh
		db _DA_setLoColor_11_purple
		db '5'
		db _DC_setLoColor_13_blue
		db ' KEMPSTON'
		db _DF_DW_xy
		_XY_ 23, 2
		db _D9_setLoColor_10_RED
		db 'EXOLON COPYRIGHT 1987 HEWSON'
		db _FF_EndMSG

; =============== S U B	R O U T	I N E =======================================


starsAnimationStep:			; CODE XREF: CheckGameRestart7890:menuLoopp
		push	af
		push	bc
		push	de
		push	hl
		push	iy
		ld	iy, Sprite_BUFFER???
		ld	hl, StarsData?

nextStar:				; CODE XREF: starsAnimationStep+74 j
		ld	e, (hl)		; X?
		bit	7, e
		jr	z, doStar
		pop	iy
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; ---------------------------------------------------------------------------

doStar:					; CODE XREF: starsAnimationStep+10j
		push	hl
		inc	hl		; Y
		ld	d, (hl)
		inc	hl
		ld	a, (hl)		; sprPhase?
		or	a
		jr	nz, noNewPos
		call	RND?
		and	1Eh
		ld	e, a
		call	RND?
		and	1Fh
		cp	22
		jr	nc, skipGeneration
		ld	d, a
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
;
		ld	a, (hl)
		inc	hl
		or	(hl)
		ld	bc, 32
		add	hl, bc
		or	(hl)
		dec	hl
		or	(hl)
		jr	nz, skipGeneration
;
		pop	hl
		push	hl
		ld	a, e
		add	a, a
		add	a, a
		ld	(hl), a
		inc	hl
		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		ld	(hl), a
		inc	hl
		ld	(hl), 16	; Idx in Idx2SprTable
		jr	skipGeneration
; ---------------------------------------------------------------------------

noNewPos:				; CODE XREF: starsAnimationStep+1Fj
		dec	(hl)
		ld	l, a
		ld	h, 0
		ld	bc, m_128_XXXX	; sprPhase2SprId-2
		add	hl, bc
		ld	a, (hl)
		ld	b, d
		ld	c, e
		push	iy
		pop	hl
		call	putSpriteAndPlay128Music? ; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ??
					;
		ld	c, 71
		call	sub_7C8F

skipGeneration:				; CODE XREF: starsAnimationStep+2Ej
					; starsAnimationStep+42j ...
		pop	hl
		inc	hl
		inc	hl
		inc	hl
		ld	de, 48
		add	iy, de
		jr	nextStar	; X?
; End of function starsAnimationStep


; =============== S U B	R O U T	I N E =======================================

; A sprId (00..45)
; D - Y	(0..192)?
; E - X	(0..255)
; HL - ??
;

putSpriteAndPlay128Music?:		; CODE XREF: starsAnimationStep+63p
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		push	af
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	z, no128music
;
		ld	a, (m_128_XXXX)
		inc	a
		ld	(m_128_XXXX), a
		cp	4
		jr	nz, no128music
		xor	a
		ld	(m_128_XXXX), a
		push	af
		push	bc
		push	de
		push	hl
		push	ix
		push	iy
		call	do128musicstep
		pop	iy
		pop	ix
		pop	hl
		pop	de
		pop	bc
		pop	af

no128music:				; CODE XREF: putSpriteAndPlay128Music?+8j
					; putSpriteAndPlay128Music?+13j
		pop	af
		ret
; End of function putSpriteAndPlay128Music?

; ---------------------------------------------------------------------------
m_128_XXXX:	db 2			; DATA XREF: starsAnimationStep+59o
					; putSpriteAndPlay128Music?+Ar	...
sprPhase2SprId:	db 0
		db sStar_1,sStar_1,sStar_2; 0
		db sStar_2,sStar_3,sStar_3; 3
		db sStar_4,sStar_4,sStar_4; 6
		db sStar_3,sStar_3,sStar_2; 9
		db sStar_3,sStar_1,sStar_1; 12
StarsData?:
		ds 	12*3
; 		lvl    8, 112,	 3; 0 ; DATA XREF: starsAnimationStep+Ao
; 					; clearStarsData o ...
; 		lvl   24,   0,	10; 1
; 		lvl   16, 104,	 0; 2
; 		lvl  120,  96,	 0; 3
; 		lvl   56,  64,	12; 4
; 		lvl   96, 144,	 1; 5
; 		lvl    0,  48,	 0; 6
; 		lvl   24,  72,	 0; 7
; 		lvl   96, 160,	12; 8
; 		lvl  120,  80,	12; 9
; 		lvl  120, 136,	 3; 10
; 		lvl   96,  16,	 0; 11
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clearStarsData:				; CODE XREF: CheckGameRestart7890-2C42p
					; CheckGameRestart7890-2A4D p
		ld	hl, StarsData?
		ld	de, StarsData?+1
		ld	bc, 35
		ld	(hl), b
		ldir
		ret
; End of function clearStarsData


; =============== S U B	R O U T	I N E =======================================


highLightSelectedContorol:		; CODE XREF: CheckGameRestart7890-2C64p
					; CheckGameRestart7890-2C10p
		ld	a, (active_control)
		add	a, a
		add	a, 15
		ld	d, a
		ld	e, 11
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	(hl), 47h ; 'G'
		ld	e, l
		ld	d, h
		inc	e
		ld	bc, 13
		ldir
		ret
; End of function highLightSelectedContorol

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckGameRestart7890

DefineKeys:				; CODE XREF: CheckGameRestart7890-2C27j
		call	psg_mute
		call	ClearToBLACK
		call	clr_no_walk_tab
		call	clr_over_player_tab
		ld	bc, 1Fh
		ldir
		xor	a
		ld	(active_control), a
		ld	hl, xMSG_KeySelect
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		call	_save_attr_table
		call	clr_Sprite_BUFFER???
		call	clearStarsData
;
		ld	ix, KeyScanCodes
		ld	iy, CheatKeyBuffer ; ""
		ld	de, 90Fh
		ld	b, 5

loc_6FDC:				; CODE XREF: CheckGameRestart7890-29EB j
		push	bc
		ld	a, '?'
		ld	c, 44h ; 'D'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		push	de
		call	waitKEY

loc_6FE8:				; CODE XREF: CheckGameRestart7890-2A2D j
		call	GetKEY
		or	a
		jr	z, loc_6FE8
		ld	(ix+2),	d
		ld	(ix+6),	e
		ld	de, 0Ah
		add	ix, de
		ld	(iy+0),	a
		inc	iy
		pop	de
		ld	hl, aEnteredKEY
		cp	' '
		jr	nz, loc_7009
		ld	hl, aSpace	; "SPACE"

loc_7009:				; CODE XREF: CheckGameRestart7890-2A15j
		cp	0Dh
		jr	nz, loc_7010
		ld	hl, aEnter	; "ENTER"

loc_7010:				; CODE XREF: CheckGameRestart7890-2A0Ej
		cp	1
		jr	nz, loc_7017
		ld	hl, aCapsShift	; "CAPS SHIFT"

loc_7017:				; CODE XREF: CheckGameRestart7890-2A07j
		cp	2
		jr	nz, loc_701E
		ld	hl, aSymbolShift ; "SYMBOL SHIFT"

loc_701E:				; CODE XREF: CheckGameRestart7890-2A00j
		ld	(aEnteredKEY), a
		ld	c, 43h ; 'C'
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		push	de
		ld	b, 0C8h	; 'È'
		call	sound48
		pop	de
		pop	bc
		djnz	loc_6FDC
		ld	bc, 50000
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
;
		ld	hl, CheatKeyBuffer ; ""
		ld	de, aZorba	; "ZORBA"
		ld	b, 5

loc_7041:				; CODE XREF: CheckGameRestart7890-29D1 j
		ld	a, (de)
		cp	(hl)
		jp	nz, xmenu
		inc	hl
		inc	de
		djnz	loc_7041
;
		ld	a, (cheat????)
		xor	3Dh ; '='
		ld	(cheat????), a
;
		ld	hl, musicGameOver
		call	z, playBeeperMusic
;
		jp	xmenu
; END OF FUNCTION CHUNK	FOR CheckGameRestart7890
; ---------------------------------------------------------------------------
aEnteredKEY:	db '?'                  ; DATA XREF: CheckGameRestart7890-2A1Ao
					; CheckGameRestart7890:loc_701Ew
		db _7A_deltaY__p2_dbX
		db -1
		db 0FFh
aSpace:		db 'SPACE'          ; DATA XREF: CheckGameRestart7890-2A13o
		db _7A_deltaY__p2_dbX
		db -5
		db _FF_EndMSG
aEnter:		db 'ENTER'          ; DATA XREF: CheckGameRestart7890-2A0Co
		db _7A_deltaY__p2_dbX
		db -5
		db _FF_EndMSG
aCapsShift:	db 'CAPS SHIFT'     ; DATA XREF: CheckGameRestart7890-2A05o
		db _7A_deltaY__p2_dbX
		db -10
		db _FF_EndMSG
aSymbolShift:	db 'SYMBOL SHIFT'   ; DATA XREF: CheckGameRestart7890-29FEo
		db _7A_deltaY__p2_dbX
		db -12
		db _FF_EndMSG
;
CheatKeyBuffer:	db 0,0,0,0,0	; DATA XREF: CheckGameRestart7890-2A46o
					; CheckGameRestart7890-29E0o
;
aZorba:		db 'ZORBA'          ; DATA XREF: CheckGameRestart7890-29DDo
;
xMSG_KeySelect:	db _DF_DW_xy		; DATA XREF: CheckGameRestart7890-2A59o
		_XY_ 0, 8
		db _E3_DWptr_RecursiveCallxMSG
		dw xMsgEXOLON?
		db _E0_Attribute?
		db 46h
		db _DF_DW_xy
		_XY_ 6, 7
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db 'SELECT KEY FOR....'
		db _DE_setLoColor_15
		db _7B_deltaY__p3_dbX
		db 0EEh
aLeft:		db 'LEFT'
		db _7A_deltaY__p2_dbX
		db 0FCh
aRight:		db 'RIGHT'
		db _7A_deltaY__p2_dbX
		db 0FBh
aJump:		db 'JUMP'
		db _7A_deltaY__p2_dbX
		db 0FCh
aDuck:		db 'DUCK'
		db _7A_deltaY__p2_dbX
		db 0FCh
aFire:		db 'FIRE'
		db _70_deltaY__m8_dbX
		db 4
		db _E5_DBcnt_DBCHR_FillCharY
		db 9
		db ' '
		db _DF_DW_xy
		_XY_ 23, 2
		db _D9_setLoColor_10_RED
		db 'EXOLON COPYRIGHT 1987 HEWSON'
		db _FF_EndMSG
;
xMSG_SetFontMain:db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _FF_EndMSG
;
xMsgEXOLON?:	db _E6_DW_FONT		; DATA XREF: RAM:6E1Do	RAM:7099o ...
		dw FNT_EXOLON		; 50 chars
		db _E0_Attribute?
		db 47h
		db _DE_setLoColor_15
		db 0
		db 1
		db 2
		db 3
		db 4
		db 5
		db 6
		db 7
		db _A7_deltaX__m8_dbY
		db _DD_setLoColor_14
		db 8
		db 9
		db 0Ah
		db 0Bh
		db 0Ch
		db 0Dh
		db 0Eh
		db 0Fh
		db _A7_deltaX__m8_dbY
		db _D5_setLoColor_06
		db 10h
		db 11h
		db 12h
		db 13h
		db 14h
		db 15h
		db 16h
		db 17h
		db _76_deltaY__m2_dbX
		db 0
		db _DE_setLoColor_15
		db 18h
		db 19h
		db 1Ah
		db 1Bh
		db 1Ch
		db 1Dh
		db 1Eh
		db 1Fh
		db _A7_deltaX__m8_dbY
		db _DD_setLoColor_14
		db 20h
		db 21h
		db 22h
		db 23h
		db 24h
		db 25h
		db 26h
		db 27h
		db _A7_deltaX__m8_dbY
		db _D5_setLoColor_06
		db 28h
		db 29h
		db 2Ah
		db 2Bh
		db 2Ch
		db 2Dh
		db 2Eh
		db 2Fh
		db _79_deltaY__p1_dbX
		db 0F2h
		db 30h
		db 31h
		db _FF_EndMSG
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckGameRestart7890

ShowHiscoreTable:			; CODE XREF: CheckGameRestart7890-2C7Bj
		xor	a
		ld	(HiScoreUpdatedFlag), a

ShowHiscoreTable2:			; CODE XREF: CheckGameRestart7890-2C09j
		ld	c, 44h ; 'D'
		call	ClearScreen_fromback ; C - Attr	value
;
		ld	hl, xMSG_HighScoreScreen
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
;
		ld	hl, HiscoreTable ; "RAFFAELE  001000"
		ld	(HiTabPTR), hl
;
		ld	bc, 960
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl

loc_7163:				; CODE XREF: CheckGameRestart7890-2897 j
		push	bc
		nop
		nop
		nop
		ld	a, c
		and	0Fh
		or	a
		ld	bc, 400h
		call	nz, _delayLDIR	; BC
		call	z, nextHiScoreToScr
		call	ScrollHiScore?
		pop	bc
		dec	bc
		ld	a, b
		or	c
		jp	z, xmenu
		call	GetKEY
		or	a
		jp	z, loc_7163
		cp	'1'
		jp	z, StartGame
		jp	xmenu
; END OF FUNCTION CHUNK	FOR CheckGameRestart7890
; ---------------------------------------------------------------------------
xMSG_HighScoreScreen:db	_DF_DW_xy	; DATA XREF: CheckGameRestart7890-28CBo
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
		dw planetMediumGreen
		db _DF_DW_xy
		_XY_ 1, 5
		db _E3_DWptr_RecursiveCallxMSG
		dw planetSmallPurpleRed
		db _DF_DW_xy
		_XY_ 5, 3
		db _E3_DWptr_RecursiveCallxMSG
		dw planetMediumGreen
		db _DF_DW_xy
		_XY_ 10, 0
		db _E3_DWptr_RecursiveCallxMSG
		dw planetBigRed
		db _DF_DW_xy
		_XY_ 16, 4
		db _E3_DWptr_RecursiveCallxMSG
		dw planetSmallPurpleRed
		db _DF_DW_xy
		_XY_ 19, 1
		db _E3_DWptr_RecursiveCallxMSG
		dw planetBigCyan
		db _DF_DW_xy
		_XY_ 0, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw planetBigRed
		db _DF_DW_xy
		_XY_ 5, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw planetSmallYellow
		db _DF_DW_xy
		_XY_ 9, 28
		db _E3_DWptr_RecursiveCallxMSG
		dw planerSmallRedPurple
		db _DF_DW_xy
		_XY_ 14, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw planetBigCyan
		db _DF_DW_xy
		_XY_ 18, 30
		db _E3_DWptr_RecursiveCallxMSG
		dw planetSmallPurpleRed
		db _DF_DW_xy
		_XY_ 21, 26
		db _E3_DWptr_RecursiveCallxMSG
		dw planetMediumGreen
		db _FF_EndMSG
;
HiScoreUpdatedFlag:db 0			; DATA XREF: CheckGameRestart7890-2C7Fr
					; CheckGameRestart7890-28D3w ...
HiscoreTable:	db 'RAFFAELE  001000' ; DATA XREF: CheckGameRestart7890-28C5o
					; updateHighScoreTab+3 o
asc_7201:	db 'SURYANI   001000'
		db 'SCRAGGY   001000'
		db 'SABATTA!  001000'
		db 'PADDY     001000'
		db 'LOFTY     001000'
		db 'JIMBO     001000'
		db 'LEO       001000'
		db 'GLEN      001000'
		db 'MORANGE   001000'
		db 'PUPPY     001000'
		db 'ONION     001000'
		db 'RIP       001000'
		db 'FIGARO    001000'
		db 'INK       001000'
		db 'PEN       001000'
		db 'DUMBO     001000'
		db 'MEPHISTO  001000'
		db 'QUEEN     001000'
		db 'UNYIL ?   001000'
		db 'EQUINOX   001000'
		db 'REALMS    001000'
		db 'MAJALA    001000'
		db 'LENGKAP   001000'
		db 'JAZZ      001000'
		db 'HEWSON    001000'
		db 'TIM.M     001000'
		db 'CECCO     001000'
		db 'LUCY      001000'
		db 'ANTONY    001000'
		db 'NIAEREH   001000'
		db '*!/?!@    001000'
		db 'POD       001000'
		db 'HUTNEE    001000'
		db 'BUTNEE    001000'
		db 'JOHN.O    001000'
		db 'CARROT    001000'
		db 'COLIN     001000'
		db 'FLASH     001000'
		db 'SEVILLE   001000'
		db 'T-STATE   001000'
		db 'CLUB      001000'
		db 'HWP       001000'
		db 'CDP       001000'
		db 'TACHYON   001000'
		db 'KILLER    001000'
		db 'DROOPY    001000'
		db 'R 4 S     001000'
		db 'RZASM2    001000'
lastHiScoreROW:	db 'HUMPTY    001000' ; DATA XREF: updateHighScoreTab+36 o
;
HiscoreTable_StopByte:db 0FFh		; DATA XREF: updateHighScoreTab+3D w
;
hiTableTailBuffer:ds  10h 	; DATA XREF: updateHighScoreTab+33 o
; ---------------------------------------------------------------------------

ScrollHiScore?:				; CODE XREF: CheckGameRestart7890-28A5p
		push	bc
		ld	(_SAV_SP), sp
		ld	sp, 6740h
		ld	bc, 8B2h
		pop	de

loc_752E:				; CODE XREF: RAM:7555 j
		pop	hl
		ld	(loc_7552+1), hl
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		inc	l
		inc	e
		inc	l
		inc	e
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi

loc_7552:				; DATA XREF: RAM:752Fw
		ld	de, 0
		jp	pe, loc_752E
		ld	sp, (_SAV_SP)
		ex	de, hl
		ld	e, l
		ld	d, h
		inc	e
		ld	bc, 10h
		ld	(hl), b
		ldir
		pop	bc
		ret

; =============== S U B	R O U T	I N E =======================================


nextHiScoreToScr:			; CODE XREF: CheckGameRestart7890-28A8p
		ld	hl, (HiTabPTR)
		ld	a, (hl)
		cp	0FFh
		jp	z, _delayLDIR	; BC
		ld	de, 1708h
		ld	bc, 1000h

loc_7577:				; CODE XREF: nextHiScoreToScr+15 j
		ld	a, (hl)
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		inc	e
		inc	hl
		djnz	loc_7577
		ld	(HiTabPTR), hl
		ld	bc, 28Eh
		jp	_delayLDIR	; BC
; End of function nextHiScoreToScr

; ---------------------------------------------------------------------------
HiTabPTR:	dw 0			; DATA XREF: CheckGameRestart7890-28C2w
					; nextHiScoreToScrr ...
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckGameRestart7890

StartGame:				; CODE XREF: CheckGameRestart7890-2C2Cj
					; CheckGameRestart7890-2892j
		di
		call	psg_mute
		call	ClearToBLACK
;
		ld	a, 0FFh
		ld	(byte_8269), a
;
		ld	a, (BigSpriteLeftRightFlag??) ;	0 - to right, 1	- to left
		or	a		; swap to Right	if requried
		call	nz, swapBigSprite ; Swap sprites to left/right when move in left/right directions
;
		xor	a
		ld	(byte_82F7), a
		inc	a
		ld	(byte_82FA), a
;
		ld	hl, 7010h	; Start	position
		ld	(Player_X_Pos),	hl ; 0..127
		ld	(PlayerXY_COPY), hl
;
		ld	a, 99
		ld	(_AMMO), a
;
		ld	a, 10
		ld	(_GRENADES), a
;
		call	show2BottomLine
;
		call	ShowZone2Screen

gameLoop:				; CODE XREF: CheckGameRestart7890-2390 j
		xor	a
		ld	(PreshiftedSpritesCallCount?), a
		ld	(Sprite16x16_count_MISSING???),	a
;
		call	doPSG
;
		call	chkKEYS
		call	sub_81A4
		call	doNewZone
		call	chkFire?
;
		call	__move__???
;
		call	sub_90A2
		call	showDiePlayer	; 40..0
		call	do_MINES
		call	chkGrenades?
		call	sub_925F
;
		call	__move__???
;
		call	chkSpheres
		call	doPUMP?
		call	chkBoomParticles?
		call	chkAttrFlash
		call	chkBoxAmoGrenade?
		call	chkBOOM?
		call	__move__???
		call	doTeleport
;
		call	doPSG
;
		ld	a, (byte_925A)
		cp	19
		call	c, sub_925F
;
		call	__move__???
;
		call	sub_90A2
		call	do_FireDown
		call	do_GunMachine????
;
		call	__move__???
;
		ld	a, (byte_925A)
		cp	19
		call	c, sub_925F
;
		call	chkRocketLauncher
		call	sub_9DD6
		call	updateBONUS
		call	moveTeleportParticleToLIST
		call	addNewFlyingEnemy
		call	processAfterCircle
		call	chkSuperShieldChange
		call	sub_A26B
		call	chkBonusPoint?
		call	doEnemyMove
		call	chkHighVoltage
		call	chkEndLevel???
		call	updateBeam
		call	chkLongDelayKiller
		call	moveLongDelayKiller?
		call	sub_90EA
		call	sub_9BB4
		call	chkPUMP
		call	sub_9E64
		call	sub_A5F4
;
		call	chk_key_3	; step by step animation while pressing	3
;
		call	CheckGameRestart7890
;
		ld	bc, 500
		call	_delayLDIR	; BC
;
		call	doPSG
;
		call	CompensateNoShowenSprites8x8??????
		call	CompensateNoShowenSprites16x16??????
;
		ld	a, (dead_sprite_delay2??)
		or	a
		jr	z, loc_767E
		dec	a
		ld	(dead_sprite_delay2??),	a

		.assert loc_767E==0x767E


loc_767E:				; CODE XREF: CheckGameRestart7890-23A1j
		ld	hl, cntrDB
		inc	(hl)
;
		ld	hl, (cntrDW)
		inc	hl
		ld	(cntrDW), hl
;
		jp	gameLoop
; END OF FUNCTION CHUNK	FOR CheckGameRestart7890
; ---------------------------------------------------------------------------
cntrDB:		db 0			; DATA XREF: CheckGameRestart7890:loc_767Eo
					; chkAttrFlash+12 r ...
dead_sprite_delay2??:db	0		; DATA XREF: CheckGameRestart7890-23A5r
					; CheckGameRestart7890-239Ew ...
unk_768E:	db 0EDh	; í		; DATA XREF: chkEndLevel???+80 o
		db  4Dh	; M

; =============== S U B	R O U T	I N E =======================================


show2BottomLine:			; CODE XREF: CheckGameRestart7890-2461p
					; chkEndLevel???+A4 p
		ld	hl, xMSG_bottomText
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		call	showAMMO
		call	showGRENADES
		call	showLIVES
		jp	showZONE
; End of function show2BottomLine

; ---------------------------------------------------------------------------
xMSG_bottomText:db _DF_DW_xy		; DATA XREF: show2BottomLineo
		_XY_ 22, 0
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _E8_LD_DB_setNoWalk
		db 1
		db _E9_setNoOverPlayer
		db _DC_setLoColor_13_blue
		db 'AMMO '
		db _DD_setLoColor_14
		db 'GRENADES '
		db _DB_setLoColor_12_green
		db 'POINTS '
		db _DE_setLoColor_15
		db 'LIVES '
		db _DA_setLoColor_11_purple
		db 'ZONES'
		db _DF_DW_xy
		_XY_ 23, 0
		db _E4_DBcnt_DBCHR_FillCharX
		db 32
		db ' '
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_Points
		db 0FFh

; =============== S U B	R O U T	I N E =======================================

;
; 00-09	- WALK
; 10 - Duck
; 11 - DIE
; 12-21	WALK 2gun
; 22 - Duck2gun
; 23 - Die 2gun
; 24 - PUMP
;

Sprite24x32_Player:			; CODE XREF: show32xsprite+27 j
					; doPUMP?+50 p
		push	af
		push	bc
		push	de
		push	ix
		push	hl
		push	bc
		push	hl
		push	de
;
; 1. calculate sprite ram addr
;
;
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 32
		ld	a, e
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, de		; *96
		ld	de, PLAYER_WALK	; 10 phases
		add	hl, de
;
		ld	(_SAV_SP), sp
		ld	sp, hl
;
; 2. shift sprite to sprite buff
; (x&7)
		add	a, a		; x
		and	7
		add	a, a
		ld	l, a
		ld	h, 0
		ld	de, shift32_table
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	ix, 0
		add	ix, de
;
		ld	hl, ShiftedSprites
		ld	a, 32

shift_loop_24x32:			; CODE XREF: RAM:7742 j	RAM:7769 j
		pop	bc
		pop	de
		dec	sp
		ld	d, 0
		jp	(ix)
; End of function Sprite24x32_Player

; ---------------------------------------------------------------------------

shift32_4:				; DATA XREF: RAM:78D2 o
		rl	e
		rl	b
		rl	c
		rl	d

shift32_5:				; DATA XREF: RAM:78D4 o
		rl	e
		rl	b
		rl	c
		rl	d

shift32_6:				; DATA XREF: RAM:78D6 o
		rl	e
		rl	b
		rl	c
		rl	d

shift32_7:				; DATA XREF: RAM:78D8 o
		rl	e
		rl	b
		rl	c
		rl	d
		ld	(hl), d
		inc	hl
		ld	(hl), c
		inc	hl
		ld	(hl), b
		inc	hl
		ld	(hl), e
		inc	hl
		dec	a
		jp	nz, shift_loop_24x32
		jp	spr24x32done
; ---------------------------------------------------------------------------

shift32_3:				; DATA XREF: RAM:78D0 o
		rr	c
		rr	b
		rr	e
		rr	d

shift32_2:				; DATA XREF: RAM:78CE o
		rr	c
		rr	b
		rr	e
		rr	d

shift32_1:				; DATA XREF: RAM:78CC o
		rr	c
		rr	b
		rr	e
		rr	d

shift32_0:				; DATA XREF: RAM:shift32_table o
		ld	(hl), c
		inc	hl
		ld	(hl), b
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		dec	a
		jp	nz, shift_loop_24x32

spr24x32done:				; CODE XREF: RAM:7745j
		ld	sp, (_SAV_SP)
		pop	de
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		ld	(scr_addr_spr24x32+1), hl
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a
;
		push	de
		ld	bc, over_player_tab
		add	hl, bc
;
		push	hl
		ld	a, d
		ld	de, 29		; 32-3
		ld	b, 4
		and	7
		jr	z, loc_778F
		inc	b

		.assert loc_778F==0x778F

loc_778F:				; CODE XREF: RAM:778Cj
		ld	a, 0FFh

loc_7791:				; CODE XREF: RAM:7799 j
		and	(hl)
		inc	hl
		and	(hl)
		inc	hl
		and	(hl)
		inc	hl
		and	(hl)
		add	hl, de
		djnz	loc_7791
;
		pop	hl
		pop	de
		ex	af, af'
		ld	a, e
		cp	75h ; 'u'
		jp	c, loc_77CF
		exx
		ld	hl,  ShiftedSprites+1
		cp	7Ch ; '|'
		ld	de, 0
		ld	c, d
		jr	nc, loc_77BD
		cp	78h ; 'x'
		ld	de, 0FF00h
		ld	c, e
		jr	nc, loc_77BD
		ld	de, 0FFFFh
		ld	c, 0

loc_77BD:				; CODE XREF: RAM:77AEj	RAM:77B6j
		ld	b, 32

loc_77BF:				; CODE XREF: RAM:77CC j
		ld	a, d
		and	(hl)
		ld	(hl), a
		inc	hl
		ld	a, e
		and	(hl)
		ld	(hl), a
		inc	hl
		ld	a, c
		and	(hl)
		ld	(hl), a
		inc	hl
		inc	hl
		djnz	loc_77BF
		exx

loc_77CF:				; CODE XREF: RAM:77A1j
		ex	af, af'
		jr	nz, loc_77FB
;
		ld	a, 8
		ld	(last_mask_len+1), a
;
		ld	a, d
		and	7
		ld	de, ShiftedSprites
		jr	z, firsy_byte_shhift_0
;
		ld	(last_mask_len+1), a
		ld	b, a
		ld	a, 8
		sub	b
		ld	b, a
		ld	de, ShiftedSprites
		call	mask_hl_de_a

firsy_byte_shhift_0:			; CODE XREF: RAM:77DDj
		call	mask_hl_de_8
		call	mask_hl_de_8
		call	mask_hl_de_8

last_mask_len:				; DATA XREF: RAM:77D4w	RAM:77DFw
		ld	b, 0
		call	mask_hl_de_a

loc_77FB:				; CODE XREF: RAM:77D0j
		pop	hl
		pop	de
		ld	b, h
		ld	c, l
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		ld	d, b
		ld	e, c
		ld	c, 7
		exx

scr_addr_spr24x32:			; DATA XREF: RAM:7774w
		ld	hl, 0
		ld	(_SAV_SP), sp
		ld	sp, ShiftedSprites
		ld	bc, 2007h

loc_7814:				; CODE XREF: RAM:785E j
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l
;
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		dec	l
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_7837
		ld	a, l
		add	a, 32
		ld	l, a
		jr	c, loc_7837
		ld	a, h
		sub	8
		ld	h, a

loc_7837:				; CODE XREF: RAM:782Bj	RAM:7831j
		exx
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	de
		dec	l
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_785D
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, loc_785D
		ld	a, h
		sub	8
		ld	h, a

loc_785D:				; CODE XREF: RAM:7851j	RAM:7857j
		exx
		djnz	loc_7814
		ld	sp, (_SAV_SP)
		pop	de
		push	de
		and	a
		ld	hl, byte_B101
		sbc	hl, de
		jr	z, loc_7897
;
		ld	hl, ShiftedSprites
		ld	bc, 128		; 8 SPRITES?

move_1_shifted_spr:			; CODE XREF: RAM:7894 j
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi			; 16
		jp	pe, move_1_shifted_spr

loc_7897:				; CODE XREF: RAM:786Cj
		pop	hl
		pop	ix
		pop	de
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


mask_hl_de_8:				; CODE XREF: RAM:firsy_byte_shhift_0p
					; RAM:77F0p ...
		ld	b, 8
; End of function mask_hl_de_8


; =============== S U B	R O U T	I N E =======================================


mask_hl_de_a:				; CODE XREF: RAM:77EAp	RAM:77F8p
		ld	a, (hl)
		ld	(mask1+1), a
		inc	hl
		ld	a, (hl)
		ld	(mask2+1), a
		inc	hl
		ld	a, (hl)
		ld	(mask3+1), a
		inc	hl
		ld	c, (hl)		; mask4

loc_78B0:				; CODE XREF: mask_hl_de_a+23 j
		ld	a, (de)

mask1:					; DATA XREF: mask_hl_de_a+1w
		and	0
		ld	(de), a
		inc	de
;
		ld	a, (de)

mask2:					; DATA XREF: mask_hl_de_a+6w
		and	0
		ld	(de), a
		inc	de
;
		ld	a, (de)

mask3:					; DATA XREF: mask_hl_de_a+Bw
		and	0
		ld	(de), a
		inc	de
;
		ld	a, (de)
		and	c
		ld	(de), a
		inc	de
		djnz	loc_78B0
;
		ld	bc, 29
		add	hl, bc
		ret
; End of function mask_hl_de_a

; ---------------------------------------------------------------------------
;



shift32_table:	dw shift32_0		; DATA XREF: Sprite24x32_Player+26o
		dw shift32_1
		dw shift32_2
		dw shift32_3
		dw shift32_4
		dw shift32_5
		dw shift32_6
		dw shift32_7
;
_SAV_SP:	dw _stack		; DATA XREF: RAM:7523w	RAM:7558r ...
;
ShiftedSprites:	ds 128
	;

; =============== S U B	R O U T	I N E =======================================

; A sprId (00..45)
; D - Y	(0..192)?
; E - X	(0..255)
; HL - ????
;

Sprite16x16:				; CODE XREF: putSpriteAndPlay128Music?p
					; CompensateNoShowenSprites16x16??????:loc_9EA8 p ...
		push	af
		push	bc
		push	de
		push	ix
		push	hl
		push	bc
		push	hl
		push	de
;
		ld	l, a
		ld	h, 0
;
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 32
;
		ld	a, e
		ld	de, SPRITES
		add	hl, de
;
		ld	(_SAV_SP), sp
;
		ld	sp, hl
;
		add	a, a		; X
		and	7
		add	a, a
		ld	l, a
		ld	h, 0
;
		ld	de, _shif_jp_tab
		add	hl, de
;
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	ix, 0
		add	ix, de
;
		ld	hl, ShiftedSprites
		ld	b, 16

move_LP:				; CODE XREF: RAM:79AE j	RAM:79C8 j
		pop	de
		xor	a
		jp	(ix)
; End of function Sprite16x16

; ---------------------------------------------------------------------------

_sh4:					; DATA XREF: RAM:7AE1 o
		sla	d
		rl	e
		rla

_sh5:					; DATA XREF: RAM:7AE3 o
		sla	d
		rl	e
		rla

_sh6:					; DATA XREF: RAM:7AE5 o
		sla	d
		rl	e
		rla

_sh7:					; DATA XREF: RAM:7AE7 o
		sla	d
		rl	e
		rla
		ld	(hl), a
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		djnz	move_LP
		jp	endMOVE
; ---------------------------------------------------------------------------

_sh3:					; DATA XREF: RAM:7ADF o
		srl	e
		rr	d
		rra

_sh2:					; DATA XREF: RAM:7ADD o
		srl	e
		rr	d
		rra

_sh1:					; DATA XREF: RAM:7ADB o
		srl	e
		rr	d
		rra

_sh0:					; DATA XREF: RAM:_shif_jp_tab o
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), a
		inc	hl
		djnz	move_LP

endMOVE:				; CODE XREF: RAM:79B0j
		ld	sp, (_SAV_SP)
		pop	de
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
;
		ld	(workScrAddr+1), hl
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		push	de
		ld	bc, over_player_tab
		add	hl, bc
		push	hl
		ld	a, d
		ld	de, 30
		ld	b, 2
		and	7
		jr	z, loc_79ED
		inc	b

loc_79ED:				; CODE XREF: RAM:79EAj
		ld	a, 0FFh

loc_79EF:				; CODE XREF: RAM:79F5 j
		and	(hl)
		inc	l
		and	(hl)
		inc	l
		and	(hl)
		add	hl, de
		djnz	loc_79EF
		pop	hl
		pop	de
		jr	nz, loc_7A1E
		ld	a, 8
		ld	(loc_7A19+1), a
		ld	a, d
		and	7
		ld	de, ShiftedSprites
		jr	z, loc_7A16
		ld	(loc_7A19+1), a
		ld	b, a
		ld	a, 8
		sub	b
		ld	b, a
		ld	de, ShiftedSprites
		call	loc_7AB9

loc_7A16:				; CODE XREF: RAM:7A06j
		call	sub_7AB7

loc_7A19:				; DATA XREF: RAM:79FDw	RAM:7A08w
		ld	b, 8
		call	loc_7AB9

loc_7A1E:				; CODE XREF: RAM:79F9j
		pop	hl
		pop	de
		ld	b, h
		ld	c, l
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		ld	d, b
		ld	e, c
		ld	c, 7
		exx

workScrAddr:				; DATA XREF: RAM:79D2w
		ld	hl,  SCRLINE136+1Eh
		ld	(_SAV_SP), sp
		ld	sp, 78DCh
		ld	bc, 1007h

loc_7A37:				; CODE XREF: RAM:7A77 j
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		dec	sp
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_7A56
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, loc_7A56
		ld	a, h
		sub	8
		ld	h, a

loc_7A56:				; CODE XREF: RAM:7A4Aj	RAM:7A50j
		exx
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	l
		inc	de
		ld	a, (de)
		xor	(hl)
		ld	(hl), a
		inc	de
		dec	l
		dec	l
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_7A76
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, loc_7A76
		ld	a, h
		sub	8
		ld	h, a

loc_7A76:				; CODE XREF: RAM:7A6Aj	RAM:7A70j
		exx
		djnz	loc_7A37
		ld	sp, (_SAV_SP)
		pop	de
		push	de
		and	a
		ld	hl, byte_B101
		sbc	hl, de
		jr	z, loc_7AB0
		ld	hl, ShiftedSprites
		ld	bc, 30h	; '0'

loc_7A8D:				; CODE XREF: RAM:7AAD j
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		jp	pe, loc_7A8D

loc_7AB0:				; CODE XREF: RAM:7A85j
		pop	hl
		pop	ix
		pop	de
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


sub_7AB7:				; CODE XREF: RAM:loc_7A16p
		ld	b, 8
; End of function sub_7AB7


loc_7AB9:				; CODE XREF: RAM:7A13p	RAM:7A1Bp
		ld	a, (hl)
		ld	(loc_7AC5+1), a
		inc	hl
		ld	a, (hl)
		ld	(loc_7ACA+1), a
		inc	hl
		ld	c, (hl)

loc_7AC4:				; CODE XREF: RAM:7AD2 j
		ld	a, (de)

loc_7AC5:				; DATA XREF: RAM:7ABAw
		and	0FFh
		ld	(de), a
		inc	de
		ld	a, (de)

loc_7ACA:				; DATA XREF: RAM:7ABFw
		and	0FFh
		ld	(de), a
		inc	de
		ld	a, (de)
		and	c
		ld	(de), a
		inc	de
		djnz	loc_7AC4
		ld	bc, 1Eh
		add	hl, bc
		ret
; ---------------------------------------------------------------------------
;
_shif_jp_tab:	dw _sh0			; DATA XREF: Sprite16x16+22o
		dw _sh1
		dw _sh2
		dw _sh3
		dw _sh4
		dw _sh5
		dw _sh6
		dw _sh7
; ---------------------------------------------------------------------------
;

_ctrl_KBD:				; CODE XREF: chkKEYS+7 j
		ld	d, 1
		ld	hl, locret_7B91
		ld	c, 0FEh	; 'þ'

KeyScanCodes:				; DATA XREF: CheckGameRestart7890-2A4Ao
		inc	hl
		ld	b, 0DFh	; 'ß'
		in	a, (c)
		and	2
		jr	nz, loc_7AFA
		ld	(hl), d

loc_7AFA:				; CODE XREF: RAM:7AF7j
		inc	hl
		ld	b, 0DFh	; 'ß'
		in	a, (c)
		and	1
		jr	nz, loc_7B04
		ld	(hl), d

loc_7B04:				; CODE XREF: RAM:7B01j
		inc	hl
		ld	b, 0FBh	; 'û'
		in	a, (c)
		and	1
		jr	nz, loc_7B0E
		ld	(hl), d

loc_7B0E:				; CODE XREF: RAM:7B0Bj
		inc	hl
		ld	b, 0FDh	; 'ý'
		in	a, (c)
		and	1
		jr	nz, loc_7B18
		ld	(hl), d

loc_7B18:				; CODE XREF: RAM:7B15j
		inc	hl
		ld	b, 7Fh ; ''
		in	a, (c)
		and	4
		ret	nz
		ld	(hl), d
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR chkKEYS

_ctrl_IFF2:				; CODE XREF: chkKEYS+C j
		ld	bc, 0EFFEh
		in	a, (c)
		cpl
		and	1Fh
		ld	d, a
		call	shiftDtoA
		ld	(fl_FIRE), a
		call	shiftDtoA
		ld	(fl_DOWN), a
		call	shiftDtoA
		ld	(fl_UP), a
		call	shiftDtoA
		ld	(fl_LEFT), a
		call	shiftDtoA
		ld	(fl_RIGHT), a
		ret
; ---------------------------------------------------------------------------

_ctrl_KEMPSTON:				; CODE XREF: chkKEYS+F j
		ld	c, 1Fh
		in	d, (c)
		call	shiftDtoA
		ld	(fl_LEFT), a
		call	shiftDtoA
		ld	(fl_RIGHT), a
		call	shiftDtoA
		ld	(fl_UP), a
		call	shiftDtoA
		ld	(fl_DOWN), a
		call	shiftDtoA
		ld	(fl_FIRE), a
		ret
; END OF FUNCTION CHUNK	FOR chkKEYS

; =============== S U B	R O U T	I N E =======================================


shiftDtoA:				; CODE XREF: chkKEYS-47p chkKEYS-41p ...
		xor	a
		srl	d
		rla
		ret
; End of function shiftDtoA


; =============== S U B	R O U T	I N E =======================================


chkKEYS:				; CODE XREF: CheckGameRestart7890-2451p
					; chk_key_3:loc_7CEE p ...

; FUNCTION CHUNK AT 7B22 SIZE 0000004B BYTES

		call	clrKEYS
		ld	a, (active_control)
		or	a
		jp	z, _ctrl_KBD
		cp	1
		jp	z, _ctrl_IFF2
		jp	_ctrl_KEMPSTON
; End of function chkKEYS


; =============== S U B	R O U T	I N E =======================================


clrKEYS:				; CODE XREF: chkKEYSp
		ld	hl, fl_RIGHT
		ld	de, fl_LEFT
		ld	(hl), 0
		ld	bc, 4
		ldir

locret_7B91:				; DATA XREF: RAM:7AEBo
		ret
; End of function clrKEYS

; ---------------------------------------------------------------------------
fl_RIGHT:	db 0			; DATA XREF: chkKEYS-2Cw chkKEYS-1Bw ...
fl_LEFT:	db 0			; DATA XREF: chkKEYS-32w chkKEYS-21w ...
fl_DOWN:	db 0			; DATA XREF: chkKEYS-3Ew chkKEYS-Fw ...
fl_UP:		db 0			; DATA XREF: chkKEYS-38w chkKEYS-15w ...
fl_FIRE:	db 0			; DATA XREF: chkKEYS-44w chkKEYS-9w ...
active_control:	db 0			; DATA XREF: CheckGameRestart7890-2C21r
					; CheckGameRestart7890-2C1Aw ...
byte_7B98:	db 0			; DATA XREF: chkFire?+B w

; =============== S U B	R O U T	I N E =======================================


initBitSwapTab:				; CODE XREF: CheckGameRestart7890-2C94p
		ld	hl, bitSwapTab	; swapped bits
					; 01234567 -> 76543210


		.assert loc_7B9C==0x7B9C

loc_7B9C:				; CODE XREF: initBitSwapTab+E j
		ld	d, l
		ld	b, 8

loc_7B9F:				; CODE XREF: initBitSwapTab+A j
		srl	d
		rl	c
		djnz	loc_7B9F
;
		ld	(hl), c
		inc	l
		jr	nz, loc_7B9C
		ret
; End of function initBitSwapTab


; =============== S U B	R O U T	I N E =======================================

; Swap sprites to left/right when move in left/right directions

swapBigSprite:				; CODE XREF: CheckGameRestart7890-247Fp
					; sub_81A4+113 p ...
		push	af
		push	bc
		push	de
		push	hl
;
		ld	a, (BigSpriteLeftRightFlag??) ;	0 - to right, 1	- to left
		xor	1
		ld	(BigSpriteLeftRightFlag??), a ;	0 - to right, 1	- to left
;
		ld	hl, PLAYER_WALK	; 10 phases
		ld	d, 64h ; 'd'    ; 6400 - bitSwapTab
		ld	bc, 768

loc_7BBE:				; CODE XREF: swapBigSprite+28 j
		push	bc
		push	hl
		ld	e, (hl)
		ld	a, (de)
		ld	c, a
		inc	hl
		ld	e, (hl)
		ld	a, (de)
		ld	(hl), a
		inc	hl
		ld	e, (hl)
		ld	a, (de)
		ld	(hl), c
		inc	hl
		pop	bc
		ld	(bc), a
		pop	bc
		dec	bc
		ld	a, b
		or	c
		jp	nz, loc_7BBE
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function swapBigSprite

; ---------------------------------------------------------------------------
BigSpriteLeftRightFlag??:db 0		; DATA XREF: CheckGameRestart7890-2483r
					; swapBigSprite+4r ...
					; 0 - to right,	1 - to left
; ---------------------------------------------------------------------------
		ld	hl, 8000h
		ld	(hl), 81h ; ''
		ld	de, 8001h
		ld	bc, 101h
		ldir
		im	2
		ld	a, 80h ; '€'
		ld	i, a
		ret

; =============== S U B	R O U T	I N E =======================================


InitScrAddtTables:			; CODE XREF: CheckGameRestart7890-2C97p
		ld	b, 192
		ld	ix, Y2SCR_HI
		ld	iy, Y2SCR_LO
		ld	hl, SCRLINE000

mk_y2scr:				; CODE XREF: InitScrAddtTables+1A j
		ld	(ix+0),	h
		ld	(iy+0),	l
		inc	ix
		inc	iy
		call	NextScrLineAddr
		djnz	mk_y2scr
;
		ld	b, 192
		ld	hl,  SCRLINE000+8
		ld	ix, scr_addr_8	; unused !!!

loc_7C14:				; CODE XREF: InitScrAddtTables+32 j
		ld	(ix+0),	l
		ld	(ix+1),	h
		inc	ix
		inc	ix
		call	NextScrLineAddr
		djnz	loc_7C14
		ret
; End of function InitScrAddtTables

; ---------------------------------------------------------------------------
		db    6
		db  37h	; 7

; =============== S U B	R O U T	I N E =======================================


sound48:				; CODE XREF: CheckGameRestart7890-29F0p
					; chkFire?+30 p	...
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		ret	nz

loc_7C2B:				; CODE XREF: sound48+13 j
		ld	a, r
		and	11111000b
		out	(0FEh),	a
		ld	e, b
		inc	e


		.assert loc_7C33==0x7C33

loc_7C33:				; CODE XREF: sound48+E j
		dec	e
		jr	nz, loc_7C33
		xor	a
		out	(0FEh),	a
		djnz	loc_7C2B
		ret
; End of function sound48


; =============== S U B	R O U T	I N E =======================================


sndBox48:				; CODE XREF: chkBoxAmoGrenade?:loc_9996 p
					; chkBoxAmoGrenade?:loc_99EC p
		push	af
		push	bc
		push	de
		push	hl
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, loc_7C5A
		xor	a
		ld	de, 1030h

loc_7C4A:				; CODE XREF: sndBox48+1C j
		ld	h, 0Ah

loc_7C4C:				; CODE XREF: sndBox48+18 j
		xor	10h
		out	(0FEh),	a
		ld	b, e

loc_7C51:				; CODE XREF: sndBox48:loc_7C51 j
		djnz	$
		dec	h
		jr	nz, loc_7C4C
		inc	e
		dec	d
		jr	nz, loc_7C4A

loc_7C5A:				; CODE XREF: sndBox48+8j
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function sndBox48


; =============== S U B	R O U T	I N E =======================================


sub_7C5F:				; CODE XREF: show32xsprite+A p
					; doPUMP?+55 p

; FUNCTION CHUNK AT 7CA7 SIZE 0000000E BYTES

		push	af
		push	bc
		push	de
		push	hl
		ld	l, 1Dh
		ld	h, 0
		ld	(loc_7CB5+1), hl
		ld	a, 3
		ld	(loc_7CB8+1), a
		ld	a, 4
		ld	(loc_7CC7+1), a
		jp	loc_7CA7
; End of function sub_7C5F


; =============== S U B	R O U T	I N E =======================================


sub_7C77:				; CODE XREF: sub_925F+5A p chkBOOM?+37 p ...
		push	af
		push	bc
		push	de
		push	hl
		ld	l, 1Fh
		ld	h, 0
		ld	(loc_7CB5+1), hl
		ld	a, 1
		ld	(loc_7CB8+1), a
		ld	a, 1
		ld	(loc_7CC7+1), a
		jp	loc_7CA7
; End of function sub_7C77


; =============== S U B	R O U T	I N E =======================================


sub_7C8F:				; CODE XREF: starsAnimationStep+68p
					; processAfterCircle+2C p ...
		push	af
		push	bc
		push	de
		push	hl
		ld	l, 1Eh
		ld	h, 0
		ld	(loc_7CB5+1), hl
		ld	a, 2
		ld	(loc_7CB8+1), a
		ld	a, 2
		ld	(loc_7CC7+1), a
		jp	loc_7CA7
; End of function sub_7C8F

; START	OF FUNCTION CHUNK FOR sub_7C5F

loc_7CA7:				; CODE XREF: sub_7C5F+15j sub_7C77+15j
		call	getATTR_TABLE_COPY_for_XY ; d-y	(0..191) ,e-x (0..127)
					; ret
					; hl-AttrTableCopy
		ld	a, c
		push	hl
		ld	bc,  SPRITES+120h
		add	hl, bc
		ld	c, a
		push	hl
		ld	a, e
		and	3
; END OF FUNCTION CHUNK	FOR sub_7C5F

loc_7CB5:				; DATA XREF: sub_7C5F+8w sub_7C77+8w ...
		ld	hl, 1Eh

loc_7CB8:				; DATA XREF: sub_7C5F+Dw sub_7C77+Dw ...
		ld	a, 2
		jr	z, loc_7CBE
		dec	hl
		inc	a

loc_7CBE:				; CODE XREF: RAM:7CBAj
		ld	(loc_7CCF+1), a
		ld	(loc_7CDB+1), hl
		ld	a, d
		and	7

loc_7CC7:				; DATA XREF: sub_7C5F+12w sub_7C77+12w ...
		ld	a, 2
		jr	z, loc_7CCC
		inc	a

loc_7CCC:				; CODE XREF: RAM:7CC9j
		pop	hl
		pop	de

loc_7CCE:				; CODE XREF: RAM:7CE5 j
		ex	af, af'

loc_7CCF:				; DATA XREF: RAM:loc_7CBEw
		ld	b, 2

loc_7CD1:				; CODE XREF: RAM:7CD8 j
		ld	a, (de)
		or	a
		jr	nz, loc_7CD6
		ld	(hl), c

loc_7CD6:				; CODE XREF: RAM:7CD3j
		inc	hl
		inc	de
		djnz	loc_7CD1
		ld	a, c

loc_7CDB:				; DATA XREF: RAM:7CC1w
		ld	bc, 1Eh
		add	hl, bc
		ex	de, hl
		add	hl, bc
		ex	de, hl
		ld	c, a
		ex	af, af'
		dec	a
		jr	nz, loc_7CCE
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR chk_key_3

loc_7CEC:				; CODE XREF: chk_key_3+12 j
		push	bc
		push	hl

loc_7CEE:				; CODE XREF: chk_key_3-3010 j
		call	chkKEYS
		ld	a, (fl_FIRE)
		or	a
		ld	a, 30h ; '0'
		jr	nz, loc_7D14
		ld	hl, KBD_TABLE
		ld	d, 0FEh	; 'þ'

loc_7CFE:				; CODE XREF: chk_key_3-3012 j
		ld	a, d
		in	a, (0FEh)
		ld	e, 1
		ld	b, 5

loc_7D05:				; CODE XREF: chk_key_3-3016 j
		rrca
		jr	nc, loc_7D13
		inc	hl
		sla	e
		djnz	loc_7D05
		rlc	d
		jr	c, loc_7CFE
		jr	loc_7CEE
; ---------------------------------------------------------------------------
		.assert loc_7D13==0x7D13

loc_7D13:				; CODE XREF: chk_key_3-301Bj
		ld	a, (hl)

loc_7D14:				; CODE XREF: chk_key_3-302Aj
		pop	hl
		pop	bc
		ret
; END OF FUNCTION CHUNK	FOR chk_key_3

; =============== S U B	R O U T	I N E =======================================


playBeeperMusic:			; CODE XREF: CheckGameRestart7890-2C4Bp
					; CheckGameRestart7890-29C4p ...
		xor	a
		in	a, (0FEh)
		cpl
		and	1Fh
		jr	nz, playBeeperMusic
		ld	(NoteAddr?), hl

loc_7D22:				; CODE XREF: playBeeperMusic+34 j
					; playBeeperMusic+4D j
		xor	a
		in	a, (0FEh)
		and	1Fh
		cp	1Fh
		jp	z, loc_7D2D

locret_7D2C:				; CODE XREF: playBeeperMusic+1B j
		ret
; ---------------------------------------------------------------------------

loc_7D2D:				; CODE XREF: playBeeperMusic+12j
		ld	hl, (NoteAddr?)
		ld	a, (hl)
		or	a
		jp	z, locret_7D2C
		inc	hl
		ld	(byte_7FEE), a
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	(NoteAddr?), hl
		ld	a, c
		or	b
		jp	nz, loc_7D4E
		ld	a, (byte_7FEE)
		call	sub_8004
		jp	loc_7D22
; ---------------------------------------------------------------------------

loc_7D4E:				; CODE XREF: playBeeperMusic+2Bj
		ld	h, 0
		ld	l, c
		ld	de, byte_8062
		add	hl, de
		ld	d, (hl)
		ld	h, 0
		ld	l, b
		ld	bc, byte_8062
		add	hl, bc
		ld	e, (hl)
		ld	a, (byte_7FEE)
		call	sub_803D
		jp	loc_7D22
; End of function playBeeperMusic

; ---------------------------------------------------------------------------
flag_BeeperMenuMusic:db	0		; DATA XREF: CheckGameRestart7890-2C9Aw
					; CheckGameRestart7890-2C5Er ...
musicGameOver:	db  0Fh, 1Ch, 28h, 0Fh,	1Ch, 2Ch, 0Fh, 1Ch, 2Fh, 0Fh, 1Bh, 27h,	0Fh, 1Bh, 2Bh, 0Fh; 0
					; DATA XREF: CheckGameRestart7890-29C7o
					; RAM:A030 o
		db  1Bh, 2Eh, 0Fh, 1Ah,	26h, 0Fh, 1Ah, 2Ah, 0Fh, 1Ah, 2Dh, 0Fh,	19h, 25h, 0Fh, 19h; 16
		db  29h, 0Fh, 19h, 2Ch,	0Fh, 18h, 24h, 0Fh, 18h, 28h, 0Fh, 18h,	2Bh, 0Fh, 17h, 23h; 32
		db  0Fh, 17h, 27h, 0Fh,	17h, 2Ah, 2Dh, 1Ch, 28h,   0,	0; 48
;
menuMusic:	db  12h, 13h, 2Bh, 12h,	13h, 26h, 12h, 13h, 2Bh, 12h, 13h, 2Fh,	24h, 13h, 32h, 24h; 0
					; DATA XREF: CheckGameRestart7890-2C4Eo
		db  13h, 26h, 24h, 18h,	28h, 12h, 18h, 30h, 12h, 18h, 2Fh, 12h,	18h, 30h, 12h, 18h; 16
		db  2Fh, 24h, 18h, 2Dh,	12h, 1Ah, 2Dh, 12h, 1Ah, 2Ah, 12h, 1Ah,	2Bh, 24h, 1Ah, 2Dh; 32
		db  12h, 1Ah, 2Ah, 24h,	1Ah, 26h, 24h, 13h, 30h, 12h, 13h, 30h,	36h, 13h, 2Fh, 24h; 48
		db  13h, 2Bh, 12h, 13h,	2Bh, 12h, 13h, 26h, 12h, 13h, 2Bh, 12h,	13h, 2Fh, 24h, 13h; 64
		db  32h, 24h, 13h, 26h,	24h, 18h, 28h, 12h, 18h, 30h, 12h, 18h,	2Fh, 12h, 18h, 30h; 80
		db  12h, 18h, 2Fh, 24h,	18h, 2Dh, 12h, 1Ah, 2Dh, 12h, 1Ah, 2Ah,	12h, 1Ah, 2Bh, 24h; 96
		db  1Ah, 2Dh, 12h, 1Ah,	2Ah, 24h, 1Ah, 26h, 24h, 13h, 30h, 12h,	13h, 30h, 36h, 13h; 112
		db  2Fh, 24h, 13h, 2Dh,	24h, 10h, 2Bh, 24h, 10h, 23h, 24h, 10h,	2Bh, 12h, 10h, 23h; 128
		db  24h, 10h, 2Fh, 12h,	10h, 23h, 12h, 10h, 2Fh, 12h, 10h, 23h,	12h, 10h, 2Dh, 12h; 144
		db  10h, 23h, 12h, 10h,	2Bh, 12h, 10h, 23h, 24h, 0Ch, 2Bh, 24h,	0Ch, 24h, 24h, 0Ch; 160
		db  2Bh, 12h, 0Ch, 24h,	24h, 0Ch, 2Fh, 12h, 0Ch, 24h, 12h, 0Ch,	2Fh, 12h, 0Ch, 24h; 176
		db  12h, 0Ch, 2Dh, 12h,	0Ch, 24h, 12h, 0Ch, 2Bh, 12h, 0Ch, 24h,	24h, 10h, 2Bh, 24h; 192
		db  10h, 23h, 24h, 10h,	2Bh, 12h, 10h, 23h, 24h, 10h, 2Fh, 12h,	10h, 23h, 12h, 10h; 208
		db  2Fh, 12h, 10h, 23h,	12h, 10h, 2Dh, 12h, 10h, 23h, 12h, 10h,	2Bh, 12h, 10h, 23h; 224
		db  24h, 0Ch, 2Bh, 24h,	0Ch, 24h, 24h, 0Ch, 2Bh, 12h, 0Ch, 24h,	24h, 0Ch, 2Fh, 12h; 240
		db  0Ch, 24h, 12h, 0Ch,	2Fh, 12h, 0Ch, 24h, 12h, 0Ch, 2Dh, 12h,	0Ch, 24h, 12h, 0Ch; 256
		db  2Bh, 12h, 0Ch, 24h,	24h, 10h, 2Fh, 24h, 10h, 30h, 12h, 10h,	2Dh, 24h, 10h, 2Fh; 272
		db  24h, 10h, 2Bh, 24h,	10h, 2Dh, 24h, 10h, 2Ah, 12h, 10h, 2Fh,	24h, 10h, 28h, 24h; 288
		db  10h, 2Fh, 24h, 10h,	30h, 12h, 10h, 2Dh, 24h, 10h, 2Fh, 24h,	10h, 2Bh, 24h, 10h; 304
		db  2Dh, 24h, 10h, 2Ah,	12h, 10h, 2Fh, 24h, 10h, 28h, 24h, 0Ch,	2Dh, 12h, 0Ch, 2Dh; 320
		db  5Ah, 0Ch, 2Bh, 24h,	0Ch, 18h, 12h, 0Ch, 2Bh, 24h, 0Ch, 2Dh,	12h, 0Ch, 2Dh, 24h; 336
		db  0Ch, 2Bh, 24h,   7,	28h, 12h,   7, 28h, 5Ah,   7, 26h, 24h,	  7, 13h, 12h,	 7; 352
		db  26h, 24h,	7, 28h,	12h,   7, 28h, 24h,   7, 26h, 24h, 10h,	2Fh, 24h, 10h, 30h; 368
		db  12h, 10h, 2Dh, 24h,	10h, 2Fh, 24h, 10h, 2Bh, 24h, 10h, 2Dh,	24h, 10h, 2Ah, 12h; 384
		db  10h, 2Fh, 24h, 10h,	28h, 24h, 10h, 2Fh, 24h, 10h, 30h, 12h,	10h, 2Dh, 24h, 10h; 400
		db  2Fh, 24h, 10h, 2Bh,	24h, 10h, 2Dh, 24h, 10h, 2Ah, 12h, 10h,	2Fh, 24h, 10h, 28h; 416
		db  24h, 0Ch, 2Dh, 12h,	0Ch, 2Dh, 5Ah, 0Ch, 2Bh, 24h, 0Ch, 18h,	12h, 0Ch, 2Bh, 24h; 432
		db  0Ch, 2Dh, 12h, 0Ch,	2Dh, 24h, 0Ch, 2Bh, 24h,   7, 28h, 12h,	  7, 28h, 5Ah,	 7; 448
		db  26h, 24h,	7, 13h,	12h,   7, 26h, 24h,   7, 28h, 12h,   7,	26h, 12h,   7, 28h; 464
		db  12h,   7, 26h, 48h,	11h, 24h, 48h, 11h, 21h, 24h, 11h, 24h,	12h, 11h, 21h, 24h; 480
		db  11h, 24h, 12h, 11h,	21h, 12h, 11h, 28h, 12h, 11h, 26h, 48h,	0Ch, 24h, 48h, 0Ch; 496
		db  1Fh, 24h, 0Ch, 24h,	12h, 0Ch, 1Fh, 24h, 0Ch, 24h, 12h, 0Ch,	1Fh, 12h, 0Ch, 28h; 512
		db  12h, 0Ch, 26h, 24h,	11h, 24h, 24h, 11h, 21h, 24h, 11h, 24h,	24h, 11h, 21h, 24h; 528
		db  11h, 24h, 12h, 11h,	21h, 24h, 11h, 24h, 12h, 11h, 21h, 12h,	11h, 28h, 12h, 11h; 544
		db  26h, 24h, 0Ch, 24h,	24h, 0Ch, 1Fh, 24h, 0Ch, 24h, 24h, 0Ch,	1Fh, 12h, 0Ch, 24h; 560
		db  12h, 0Ch, 30h, 12h,	0Ch, 30h, 24h, 0Ch, 24h,   0,	0; 576
byte_7FEE:	db 0EEh			; DATA XREF: playBeeperMusic+1Fw
					; playBeeperMusic+2Er ...
NoteAddr?:	dw 0			; DATA XREF: playBeeperMusic+8w
					; playBeeperMusic:loc_7D2Dr ...
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_8004
		.assert loc_7FF1==0x7FF1

loc_7FF1:				; CODE XREF: sub_8004+11 j
		and	0FFh
		ex	af, af'
		inc	d
		jp	nz, loc_801F

loc_7FF8:				; CODE XREF: sub_8004+18 j
		nop
		nop
		nop
		xor	c
		ld	d, l
		djnz	loc_800E
		dec	h
		jp	nz, loc_8010
		ret
; END OF FUNCTION CHUNK	FOR sub_8004

; =============== S U B	R O U T	I N E =======================================


sub_8004:				; CODE XREF: playBeeperMusic+31p

; FUNCTION CHUNK AT 7FF1 SIZE 00000013 BYTES

		ld	h, a
		ld	ixl, e
		ld	l, d
		ld	c, 10h
		xor	a
		ex	af, af'
		xor	a
		ld	b, a

loc_800E:				; CODE XREF: sub_8004-7j sub_8004+20 j
		or	a
		and	a

loc_8010:				; CODE XREF: sub_8004-4j sub_8004+23 j
		ex	af, af'
		inc	e
		nop
		nop
		nop
		jr	nz, loc_7FF1
		xor	c
		ld	e, ixl
		ex	af, af'
		inc	d
		jp	z, loc_7FF8

loc_801F:				; CODE XREF: sub_8004-Fj
		nop
		nop
		nop
		or	a
		and	a
		djnz	loc_800E
		dec	h
		jp	nz, loc_8010
		ret
; End of function sub_8004

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_803D

loc_802B:				; CODE XREF: sub_803D+10 j
		and	0FFh
		ex	af, af'
		inc	d
		jp	nz, loc_8057

loc_8032:				; CODE XREF: sub_803D+17 j
		out	(0FEh),	a
		xor	c
		ld	d, l
		djnz	loc_8047
		dec	h
		jp	nz, loc_8049
		ret
; END OF FUNCTION CHUNK	FOR sub_803D

; =============== S U B	R O U T	I N E =======================================


sub_803D:				; CODE XREF: playBeeperMusic+4Ap

; FUNCTION CHUNK AT 802B SIZE 00000012 BYTES

		ld	h, a
		ld	ixl, e
		ld	l, d
		ld	c, 10h
		xor	a
		ex	af, af'
		xor	a
		ld	b, a

loc_8047:				; CODE XREF: sub_803D-7j sub_803D+1E j
		or	a
		and	a

loc_8049:				; CODE XREF: sub_803D-4j sub_803D+21 j
		ex	af, af'
		inc	e
		out	(0FEh),	a
		jr	nz, loc_802B
		xor	c
		ld	e, ixl
		ex	af, af'
		inc	d
		jp	z, loc_8032

loc_8057:				; CODE XREF: sub_803D-Ej
		out	(0FEh),	a
		or	a
		and	a
		djnz	loc_8047
		dec	h
		jp	nz, loc_8049
		ret
; End of function sub_803D

; ---------------------------------------------------------------------------
byte_8062:	db   1,	16, 29,	41, 52,	64, 76,	84, 95,105,112,120,128,135,142,148; 0
					; DATA XREF: playBeeperMusic+3Ao
					; playBeeperMusic+42o
		db 154,160,165,170,175,180,184,188,192,195,199,202,205,208,211,213; 16
		db 216,218,220,222,224,226,228,229,231,232,233,235,236,237,238,239; 32
		db 240,241,242,243,244	; 48

; =============== S U B	R O U T	I N E =======================================

; in:
; d - y	(0..23)
; e - x	(0..31)
; out:
; hl=Y*32+X

textXY2TABLEOFFSET?:			; CODE XREF: starsAnimationStep+31p
					; highLightSelectedContorol+9p	...
		ld	a, d
		sra	a
		sra	a
		sra	a
		ld	h, a		; y/8
;
		ld	a, d
		and	111b		; 0000111 -> 11100000
		rrca
		rrca
		rrca
		add	a, e		; y/8+x
;
		ld	l, a
;
		ret
; End of function textXY2TABLEOFFSET?

; ---------------------------------------------------------------------------
		push	af
		push	de
;
		ld	a, e
		and	1111100b
		rrca
		rrca
		ld	e, a		; x/4
;
		ld	a, d
		and	11111000b
		rrca
		rrca
		rrca
		ld	d, a		; y/8
;
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, over_player_tab
		add	hl, de
		pop	de
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================

; d-y (0..191) ,e-x (0..127)
; ret
; hl-NoWalkaddr

getNowalkAddrForXY:			; CODE XREF: sub_80F3+11 p sub_8122+10 p ...
		push	af
		push	de
		ld	a, e		; x
		and	1111100b
		rrca
		rrca
		ld	e, a		; x/4
;
		ld	a, d
		and	11111000b
		rrca
		rrca
		rrca
		ld	d, a		; y/8
;
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, no_walk_tab	; ?AnimationTab?
		add	hl, de
		pop	de
		pop	af
		ret
; End of function getNowalkAddrForXY


; =============== S U B	R O U T	I N E =======================================

; d-y (0..191) ,e-x (0..127)
; ret
; hl-AttrTableCopy

getATTR_TABLE_COPY_for_XY:		; CODE XREF: sub_7C5F:loc_7CA7p
		push	af
		push	de
;
		ld	a, e
		and	1111100b
		rrca
		rrca
		ld	e, a		; x/4
;
		ld	a, d
		and	11111000b
		rrca
		rrca
		rrca
		ld	d, a		; y/8
;
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE_COPY
		add	hl, de
		pop	de
		pop	af
		ret
; End of function getATTR_TABLE_COPY_for_XY


; =============== S U B	R O U T	I N E =======================================


sub_80F3:				; CODE XREF: sub_81A4:loc_8218 p
					; sub_81A4+126 p
		push	bc
		push	de
		push	hl
		ld	a, e
		cp	74h ; 't'
		ld	a, 0
		jr	nc, loc_811D
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_811D
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		inc	l
		inc	l
		inc	l
		ld	bc, 20h	; ' '
		ld	a, (hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_811D
		add	hl, bc
		or	(hl)

loc_811D:				; CODE XREF: sub_80F3+8j sub_80F3+Fj ...
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_80F3


; =============== S U B	R O U T	I N E =======================================


sub_8122:				; CODE XREF: sub_81A4+6F p
					; sub_81A4+118 p
		push	bc
		push	de
		push	hl
		ld	a, e
		or	a
		ld	a, 1
		jr	z, loc_8149
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_8149
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		dec	l
		ld	bc, 20h	; ' '
		ld	a, (hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		add	hl, bc
		or	(hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_8149
		add	hl, bc
		or	(hl)

loc_8149:				; CODE XREF: sub_8122+7j sub_8122+Ej ...
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_8122


; =============== S U B	R O U T	I N E =======================================


sub_814E:				; CODE XREF: sub_81A4+18 p sub_81A4+37 p ...
		push	bc
		push	de
		push	hl
;
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_8174
;
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, 128		; 4*32
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		cp	74h ; 't'
		ld	a, d
		jr	nc, loc_8174
		inc	l
		or	(hl)
		inc	l
		or	(hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_8174
		inc	l
		or	(hl)

loc_8174:				; CODE XREF: sub_814E+8j sub_814E+17j	...
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_814E


; =============== S U B	R O U T	I N E =======================================


sub_8179:				; CODE XREF: sub_81A4:loc_81FB p
		push	bc
		push	de
		push	hl
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_819F
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, 0FFE0h
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		cp	74h ; 't'
		ld	a, d
		jr	nc, loc_819F
		inc	l
		or	(hl)
		inc	l
		or	(hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_819F
		inc	l
		or	(hl)

loc_819F:				; CODE XREF: sub_8179+8j sub_8179+17j	...
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_8179


; =============== S U B	R O U T	I N E =======================================


sub_81A4:				; CODE XREF: CheckGameRestart7890-244Ep

; FUNCTION CHUNK AT 8280 SIZE 00000014 BYTES
; FUNCTION CHUNK AT 8295 SIZE 0000005D BYTES

		call	nopIfPlayerDie
		xor	a
		ld	(UpdateZoneRequired), a
		ld	de, (Player_X_Pos) ; 0..127
;
		ld	a, (byte_8294)
		or	a
		jp	nz, loc_8280
;
		ld	a, (byte_82F7)
		or	a
		jr	nz, loc_81E3
;
		call	sub_814E
		jp	z, loc_8280
;
		ld	a, 0FAh	; 'ú'
		ld	(byte_82FB), a
;
		ld	a, (fl_UP)
		or	a
		ld	a, 10
		jp	nz, ShowPlayerSprite?? ; a  - sprite
;
		xor	a
		ld	(byte_82FB), a
;
		ld	a, (fl_DOWN)
		or	a
		jp	z, loc_8280
;
		call	sub_814E
		jp	z, loc_8280
;
		ld	a, 22

loc_81E3:				; CODE XREF: sub_81A4+16j
		ld	hl, byte_8269
		ld	c, a
		ld	b, 0
		dec	a
		ld	(byte_82F7), a
		add	hl, bc
		ld	a, (hl)
		or	a
		jr	z, loc_820A
		cp	0Ah
		jr	nc, loc_81FB
		call	sub_814E
		jr	loc_81FE
; ---------------------------------------------------------------------------

loc_81FB:				; CODE XREF: sub_81A4+50j
		call	sub_8179

loc_81FE:				; CODE XREF: sub_81A4+55j
		jr	z, loc_8207
		xor	a
		ld	(byte_82F7), a
		jp	loc_8280
; ---------------------------------------------------------------------------

loc_8207:				; CODE XREF: sub_81A4:loc_81FEj
		ld	a, (hl)
		add	a, d
		ld	d, a

loc_820A:				; CODE XREF: sub_81A4+4Cj
		ld	a, (byte_82F8)
		or	a
		jr	z, loc_8222
		dec	a
		jr	z, loc_8218
		call	sub_8122
		jr	loc_821B
; ---------------------------------------------------------------------------

loc_8218:				; CODE XREF: sub_81A4+6Dj
		call	sub_80F3

loc_821B:				; CODE XREF: sub_81A4+72j
		jr	nz, loc_8222
		ld	a, (byte_82F8)
		add	a, e
		ld	e, a

loc_8222:				; CODE XREF: sub_81A4+6Aj
					; sub_81A4:loc_821Bj
		ld	a, 3
; End of function sub_81A4


; =============== S U B	R O U T	I N E =======================================

; a  - sprite

ShowPlayerSprite??:			; CODE XREF: sub_81A4+29j sub_81A4+EE j ...
		ld	c, a
		ld	a, (SuperShieldFlag)
		add	a, c
; End of function ShowPlayerSprite??


; =============== S U B	R O U T	I N E =======================================


show32xsprite:				; CODE XREF: chkBoxAmoGrenade?+4F p
					; chkBoxAmoGrenade?+A5 p
		ex	af, af'
		ld	a, e
		cp	128
		ld	a, d
		jr	z, nextZONEPrepare ; A - player	Y pos
;
		ld	c, 47h ; 'G'
		ex	af, af'
		call	sub_7C5F
;
		ld	bc, (Player_X_Pos) ; 0..127
		ld	(Player_X_Pos),	de ; 0..127
;
		ld	hl, (byte_8269)
		cp	l
		jr	nz, loc_824A
		ld	h, b
		ld	l, c
		and	a
		sbc	hl, de
		ret	z

loc_824A:				; CODE XREF: show32xsprite+19j
		ld	(byte_8269), a
		ld	hl, Sprite_BUFFER???
		jp	Sprite24x32_Player ;
; End of function show32xsprite		; 00-09	- WALK
					; 10 - Duck
					; 11 - DIE
					; 12-21	WALK 2gun
					; 22 - Duck2gun
					; 23 - Die 2gun
					; 24 - PUMP
					;

; =============== S U B	R O U T	I N E =======================================

; A - player Y pos

nextZONEPrepare:			; CODE XREF: show32xsprite+5j
					; chkEndLevel???+9E p
		ld	(Player_Y_Pos),	a ; 0x70 - ground
		ld	(PlayerXY_COPY+1), a
;
		ld	(UpdateZoneRequired), a
;
		ld	a, (_ZONE)
		inc	a
		ld	(_ZONE), a
;
		ld	a, 0FFh
		ld	(byte_8269), a
		ret
; End of function nextZONEPrepare

; ---------------------------------------------------------------------------
byte_8269:	db 0			; DATA XREF: CheckGameRestart7890-2486w
					; sub_81A4:loc_81E3o ...
		db    4,   4,	2,   2,	  2,   1,   1,	 1,   1; 0
		db    0,   0,	0,   0	; 0
		db    -1,   -1,	  -1,	-1,   -2,   -2,	  -2,	-4,   -4; 0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_81A4

loc_8280:				; CODE XREF: sub_81A4+Fj sub_81A4+1Bj	...
		xor	a
		ld	(byte_8294), a
		call	sub_814E
		jr	nz, loc_8295
		inc	d
		inc	d
		inc	d
		inc	d
		ld	a, 9
		ld	(byte_8294), a
		jr	ShowPlayerSprite?? ; a	- sprite
; END OF FUNCTION CHUNK	FOR sub_81A4
; ---------------------------------------------------------------------------
byte_8294:	db 0			; DATA XREF: sub_81A4+Br sub_81A4+DDw	...
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_81A4

loc_8295:				; CODE XREF: sub_81A4+E3j
		ld	hl, (fl_RIGHT)
		ld	a, h
		xor	l
		ld	(byte_82F8), a
		ld	a, 5
		jp	z, ShowPlayerSprite?? ;	a  - sprite
		ld	a, 1
		ld	(byte_82FA), a
		bit	0, l
		jr	z, loc_82C1
		ld	a, 0FFh
		ld	(byte_82F8), a
		ld	(byte_82FA), a
		ld	a, (BigSpriteLeftRightFlag??) ;	0 - to right, 1	- to left
		or	a
		call	z, swapBigSprite ; Swap	sprites	to left/right when move	in left/right directions
		jr	z, loc_82E8
		call	sub_8122
		jr	loc_82CD
; ---------------------------------------------------------------------------

loc_82C1:				; CODE XREF: sub_81A4+105j
		ld	a, (BigSpriteLeftRightFlag??) ;	0 - to right, 1	- to left
		or	a
		call	nz, swapBigSprite ; Swap sprites to left/right when move in left/right directions
		jr	nz, loc_82E8
		call	sub_80F3

loc_82CD:				; CODE XREF: sub_81A4+11Bj
		ld	a, 5
		jp	nz, ShowPlayerSprite?? ; a  - sprite
		ld	a, (byte_82F8)
		add	a, e
		ld	e, a
		ld	a, (byte_82F9)
		cp	0Ah
		jr	nz, loc_82DF
		xor	a

loc_82DF:				; CODE XREF: sub_81A4+138j
		ld	b, a
		inc	a
		ld	(byte_82F9), a
		ld	a, b
		jp	ShowPlayerSprite?? ; a	- sprite
; ---------------------------------------------------------------------------

loc_82E8:				; CODE XREF: sub_81A4+116j
					; sub_81A4+124j
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, 5
		jp	ShowPlayerSprite?? ; a	- sprite
; END OF FUNCTION CHUNK	FOR sub_81A4
; ---------------------------------------------------------------------------
UpdateZoneRequired:db 0			; DATA XREF: sub_81A4+4w
					; nextZONEPrepare+6w ...
PlayerXY_COPY:	dw 0			; DATA XREF: CheckGameRestart7890-246Ew
					; doNewZone+9 w	...
Player_X_Pos:	db 0			; DATA XREF: CheckGameRestart7890-2471w
					; sub_81A4+7r ...
					; 0..127
Player_Y_Pos:	db 0			; DATA XREF: nextZONEPreparew
					; chkFire?+48 r	...
					; 0x70 - ground
byte_82F7:	db 0			; DATA XREF: CheckGameRestart7890-247Bw
					; sub_81A4+12r	...
byte_82F8:	db 1			; DATA XREF: sub_81A4:loc_820Ar
					; sub_81A4+79r	...
byte_82F9:	db 0			; DATA XREF: sub_81A4+133r
					; sub_81A4+13Dw
byte_82FA:	db 1			; DATA XREF: CheckGameRestart7890-2477w
					; sub_81A4+100w ...
byte_82FB:	db 0			; DATA XREF: sub_81A4+20w sub_81A4+2Dw ...

; =============== S U B	R O U T	I N E =======================================


sub_82FC:				; CODE XREF: sub_8391+43 j
					; __move__???+1B p ...
		push	af
		push	bc
		push	hl
		push	de
		ld	l, 0BDh	; '½'
		ld	h, 0
		ld	a, e
		cpl
		and	3
		inc	a
		ld	b, a

loc_830A:				; CODE XREF: sub_82FC+10 j
		add	hl, hl
		add	hl, hl
		djnz	loc_830A
		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		pop	de
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, e
		xor	(hl)
		ld	(hl), a
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	bc, ATTR_TABLE_COPY
		add	hl, bc
		ld	a, (hl)
		dec	l
		or	(hl)
		jr	nz, loc_8333
;
		ld	bc,  SPRITES+120h
		add	hl, bc
		ld	(hl), 1000111b
		inc	l
		ld	(hl), 1000111b

loc_8333:				; CODE XREF: sub_82FC+2Cj
		pop	de
		pop	hl
		pop	bc
		pop	af
		ret
; End of function sub_82FC


; =============== S U B	R O U T	I N E =======================================


chkFire?:				; CODE XREF: CheckGameRestart7890-2448p
		call	nopIfPlayerDie
;
		ld	a, (Player_X_Pos) ; 0..127
		cp	118
		jr	c, loc_8347
		xor	a
		ld	(byte_7B98), a
		ret
; ---------------------------------------------------------------------------

loc_8347:				; CODE XREF: chkFire?+8j
		ld	a, (fl_FIRE)
		or	a
		jr	nz, loc_8351
		ld	(byte_83DC), a
		ret
; ---------------------------------------------------------------------------

loc_8351:				; CODE XREF: chkFire?+13j
		ld	a, (byte_83DC)
		or	a
		jr	z, loc_835D
		inc	a
		ret	z
		ld	(byte_83DC), a
		ret
; ---------------------------------------------------------------------------

loc_835D:				; CODE XREF: chkFire?+1Dj
		inc	a
		ld	(byte_83DC), a
;
		ld	a, (_AMMO)
		or	a
		ret	z
;
		ld	b, 3Ch ; '<'
		call	sound48
;
		ld	a, (_AMMO)
		dec	a
		ld	(_AMMO), a
;
		call	snd_player_shot
		call	showAMMO
		call	sub_8391
		ld	a, (SuperShieldFlag)
		or	a

CHEAT_DOUBLE_FIRE:			; replace to NOP for doublefire
		ret	z
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		push	af
		add	a, 6
		ld	(Player_Y_Pos),	a ; 0x70 - ground
		call	sub_8391
		pop	af
		ld	(Player_Y_Pos),	a ; 0x70 - ground
		ret
; End of function chkFire?


; =============== S U B	R O U T	I N E =======================================


sub_8391:				; CODE XREF: chkFire?+40p chkFire?+51p
		ld	hl, stru_845F

loc_8394:				; CODE XREF: sub_8391+B j
		bit	7, (hl)
		ret	nz
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	nz, loc_8394
		dec	hl
		ld	a, (byte_82FA)
		ld	(hl), a
		ld	de, (Player_X_Pos) ; 0..127
		ld	a, (byte_82FB)
		or	a
		ld	a, 0Eh
		jr	z, loc_83B1
		ld	a, 13h

loc_83B1:				; CODE XREF: sub_8391+1Cj
		add	a, d
		ld	d, a
		dec	hl
		ld	(hl), d
		dec	hl
		ld	a, (byte_82FA)
		inc	a
		or	a
		ld	a, 0FCh	; 'ü'
		jr	z, loc_83C1
		ld	a, 0Ch

loc_83C1:				; CODE XREF: sub_8391+2Cj
		add	a, e
		ld	e, a
		cp	78h ; 'x'
		jr	nc, loc_83D7
		cp	4
		jr	c, loc_83D7
		ld	(hl), e
		push	hl
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	a, (hl)
		inc	l
		or	(hl)
		pop	hl
		jp	z, sub_82FC

loc_83D7:				; CODE XREF: sub_8391+34j sub_8391+38j
		inc	hl
		inc	hl
		ld	(hl), 0
		ret
; End of function sub_8391

; ---------------------------------------------------------------------------
byte_83DC:	db 0			; DATA XREF: chkFire?+15w
					; chkFire?:loc_8351r ...

; =============== S U B	R O U T	I N E =======================================


__move__???:				; CODE XREF: CheckGameRestart7890-2445p
					; CheckGameRestart7890-2433p ...
		call	moveSpheres?
		call	moveShotLeft?
		call	moveEnemy?
		call	chkBeamDestroy?????
;
		ld	hl, stru_845F

loc_83EC:				; CODE XREF: __move__???+19 j
					; __move__???+65 j ...
		ld	e, (hl)
		bit	7, e
		ret	nz
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_83EC
		call	sub_82FC
		ld	b, a
		ld	c, d
		ld	a, d
		and	0F8h ; 'ø'
		ld	d, a
		ld	a, b
		inc	a
		jr	nz, loc_840F
		call	sub_9382
		call	nz, snd_single_shot_to_item
		jr	nz, loc_8444
		jr	loc_841C
; ---------------------------------------------------------------------------

loc_840F:				; CODE XREF: __move__???+26j
		ld	a, e
		cp	7Ch ; '|'
		jr	z, loc_8459
		call	sub_9362
		call	nz, snd_single_shot_to_item
		jr	nz, loc_8444

loc_841C:				; CODE XREF: __move__???+30j
		ld	d, c
		ld	a, e
		cp	124
		jr	z, loc_8459
		cp	1
		jr	z, loc_8459
		ld	a, (Player_X_Pos) ; 0..127
		add	a, 64
		cp	e
		jr	z, loc_8459
		ld	a, (Player_X_Pos) ; 0..127
		sub	52
		cp	e
		jr	z, loc_8459
		ld	a, b
		add	a, e
		ld	e, a
		push	hl
		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		call	sub_82FC
		jr	loc_83EC
; ---------------------------------------------------------------------------

loc_8444:				; CODE XREF: __move__???+2Ej
					; __move__???+3Dj
		dec	hl
		ld	(hl), 0
		inc	hl
		ld	d, c
		call	addToParticleList
		ld	b, 20

loc_844E:				; CODE XREF: __move__???+78 j
		push	bc
		ld	b, 20
		call	sound48
		pop	bc
		djnz	loc_844E
		jr	loc_83EC
; ---------------------------------------------------------------------------

loc_8459:				; CODE XREF: __move__???+35j
					; __move__???+43j ...
		dec	hl
		ld	(hl), 0
		inc	hl
		jr	loc_83EC
; End of function __move__???

; ---------------------------------------------------------------------------
		.assert $==0x845F


stru_845F:
		ds 	8*3
; 		strXYF <0>		; DATA XREF: sub_8391o	__move__???+Co	...
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrBUF845F:				; CODE XREF: ShowZone2Screen+19 p
		ld	hl, stru_845F
		ld	de, stru_845F+1
		ld	bc, 23
		ld	(hl), b
		ldir
		ret
; End of function clrBUF845F


; =============== S U B	R O U T	I N E =======================================


doNewZone:				; CODE XREF: CheckGameRestart7890-244Bp
					; chkEndLevel???+A1 p
		ld	a, (UpdateZoneRequired)
		or	a
		ret	z
;
		xor	a
		ld	(Player_X_Pos),	a ; 0..127
		ld	(PlayerXY_COPY), a
;
		call	showZONE
; End of function doNewZone


; =============== S U B	R O U T	I N E =======================================


ShowZone2Screen:			; CODE XREF: CheckGameRestart7890-245Ep

; FUNCTION CHUNK AT AB97 SIZE 00000035 BYTES

		ld	hl, 0
		ld	(cntrDW), hl
		xor	a
		ld	(byte_925A), a
		ld	(dead_sprite_delay2??),	a
		ld	(flLongDelayKiller), a
;
		call	clr_Sprite_BUFFER???
		call	clr_over_player_tab
		call	clr_no_walk_tab
		call	clrBUF845F
		call	clrBUF90CB
		call	clrMineBuf
		call	clr_PariclesBuf
		call	clrMacineGun
		call	clr_boomParticles?
		call	clrSpheresBuf?
		call	clrPump?
		call	clrBUF9E18
		call	clrBUF9F13
		call	clrEnemyData
		call	clrBUFA00C
		call	clrBONUSBUF
		call	ClearPlayArea
;
		ld	a, (_ZONE)
		ld	bc, ZONE_TAB
		call	get_hl_a_BC
;
		ld	ix, destroyableBuffer?

ShowLevelLoop:				; CODE XREF: ShowZone2Screen+73 j
		ld	a, (hl)
		cp	0FFh
		jr	z, endLVL
		ld	d, a		; y
		inc	hl
		ld	e, (hl)		; x
		inc	hl
		push	hl
		ld	a, (hl)		; block
		call	prepareDestoryableObject ; ix -	buffer
					; a - block id
;
		ld	bc, xZoneBlock
		call	get_hl_a_BC
;
		ld	a, 1
		ld	(noWalkFlag+1),	a
;
		xor	a
		ld	(overPlayerFlag+1), a
;
		ld	c, a
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		pop	hl
		inc	hl
		jp	ShowLevelLoop
; ---------------------------------------------------------------------------

endLVL:					; CODE XREF: ShowZone2Screen+53j
		ld	(ix+0),	0FFh
;
		call	_save_attr_table
		call	randomStars
		call	init_Level_Actions
		call	init_Spheres
		call	prepareEnemy???
		call	sub_A23A
		jp	ShowBEAM
; End of function ShowZone2Screen

; ---------------------------------------------------------------------------
_ZONE:		db 0			; DATA XREF: CheckGameRestart7890-2CA4w
					; nextZONEPrepare+9r ...

; =============== S U B	R O U T	I N E =======================================


get_hl_a_BC:				; CODE XREF: ShowZone2Screen+49p
					; ShowZone2Screen+61p ...
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; End of function get_hl_a_BC


	include 	"zone_blocks.asm"

; =============== S U B	R O U T	I N E =======================================


clr_no_walk_tab:			; CODE XREF: CheckGameRestart7890-2C75p
					; CheckGameRestart7890-2A68p ...
		ld	hl, no_walk_tab	; ?AnimationTab?
		ld	de,  no_walk_tab+1 ; ?AnimationTab?
		ld	bc, 703
		ld	(hl), 0
		ldir
		ret
; End of function clr_no_walk_tab


; =============== S U B	R O U T	I N E =======================================


clr_over_player_tab:			; CODE XREF: CheckGameRestart7890-2C72p
					; CheckGameRestart7890-2A65p ...
		ld	hl, over_player_tab
		ld	de,  over_player_tab+1
		ld	bc, 703
		ld	(hl), 0FFh
		ldir
		ret
; End of function clr_over_player_tab


; =============== S U B	R O U T	I N E =======================================


_save_attr_table:			; CODE XREF: CheckGameRestart7890:skipBeeperMenuMsicp
					; CheckGameRestart7890-2A53p ...
		ld	de, ATTR_TABLE_COPY
		ld	hl, ATTR_TABLE
		ld	bc, 768
		ldir
		ret
; End of function _save_attr_table

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR showAMMO

show_3digit:				; CODE XREF: showAMMO+8 j
					; showGRENADES+8 j
		push	bc
		push	hl
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
		ld	b, 100
		call	sub_8E37
		ld	b, 10
		call	sub_8E37
		ld	b, 1
		call	sub_8E37
		pop	hl
		pop	bc
		ret
; END OF FUNCTION CHUNK	FOR showAMMO

; =============== S U B	R O U T	I N E =======================================


sub_8E37:				; CODE XREF: showAMMO-28p showAMMO-23p ...
		ld	l, 0

loc_8E39:				; CODE XREF: sub_8E37+6 j
		sub	b
		jr	c, loc_8E3F
		inc	l
		jr	loc_8E39
; ---------------------------------------------------------------------------

loc_8E3F:				; CODE XREF: sub_8E37+3j
		add	a, b
		push	af
		ld	a, b
		cp	100
		jr	z, loc_8E4D
		ld	a, l
		add	a, '0'
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		inc	e

loc_8E4D:				; CODE XREF: sub_8E37+Dj
		pop	af
		ret
; End of function sub_8E37


; =============== S U B	R O U T	I N E =======================================


showAMMO:				; CODE XREF: show2BottomLine+6p
					; chkFire?+3Dp	...

; FUNCTION CHUNK AT 8E1D SIZE 0000001A BYTES

		ld	a, (_AMMO)
		ld	de, 1701h
		ld	c, 47h ; 'G'
		jp	show_3digit
; End of function showAMMO

; ---------------------------------------------------------------------------
_AMMO:		db 63h			; DATA XREF: CheckGameRestart7890-2469w
					; chkFire?+29r	...

; =============== S U B	R O U T	I N E =======================================


showGRENADES:				; CODE XREF: show2BottomLine+9p
					; chkGrenades?+4F j ...
		ld	a, (_GRENADES)
		ld	de, 1708h
		ld	c, 43h ; 'C'
		jp	show_3digit
; End of function showGRENADES

; ---------------------------------------------------------------------------
_GRENADES:	db 0Ah			; DATA XREF: CheckGameRestart7890-2464w
					; showGRENADESr ...

; =============== S U B	R O U T	I N E =======================================


showLIVES:				; CODE XREF: show2BottomLine+Cp
					; RAM:9D31 p
		ld	a, (LIVES?)
		add	a, '0'
		ld	de, 1717h
		ld	c, 46h ; 'F'
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
		jp	putChar		; A - chr
; End of function showLIVES		; C - COLOR
					; E-X
					; D-Y
; ---------------------------------------------------------------------------
LIVES?:		db 9			; DATA XREF: CheckGameRestart7890-2C82w
					; showLIVESr ...

; =============== S U B	R O U T	I N E =======================================


showZONE:				; CODE XREF: show2BottomLine+Fj
					; doNewZone+Cp

; FUNCTION CHUNK AT B0C6 SIZE 0000001A BYTES

		ld	a, (_ZONE)
		ld	de, 171Ch
		ld	c, 46h ; 'F'
		jp	show_A
; End of function showZONE


; =============== S U B	R O U T	I N E =======================================


init_Level_Actions:			; CODE XREF: ShowZone2Screen+80p
		ld	hl, AnimInitTab	; Objects with code 2..16
		ld	b, 16

loc_8E8B:				; CODE XREF: init_Level_Actions+12 j
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
;
		ld	a, 0FFh		; set animation	OFF
		ld	(de), a
;
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		inc	hl
		inc	hl
		djnz	loc_8E8B
;
		ld	hl, no_walk_tab	; ?AnimationTab?
		ld	bc, 704

chk_animation_loop:			; CODE XREF: init_Level_Actions+24 j
		ld	a, (hl)
		cp	2
		call	nc, addCoordToAnimTab ;	a - code
					; hl - noWalkTab
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jr	nz, chk_animation_loop
		ret
; End of function init_Level_Actions


; =============== S U B	R O U T	I N E =======================================

; a - code
; hl - noWalkTab

addCoordToAnimTab:			; CODE XREF: init_Level_Actions+1Dp
		push	bc
		push	hl
		ex	af, af'
		ld	de, -6100h
		add	hl, de
;
		ld	a, l
		and	1Fh
		ld	e, a		; x
;
		ld	a, l
		srl	h
		rra
		srl	h
		rra
		and	0F8h ; 'ø'
		rrca
		rrca
		rrca
		ld	d, a		; y
;
		ex	af, af'
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	b, h
		ld	c, l
		add	hl, hl		; a*6
		add	hl, bc
;
		ld	bc, AnimInitTab_MINUS_12 ; AnimInitTab-(6*2) (code starts from 2)
		add	hl, bc
;
		push	hl
		pop	ix
;
		ld	l, (ix+2)	; getNextAddr
		ld	h, (ix+3)
;
		ld	(hl), e		; writeXY to next str record
		inc	hl
		ld	(hl), d
;
		ld	c, (ix+4)	; add str size
		ld	b, 0
		dec	c
		add	hl, bc
		ld	(ix+2),	l	; ptr to next str record

AnimInitTab_MINUS_12:			; DATA XREF: addCoordToAnimTab+21o
		ld	(ix+3),	h
;
		ld	(hl), 0FFh	; termination
;
		pop	hl
;
		ld	a, (ix+5)
		ld	(hl), a		; replace code in noWalkTab, mute animation?
		pop	bc
		ret
; End of function addCoordToAnimTab

; ---------------------------------------------------------------------------
AnimInitTab:	strActivObj xyFireDown	 ,	      0,	    2,	  anim_NOOP ; 0
		strActivObj xyGunMachine,	      0,	    3,     anim_GunMachine ; 1
		strActivObj AttrFlashBuf,	      0,	    2,	  anim_NOOP ; 2
		strActivObj xyMines	 ,	      0,	    3, anim_Checker ; 3
		strActivObj xyTeleport1 ,	      0,	    2, anim_Checker ; 4
		strActivObj xyBoxWhite	 ,	      0,	    2,	  anim_NOOP ; 5
		strActivObj xyBoxYellow ,	      0,	    2,	  anim_NOOP ; 6
		strActivObj xySphereHome,	      0,	    2,	  anim_NOOP ; 7
		strActivObj str_Pump?	 ,	      0,	    3, anim_Checker ; 8
		strActivObj xyRocket	 ,	      0,	    2,	  anim_NOOP ; 9
		strActivObj xySuperShield,	       0,	     2,	anim_Checker ; 10
		strActivObj xyGreenSphereWithLines,		0,	      2, anin_0D ; 11
		strActivObj xyBONUS	 ,	      0,	    3,	  anim_NOOP ; 12
		strActivObj xyHighVoltage,	       0,	     2,	   anim_NOOP ; 13
		strActivObj xyEndLevel	 ,	      0,	    2,	  anim_NOOP ; 14
		strActivObj xyBeam	 ,	      0,	    2, anim_Checker ; 15

; =============== S U B	R O U T	I N E =======================================


do_FireDown:				; CODE XREF: CheckGameRestart7890-2407p
		ld	hl, FONT_ZONE_00 ; 38 chars
		ld	(FontPTR+1), hl
;
		ld	a, (FireDownPhase)
		inc	a
		cp	3
		jr	nz, loc_8F63
		xor	a

loc_8F63:				; CODE XREF: do_FireDown+Cj
		ld	(FireDownPhase), a
;
		add	a, a
		add	a, 15h		; FireDown
;
		ld	hl, xyFireDown	; 5

loc_8F6C:				; CODE XREF: do_FireDown+33 j
		bit	7, (hl)
		ret	nz
;
		ex	af, af'
		call	RND?
		and	7
		or	42h ; 'B'
		ld	c, a
		ex	af, af'
;
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	d
		inc	hl
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		inc	d
		inc	a
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		dec	a
		jr	loc_8F6C
; End of function do_FireDown

; ---------------------------------------------------------------------------
xyFireDown:	ds 	5*2
; 		str_XY <0>		; DATA XREF: RAM:AnimInitTabo
; 					; do_FireDown+15o
; 		str_XY <0>		; 5
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
		db 0FFh
FireDownPhase:	db 0			; DATA XREF: do_FireDown+6r
					; do_FireDown:loc_8F63w

; =============== S U B	R O U T	I N E =======================================


do_GunMachine????:			; CODE XREF: CheckGameRestart7890-2404p
		ld	hl, FONT_GunMachine ; 32 chars
		ld	(FontPTR+1), hl
;
		ld	hl, xyGunMachine ; 4

nextGun?:				; CODE XREF: do_GunMachine????+79 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)		; delay?
		or	a
		jr	z, loc_900D
;
		push	hl		; Cannon delay
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
;
		ld	a, (hl)
		cp	anim_GunMachine
		pop	hl
		jr	z, loc_8FD5	; phase
;
		push	hl
		ld	a, (hl)
		ld	(hl), 0
;
		call	get_GunMachineBarrelChar ; a - phase
;
		ld	c, 0
		call	putCharXOR
		inc	a
		inc	e
		call	putCharXOR
		ld	a, 13h
		call	putCharXOR
		dec	a
		dec	e
		call	putCharXOR
		pop	hl
		jr	loc_900D
; ---------------------------------------------------------------------------

loc_8FD5:				; CODE XREF: do_GunMachine????+20j
		ld	a, (hl)		; phase
		cp	1
		jr	nz, loc_8FEC
;
		call	RND?
		cp	0FAh ; 'ú'
		jr	c, loc_900D
		ld	(hl), 9
		ld	c, 0FFh
		push	hl
		call	sub_9071
		pop	hl
		jr	loc_900D
; ---------------------------------------------------------------------------

loc_8FEC:				; CODE XREF: do_GunMachine????+43j
		push	hl

CHEAT_NO_CANNON:			; change to NOP	- diasble cannon fire
		dec	(hl)
		call	get_GunMachineBarrelChar ; a - phase
		ld	c, 70
		call	putCharXOR
		inc	a
		inc	e
		ld	c, 6
		call	putCharXOR
		dec	e
		dec	hl
		ld	a, (hl)
		ld	c, 70
		call	putCharXOR
		inc	a
		inc	e
		ld	c, 6
		call	putCharXOR
		pop	hl

loc_900D:				; CODE XREF: do_GunMachine????+12j
					; do_GunMachine????+3Ej ...
		inc	hl
		jr	nextGun?
; End of function do_GunMachine????


; =============== S U B	R O U T	I N E =======================================

; a - phase

get_GunMachineBarrelChar:		; CODE XREF: do_GunMachine????+26p
					; do_GunMachine????+59p
		ld	l, a
		ld	h, 0
		ld	bc, gunM_BarrelSteps
		add	hl, bc
		ld	a, (hl)

gunM_BarrelSteps:			; DATA XREF: get_GunMachineBarrelChar+3o
		ret
; End of function get_GunMachineBarrelChar

; ---------------------------------------------------------------------------
		db  10h
		db  12h
		db  14h
		db  16h
		db  18h
		db  1Ah
		db  1Ch
		db  1Eh
		db  10h
xyGunMachine:	ds 	4*3
; 		strXYF <   0,	 0,    2>; 0 ; DATA XREF: RAM:AnimInitTabo
; 					; do_GunMachine????+6o	...
; 		strXYF <   0,	 0,    2>; 1 ; 4
; 		strXYF <   0,	 0,    2>; 2
; 		strXYF <   0,	 0,    2>; 3
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrMacineGun:				; CODE XREF: ShowZone2Screen+25p
		ld	hl, xyGunMachine ; 4
		ld	de, xyGunMachine+1 ; 4
		ld	(hl), 2
		ld	bc, 11
		ldir
		ret
; End of function clrMacineGun


; =============== S U B	R O U T	I N E =======================================


sub_903D:				; CODE XREF: sub_9071+20 p sub_90A2+F p	...
		push	af
		push	bc
		push	de
		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		ld	a, e
		and	3
		inc	a
		ld	b, a
		ld	a, 3

loc_904B:				; CODE XREF: sub_903D+10 j
		rrca
		rrca
		djnz	loc_904B
		ld	b, a
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, b
		xor	(hl)
		ld	(hl), a
		ld	a, h
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	bc, ATTR_TABLE_COPY
		add	hl, bc
		ld	a, (hl)
		dec	l
		or	(hl)
		jr	nz, loc_906C
		ld	bc, -600h	; 5800 attr table?
		add	hl, bc
		ld	(hl), 47h ; 'G'

loc_906C:				; CODE XREF: sub_903D+27j
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function sub_903D


; =============== S U B	R O U T	I N E =======================================


sub_9071:				; CODE XREF: do_GunMachine????+51p
		ld	hl, stru_90CB

loc_9074:				; CODE XREF: sub_9071+D j
		bit	7, (hl)
		ret	nz
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, loc_9080
		inc	hl
		jr	loc_9074
; ---------------------------------------------------------------------------

loc_9080:				; CODE XREF: sub_9071+Aj
		ld	(hl), c
		dec	hl
		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		inc	a
		inc	a
		inc	a
		ld	d, a
		ld	(hl), a
		dec	hl
		ld	a, e
		add	a, a
		add	a, a
		ld	e, a
		ld	(hl), a
		call	sub_903D
		ld	b, 0Ah

loc_9096:				; CODE XREF: sub_9071+2C j
		push	bc
		ld	b, 1Eh
		call	sound48
		pop	bc
		djnz	loc_9096
		jp	snd_first_first_gun
; End of function sub_9071


; =============== S U B	R O U T	I N E =======================================


sub_90A2:				; CODE XREF: CheckGameRestart7890-2442p
					; CheckGameRestart7890-240Ap
		ld	hl, stru_90CB

loc_90A5:				; CODE XREF: sub_90A2+D j sub_90A2+1C j	...
		ld	e, (hl)
		bit	7, e
		ret	nz
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_90A5
;
		call	sub_903D
		add	a, e
		ld	e, a
		cp	7Fh ; ''
		jr	c, loc_90C0
		dec	hl
		ld	(hl), 0
		inc	hl
		jr	loc_90A5
; ---------------------------------------------------------------------------

loc_90C0:				; CODE XREF: sub_90A2+16j
		push	hl
		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		call	sub_903D
		jr	loc_90A5
; End of function sub_90A2

; ---------------------------------------------------------------------------
		.assert $==0x90CB
stru_90CB:
		ds 	10*3
; 		strXYF <0>		; DATA XREF: sub_9071o	sub_90A2o ...
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


sub_90EA:				; CODE XREF: CheckGameRestart7890-23C9p
		ld	hl, stru_90CB

loc_90ED:				; CODE XREF: sub_90EA+D j sub_90EA+16 j
		ld	e, (hl)
		bit	7, e
		ret	nz
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_90ED
		ld	bc, 0
		call	chkPlayerInZone?
		or	a
		jr	z, loc_90ED
		call	sub_903D
		dec	hl
		ld	(hl), 0
		jp	KillPlayer?
; End of function sub_90EA


; =============== S U B	R O U T	I N E =======================================


clrBUF90CB:				; CODE XREF: ShowZone2Screen+1Cp
		ld	hl, stru_90CB
		ld	de, stru_90CB+1
		ld	bc, 29
		ld	(hl), b
		ldir
		ret
; End of function clrBUF90CB


; =============== S U B	R O U T	I N E =======================================


chkAttrFlash:				; CODE XREF: CheckGameRestart7890-2427p
		ld	hl, AttrFlashBuf ; 14

loc_911B:				; CODE XREF: chkAttrFlash+1B j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl		; ;
		ld	d, (hl)
		inc	hl
		push	hl
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	a, (cntrDB)
		and	7
		or	40h ; '@'
		ld	(hl), a
		pop	hl
		jr	loc_911B
; End of function chkAttrFlash

; ---------------------------------------------------------------------------
AttrFlashBuf:
		ds 	14*2
; 		_XY_ 0		; DATA XREF: RAM:AnimInitTabo
; 					; chkAttrFlasho
; 		_XY_ 0		; 14
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
; 		_XY_ 0
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


do_MINES:				; CODE XREF: CheckGameRestart7890-243Cp
		ld	hl, FONT_ZONE_00 ; 38 chars
		ld	(FontPTR+1), hl
;
		ld	a, (mine_fire_phase)
		xor	2
		ld	(mine_fire_phase), a
;
		ld	hl, xyMines	; 10

nextMine:				; CODE XREF: do_MINES+32 j do_MINES+40 j ...
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		dec	a
		jr	z, notFiredYet
;
		call	RND?
		and	7
		or	42h ; 'B'
		ld	c, a
;
		ld	a, (mine_fire_phase)
		add	a, 29		; AfterMineFire
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	a
		inc	e
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		jr	nextMine
; ---------------------------------------------------------------------------

notFiredYet:				; CODE XREF: do_MINES+1Bj
		ld	b, d
		ld	c, e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		dec	d
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		add	a, 31
		cp	d
		jr	nz, nextMine
;
		ld	a, (Player_X_Pos) ; 0..127
		add	a, 6
		sub	e
		sub	9
		cp	0F6h ; 'ö'
		jr	c, nextMine
;
		dec	hl
		ld	(hl), 0		; mineFired
		ld	d, b
		ld	e, c
		dec	d
;
		call	remove_mine_from_screen?
;
		call	snd_first_first_gun
;
		jp	KillPlayerChkSuperShieldFlag
; End of function do_MINES

; ---------------------------------------------------------------------------
mine_fire_phase:db 0			; DATA XREF: do_MINES+6r do_MINES+Bw ...
xyMines:
		ds 	10*3
; 		strXYF <0>		; DATA XREF: RAM:AnimInitTabo
; 					; do_MINES+Eo ...
; 		strXYF <0>		; 10
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


remove_mine_from_screen?:		; CODE XREF: do_MINES+54p
		ld	a, 3
		call	selectPutCHR
		inc	d
		inc	d
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		dec	d
		dec	d
		ld	bc, ATTR_TABLE
		add	hl, bc
		ld	a, (hl)
		ld	(stored_color),	a
		ld	hl, byte_91ED
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		xor	a
		jp	selectPutCHR
; End of function remove_mine_from_screen?

; ---------------------------------------------------------------------------
byte_91ED:	db _E6_DW_FONT		; DATA XREF: remove_mine_from_screen?+14o
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _E0_Attribute?
stored_color:	db 5			; DATA XREF: remove_mine_from_screen?+11w
		db _E1_DBcnt_xLoopStart
		db 5
		db ' '
		db ' '
		db _78_deltaY__p0_dbX
		db -2
		db _E2_xMSG_NEXT_e1
		db _FF_EndMSG
;

; =============== S U B	R O U T	I N E =======================================


clrMineBuf:				; CODE XREF: ShowZone2Screen+1Fp
		ld	hl, xyMines	; 10
		ld	de, xyMines+1	; 10
		ld	(hl), 1
		ld	bc, 29
		ldir
		ret
; End of function clrMineBuf


; =============== S U B	R O U T	I N E =======================================


chkGrenades?:				; CODE XREF: CheckGameRestart7890-2439p
		call	nopIfPlayerDie
;
		ld	a, (Player_X_Pos) ; 0..127
		cp	118
		ret	nc
;
		ld	a, (_GRENADES)
		or	a
		ret	z
;
		ld	a, (byte_83DC)
		cp	15
		ret	c
;
		ld	a, (byte_925A)
		or	a
		ret	nz
;
		ld	a, 20h ; ' '
		ld	(byte_925A), a
;
		ld	hl, (Player_X_Pos) ; 0..127
		ld	a, l
		add	a, 4
		ld	l, a
		ld	a, (byte_82FB)
		or	a
		jr	z, loc_9237
		ld	a, h
		add	a, 6
		ld	h, a

loc_9237:				; CODE XREF: chkGrenades?+29j
		ld	(word_925B), hl
		ld	a, (byte_82FA)
		ld	(byte_925D), a
		ex	de, hl
		inc	a
		ld	a, 1
		jr	z, loc_9247
;
		xor	a

loc_9247:				; CODE XREF: chkGrenades?+3Cj
		ld	(byte_925E), a
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, (_GRENADES)
		dec	a
		ld	(_GRENADES), a
;
		call	snd_Fire_Grenades
;
		jp	showGRENADES
; End of function chkGrenades?

; ---------------------------------------------------------------------------
byte_925A:	db 0			; DATA XREF: CheckGameRestart7890-2415r
					; CheckGameRestart7890-23FEr ...
word_925B:	dw 0			; DATA XREF: chkGrenades?:loc_9237w
					; sub_925F:loc_9271 r ...
byte_925D:	db 0			; DATA XREF: chkGrenades?+35w
					; sub_925F+24 r	...
byte_925E:	db 0			; DATA XREF: chkGrenades?:loc_9247w
					; sub_925F+16 r	...

; =============== S U B	R O U T	I N E =======================================


sub_925F:				; CODE XREF: CheckGameRestart7890-2436p
					; CheckGameRestart7890-2410p ...

; FUNCTION CHUNK AT 93E2 SIZE 00000055 BYTES

		ld	a, (byte_925A)
		or	a
		ret	z
;
		ld	c, a
		ld	b, 0
		ld	hl,  loc_92D8+2
		add	hl, bc
		dec	a
		jr	z, loc_9271
		ld	(byte_925A), a

loc_9271:				; CODE XREF: sub_925F+Dj
		ld	de, (word_925B)
		ld	a, (byte_925E)
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, e
		cp	124
		jr	z, loc_92D4
		or	a
		jr	z, loc_92D4
		ld	a, (byte_925D)
		ld	b, a
		inc	a
		jr	nz, loc_9291
		call	sub_9382
		jr	nz, loc_92D4
		jr	loc_9296
; ---------------------------------------------------------------------------

loc_9291:				; CODE XREF: sub_925F+29j
		call	sub_9362
		jr	nz, loc_92D4

loc_9296:				; CODE XREF: sub_925F+30j
		ld	a, b
		add	a, e
		ld	e, a
		ld	(word_925B), a
		ld	a, (word_925B+1)
		ld	d, a
		ld	a, (hl)
		cp	0FFh
		jr	nc, loc_92AA
		call	sub_93A2
		jr	nz, loc_92D4

loc_92AA:				; CODE XREF: sub_925F+44j
		ld	a, (hl)
		add	a, d
		ld	d, a
		cp	0A8h ; '¨'
		jr	nc, loc_92D4
		ld	(word_925B+1), a
		ld	a, (byte_925E)
		ld	c, 47h ; 'G'
		call	sub_7C77
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, (byte_925D)
		inc	a
		ld	a, 4
		jr	z, loc_92C9
		neg

loc_92C9:				; CODE XREF: sub_925F+66j
		add	a, e
		ld	e, a
		ld	a, (byte_925A)
		cp	13h
		jp	nc, addToParticleList
		ret
; ---------------------------------------------------------------------------

loc_92D4:				; CODE XREF: sub_925F+1Fj sub_925F+22j ...
		xor	a
		ld	(byte_925A), a

loc_92D8:				; DATA XREF: sub_925F+8o
		jp	loc_93E2
; End of function sub_925F

; ---------------------------------------------------------------------------
		db    1,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0; 0
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0; 11
		db    0,0FFh,0FFh,0FFh,0FFh,0FEh,0FEh,0FEh,0FCh,0FCh; 22

; =============== S U B	R O U T	I N E =======================================

; a - sprite num
; 0 - shot right
; 1 - shot left
; 2 - Boom1 - Biggest
; 3 - Boom2
; 4 - Boom3
; 5 - Boom4 - Smalest
; 6 - Boom5 - Empty?
; 7 - Spheres
; 8 - shot left	small
;
; d,e -	y(0..191),x(0..127)
;
; each sprites - preshifted, 4 phases (16*8 bytes each)
; increment call count

Sprite8x8_XOR_Preshifted:		; CODE XREF: chkGrenades?+42p
					; sub_925F+19p	...
		push	af
		push	bc
		push	de
		push	hl
		call	XY2SCR_ADDR	; IN: D	- Y (0..191),E - X (0..127)
					; OUT: HL - scr	addr
		push	hl
;Calc offset to	sprite
		add	a, a
		add	a, a		; 4
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 64 = 4*16

; X offset from	4 preshifted sprite
		ld	a, e		; x
		and	3
		add	a, a
		add	a, a
		add	a, a
		add	a, a		; 16
		ld	e, a
		ld	d, 0
		add	hl, de		; hl=A*64+(x&3)*16
		ld	bc, Shifted4Sprites
		add	hl, bc
;
		pop	de		; hl-Sprite addr
		ld	(_SAV_SP), sp
		ld	sp, hl
		ex	de, hl
		ld	bc, 407h	; 4 - iteration, 7 - mask

loc_9325:				; CODE XREF: Sprite8x8_XOR_Preshifted:loc_9353 j
		pop	de
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	l
		ld	a, d
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, h
		and	c
		jr	nz, noScrYAddrFix
		ld	a, l
		add	a, 32
		ld	l, a
		jr	c, noScrYAddrFix
		ld	a, h
		sub	8
		ld	h, a

noScrYAddrFix:				; CODE XREF: Sprite8x8_XOR_Preshifted+35j
					; Sprite8x8_XOR_Preshifted+3Bj
		pop	de
		ld	a, d
		xor	(hl)
		ld	(hl), a
		dec	l
		ld	a, e
		xor	(hl)
		ld	(hl), a
		inc	h
		ld	a, h
		and	c
		jr	nz, loc_9353
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		jr	c, loc_9353
		ld	a, h
		sub	8
		ld	h, a

loc_9353:				; CODE XREF: Sprite8x8_XOR_Preshifted+4Cj
					; Sprite8x8_XOR_Preshifted+52j
		djnz	loc_9325
;
		ld	sp, (_SAV_SP)
;
		ld	hl, PreshiftedSpritesCallCount?
		inc	(hl)
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function Sprite8x8_XOR_Preshifted


; =============== S U B	R O U T	I N E =======================================


sub_9362:				; CODE XREF: __move__???+37p
					; sub_925F:loc_9291p ...
		push	bc
		push	de
		push	hl
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_937D
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		inc	l
		ld	bc, 20h	; ' '
		ld	a, (hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_937D
		add	hl, bc
		or	(hl)

loc_937D:				; CODE XREF: sub_9362+8j sub_9362+17j
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_9362


; =============== S U B	R O U T	I N E =======================================


sub_9382:				; CODE XREF: __move__???+28p
					; sub_925F+2Bp	...
		push	bc
		push	de
		push	hl
		ld	a, e
		and	3
		ld	a, 0
		jr	nz, loc_939D
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		dec	l
		ld	bc, 20h	; ' '
		ld	a, (hl)
		ld	e, a
		ld	a, d
		and	7
		ld	a, e
		jr	z, loc_939D
		add	hl, bc
		or	(hl)

loc_939D:				; CODE XREF: sub_9382+8j sub_9382+17j
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_9382


; =============== S U B	R O U T	I N E =======================================


sub_93A2:				; CODE XREF: sub_925F+46p
					; chkSpheres:loc_9A70 p
		push	bc
		push	de
		push	hl
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_93BD
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, 20h	; ' '
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_93BD
		inc	l
		or	(hl)

loc_93BD:				; CODE XREF: sub_93A2+8j sub_93A2+17j
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_93A2


; =============== S U B	R O U T	I N E =======================================


sub_93C2:				; CODE XREF: chkSpheres+48 p
		push	bc
		push	de
		push	hl
		ld	a, d
		and	7
		ld	a, 0
		jr	nz, loc_93DD
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	bc, -32
		add	hl, bc
		ld	a, (hl)
		ld	d, a
		ld	a, e
		and	3
		ld	a, d
		jr	z, loc_93DD
		inc	l
		or	(hl)

loc_93DD:				; CODE XREF: sub_93C2+8j sub_93C2+17j
		or	a
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_93C2

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_925F

loc_93E2:				; CODE XREF: sub_925F:loc_92D8j
		ld	a, e
		and	7Ch ; '|'
		rrca
		rrca
		ld	e, a
		ld	a, d
		and	0F8h ; 'ø'
		rrca
		rrca
		rrca
		ld	d, a
		ld	hl, destroyableBuffer?

loc_93F2:				; CODE XREF: sub_925F+1D6 j
		ld	a, (hl)
		cp	0FFh
		ret	z
		cp	80h ; '€'
		push	hl
		jr	z, loc_9430
		ld	a, e
		cp	(hl)
		inc	hl
		jr	c, loc_9430
		cp	(hl)
		inc	hl
		jr	nc, loc_9430
		ld	a, d
		cp	(hl)
		inc	hl
		jr	c, loc_9430
		cp	(hl)
		inc	hl
		jr	nc, loc_9430
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		ld	bc, xZoneBlock
		call	get_hl_a_BC
		ld	a, 3
		call	selectPutCHR
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		xor	a
		call	selectPutCHR
		pop	hl
		ld	(hl), 80h ; '€'
		call	snd_first_first_gun
		ld	de,  a000150+5
		jp	addPoints
; ---------------------------------------------------------------------------

loc_9430:				; CODE XREF: sub_925F+19Aj
					; sub_925F+19Fj ...
		pop	hl
		ld	bc, 7
		add	hl, bc
		jr	loc_93F2
; END OF FUNCTION CHUNK	FOR sub_925F
; ---------------------------------------------------------------------------
destroyableBuffer?:
		ds 	11*7+3
; 		destroyableStruct <0> ; DATA	XREF: ShowZone2Screen+4Co
; 					; sub_925F+190o
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		destroyableStruct <0>
; 		db    0
; 		db    0
; 		db    0

; =============== S U B	R O U T	I N E =======================================

; ix - buffer
; a - block id

prepareDestoryableObject:		; CODE XREF: ShowZone2Screen+5Bp
		push	af
		push	bc
		push	hl
		ld	hl, DestroyableBlockSizeTable ;	gunMachine

loc_948D:				; CODE XREF: prepareDestoryableObject+11 j
		bit	7, (hl)
		jr	nz, loc_949A
		cp	(hl)
		jr	z, appendBlockToBuffer ; block
		ld	bc, 5
		add	hl, bc
		jr	loc_948D
; ---------------------------------------------------------------------------

loc_949A:				; CODE XREF: prepareDestoryableObject+8j
		pop	hl
		pop	bc
		pop	af
		ret
; ---------------------------------------------------------------------------

appendBlockToBuffer:			; CODE XREF: prepareDestoryableObject+Bj
		ld	(ix+6),	a	; block
		ld	(ix+4),	e	; x
		ld	(ix+5),	d	; y
		inc	hl		; skip block number
;
		ld	a, (hl)		; dx_from
		add	a, e
		ld	(ix+0),	a	; x_from
;
		inc	hl
		add	a, (hl)		; dx_to
		ld	(ix+1),	a	; x_to
;
		inc	hl
		ld	a, (hl)		; dy_from
		add	a, d
		ld	(ix+2),	a	; y_from
;
		inc	hl
		add	a, (hl)		; dy_to
		ld	(ix+3),	a	; y_to
;
		ld	bc, 7
		add	ix, bc
		pop	hl
		pop	bc
		pop	af
		ret
; End of function prepareDestoryableObject

; ---------------------------------------------------------------------------
DestroyableBlockSizeTable:
		destroy_object_param 5, -1, 8, -2, 5
					; DATA XREF: prepareDestoryableObject+3o
					; gunMachine
		destroy_object_param 13, -3, 5, -2, 10 ; FigureYellow
		destroy_object_param 15, -2, 7, -1, 9	; TowerDishWhite
		destroy_object_param 16, -2, 6, -2, 8	; TowerRocketWhite
		destroy_object_param 18, -6, 11, 1, 7 ; box_white
		destroy_object_param 21, -2, 7, -2, 8	; bobs_circle
		destroy_object_param 31, -1, 6, -2, 6	; SphereWithLinesGreen
		destroy_object_param 40, -1, 6, -2, 8	; Wagonetka
		destroy_object_param 44, -1, 8, -2, 4	; gunMachineTop
		destroy_object_param 46, -1, 5, -2, 6	; MushroomGreen
		db 0FFh

; =============== S U B	R O U T	I N E =======================================

; e-x (/4)
; d-y (/8)

add_boom_particle?:			; CODE XREF: PutCharXorOVER_CHK_X+49 p
					; PutCharXorOVER_CHK_X+4C j
		push	af
		push	de
		push	hl
		push	bc
;
		ld	bc, 6
		ld	hl, particleBuf?

loc_9503:				; CODE XREF: add_boom_particle?+13 j
		ld	a, (hl)
		or	a
		jr	z, loc_950E
		cp	0FFh
		jr	z, loc_9543
		add	hl, bc
		jr	loc_9503
; ---------------------------------------------------------------------------
		.assert $==0x950E

loc_950E:				; CODE XREF: add_boom_particle?+Cj
		ld	(hl), 1
		inc	hl
		ld	a, e
		rlca
		rlca
		ld	e, a
		ld	(hl), e
		inc	hl
		ld	a, d
		rlca
		rlca
		rlca
		ld	d, a
		ld	(hl), d
		inc	hl
		call	RND?
		and	7
		call	getdelta?
		ld	(hl), a
		ld	c, a
		inc	hl

loc_9529:				; CODE XREF: add_boom_particle?+3B j
		call	RND?
		and	7
		call	getdelta?
		add	a, a
		ld	b, a
		or	c
		jr	z, loc_9529
		ld	(hl), b
		ld	a, 2
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		pop	bc
		push	bc
		inc	hl
		ld	a, c
		and	47h ; 'G'
		ld	(hl), a

loc_9543:				; CODE XREF: add_boom_particle?+10j
		pop	bc
		pop	hl
		pop	de
		pop	af
		ret
; End of function add_boom_particle?


; =============== S U B	R O U T	I N E =======================================


getdelta?:				; CODE XREF: add_boom_particle?+2Ap
					; add_boom_particle?+35p
		push	hl
		push	bc
		ld	l, a
		ld	h, 0
		ld	bc, byte_9555
		add	hl, bc
		ld	a, (hl)
		pop	bc
		pop	hl
		ret
; End of function getdelta?

; ---------------------------------------------------------------------------
byte_9555:	db    -4,   -3,	  -2,	 0; 0 ;	DATA XREF: getdelta?+5o
		db    0,   2,	3,   4	; 0

; =============== S U B	R O U T	I N E =======================================


chkBOOM?:				; CODE XREF: CheckGameRestart7890-2421p
		ld	hl, particleBuf?

loc_9560:				; CODE XREF: chkBOOM?+F j chkBOOM?+4D j	...
		ld	a, (hl)
		cp	0FFh
		ret	z
		cp	1
		jr	z, loc_956E
		ld	bc, 6
		add	hl, bc
		jr	loc_9560
; ---------------------------------------------------------------------------

loc_956E:				; CODE XREF: chkBOOM?+9j
		push	hl
		inc	hl
		push	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, 2
		call	Sprite8x8_XOR_Preshifted ; erase?
		inc	hl
		ld	a, e
		add	a, (hl)
		ld	e, a
		cp	120
		jr	nc, deactivatrParticle
		inc	hl
		ld	a, d
		add	a, (hl)
		ld	d, a
		cp	169
		jr	nc, deactivatrParticle
		inc	hl
		ld	c, (hl)
		pop	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ld	a, 2
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
;
		call	sub_7C77
;
		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, loc_95A5
		ld	a, e
		rlca
		rlca
		rlca
		and	0F8h ; 'ø'
		out	(0FEh),	a

loc_95A5:				; CODE XREF: chkBOOM?+3Ej
		pop	hl
		ld	bc, 6
		add	hl, bc
		jr	loc_9560
; ---------------------------------------------------------------------------

deactivatrParticle:			; CODE XREF: chkBOOM?+22j chkBOOM?+2Aj
		pop	hl
		pop	hl
		ld	(hl), 0
		ld	bc, 6
		add	hl, bc
		jr	loc_9560
; End of function chkBOOM?

; ---------------------------------------------------------------------------
particleBuf?:
		ds 	100*6
; 		str_95B6 <0>		; DATA XREF: add_boom_particle?+7o
; 					; chkBOOM?o ...
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
; 		str_95B6 <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_PariclesBuf:			; CODE XREF: ShowZone2Screen+22p
		ld	hl, particleBuf?
		ld	de, particleBuf?+1
		ld	bc, 599
		ld	(hl), 0
		ldir
		ret
; End of function clr_PariclesBuf


; =============== S U B	R O U T	I N E =======================================


addToParticleList:			; CODE XREF: __move__???+6Cp
					; sub_925F+71j	...
		push	hl
		ld	hl, boomParticles

loc_9821:				; CODE XREF: addToParticleList+D j
		bit	7, (hl)
		jr	nz, loc_9833
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		inc	hl
		jr	nz, loc_9821
		dec	hl
		ld	(hl), 10
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e

loc_9833:				; CODE XREF: addToParticleList+6j
		pop	hl
		ret
; End of function addToParticleList


; =============== S U B	R O U T	I N E =======================================


chkBoomParticles?:			; CODE XREF: CheckGameRestart7890-242Ap
		ld	hl, boomParticles

loc_9838:				; CODE XREF: chkBoomParticles?+D j
					; chkBoomParticles?:loc_9863 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9838
		push	hl
		dec	hl
		dec	(hl)
		ld	l, a
		ld	h, 0
		ld	bc,  loc_9863+1	; 6, 5,	5, 5, 4, 5, 3, 5, 4, 3,	6
		add	hl, bc
		inc	hl
		ld	a, (hl)
		call	Sprite8x8_XOR_Preshifted ; erase old ...
		dec	hl
		ld	a, (hl)
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, r
		and	7
		or	42h ; 'B'
		ld	c, a
		call	sub_7C77
		pop	hl

loc_9863:				; DATA XREF: chkBoomParticles?+15o
		jr	loc_9838
; End of function chkBoomParticles?

; ---------------------------------------------------------------------------
		db  6, 5, 5, 5,	4, 5, 3, 5, 4, 3, 6
boomParticles:
		ds 	15*4
; 		strBoomParcticles <0; DATA XREF: addToParticleList+1o
; 					; chkBoomParticles?o ...
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
; 		strBoomParcticles <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_boomParticles?:			; CODE XREF: ShowZone2Screen+28p
		ld	hl, boomParticles
		ld	de, boomParticles+1
		ld	bc, 59
		ld	(hl), b
		ldir
		ret
; End of function clr_boomParticles?


; =============== S U B	R O U T	I N E =======================================


doTeleport:				; CODE XREF: CheckGameRestart7890-241Bp
		ld	a, (fl_DOWN)
		or	a
		jr	nz, loc_98C4
		ld	(byte_9935), a
		ret
; ---------------------------------------------------------------------------

loc_98C4:				; CODE XREF: doTeleport+4j
		ld	a, (byte_9935)
		or	a
		ret	nz
		inc	a
		ld	(byte_9935), a
;
		ld	de, (xyTeleport1)
		bit	7, e
		ret	nz
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		jr	nz, loc_9901
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	9
		cp	235
		jr	c, loc_9901
		call	addTeleportParticle?
;
		ld	de, (TeleportPos2)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	snd_teleport
		call	addTeleportParticle?
		dec	e
		dec	e
		dec	e
		ld	a, 5		; walk middle
		jp	ShowPlayerSprite?? ; a	- sprite
; ---------------------------------------------------------------------------

loc_9901:				; CODE XREF: doTeleport+22j
					; doTeleport+2Cj
		ld	de, (TeleportPos2)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		ret	nz
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	9
		cp	235
		ret	c
		call	addTeleportParticle?
		ld	de, (xyTeleport1)
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	addTeleportParticle?
		dec	e
		dec	e
		dec	e
		call	snd_teleport
		ld	a, 5
		jp	ShowPlayerSprite?? ; a	- sprite
; End of function doTeleport

; ---------------------------------------------------------------------------
xyTeleport1:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; doTeleport+13r ...
TeleportPos2:	dw 0			; DATA XREF: doTeleport+31r
					; doTeleport:loc_9901r
		db 0FFh
byte_9935:	db 0			; DATA XREF: doTeleport+6w
					; doTeleport:loc_98C4r ...

; =============== S U B	R O U T	I N E =======================================

; _Dx4_Ex8
; d*4
; e*8
;

block2xy:				; CODE XREF: do_MINES+36p
					; doTeleport+1Bp ...
		push	af
		ld	a, e
		add	a, a
		add	a, a
		ld	e, a		; 4
		ld	a, d
		add	a, a
		add	a, a
		add	a, a
		ld	d, a		; 8
		pop	af
		ret
; End of function block2xy


; =============== S U B	R O U T	I N E =======================================


chkBoxAmoGrenade?:			; CODE XREF: CheckGameRestart7890-2424p
		ld	de, (xyBoxWhite) ; XY ,	or 0xFF	if no
		bit	7, e
		jr	nz, chkYellow
		dec	d
		dec	d
		inc	e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		cp	244
		jr	c, chkYellow
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		jr	nz, chkYellow
		ld	de, (xyBoxWhite) ; XY ,	or 0xFF	if no
		ld	a, 4
		call	selectPutCHR
		ld	hl, box_white
		ld	c, 0
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		xor	a
		call	selectPutCHR
		ld	a, 0FFh
		ld	(xyBoxWhite), a	; XY , or 0xFF if no
		ld	a, 99
		ld	(_AMMO), a
		call	showAMMO
		call	snd_got_white_box
;
		ld	a, (byte_8269)
		ld	b, a
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, b
		ld	de, (Player_X_Pos) ; 0..127
		call	show32xsprite
		ld	b, 5

loc_9996:				; CODE XREF: chkBoxAmoGrenade?+57 j
		call	sndBox48
		djnz	loc_9996

chkYellow:				; CODE XREF: chkBoxAmoGrenade?+6j
					; chkBoxAmoGrenade?+14j ...
		ld	de, (xyBoxYellow) ; XY , or 0xFF if no
		bit	7, e
		ret	nz
		dec	d
		dec	d
		inc	e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		cp	244
		ret	c
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		ret	nz
		ld	de, (xyBoxYellow) ; XY , or 0xFF if no
		ld	a, 4
		call	selectPutCHR
		ld	hl, box_yellow
		ld	c, 0
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		xor	a
		call	selectPutCHR
		ld	a, 0FFh
		ld	(xyBoxYellow), a ; XY ,	or 0xFF	if no
		ld	a, 10
		ld	(_GRENADES), a
		call	showGRENADES
		call	snd_got_yellow_box
		ld	a, (byte_8269)
		ld	b, a
		ld	a, 0FFh
		ld	(byte_8269), a
		ld	a, b
		ld	de, (Player_X_Pos) ; 0..127
		call	show32xsprite
		ld	b, 5

loc_99EC:				; CODE XREF: chkBoxAmoGrenade?+AD j
		call	sndBox48
		djnz	loc_99EC
		ret
; End of function chkBoxAmoGrenade?

; ---------------------------------------------------------------------------
xyBoxWhite:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; chkBoxAmoGrenade?r ...
					; XY , or 0xFF if no
		db 0FFh
xyBoxYellow:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; chkBoxAmoGrenade?:chkYellowr	...
					; XY , or 0xFF if no
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


selectPutCHR:				; CODE XREF: remove_mine_from_screen?+2p
					; remove_mine_from_screen?+1Bj	...
		push	bc
		push	hl
		ld	bc, putCharTable
		call	get_hl_a_BC
		ld	(putCharxMSGAddr+1), hl
		ld	(putChar_xMSG_E4+1), hl
		ld	(putChar_xMSG_E5+1), hl
		ld	(putChar_xMSG_E7+1), hl
		pop	hl
		pop	bc
		ret
; End of function selectPutCHR

; ---------------------------------------------------------------------------
putCharTable:	dw PurCharAndSetVarsChkX ; DATA	XREF: selectPutCHR+2o
					; C - color?
					; E-X
					; D-Y
		dw putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		dw putCharXOR
		dw PutCharXorOVER_CHK_X
		dw PutCharXorNoWalk

; =============== S U B	R O U T	I N E =======================================


CheckGameRestart7890:			; CODE XREF: CheckGameRestart7890-23B7p

; FUNCTION CHUNK AT 6D60 SIZE 000000B6 BYTES
; FUNCTION CHUNK AT 6FAB SIZE 000000B0 BYTES
; FUNCTION CHUNK AT 7145 SIZE 00000048 BYTES
; FUNCTION CHUNK AT 758A SIZE 00000102 BYTES

		ld	a, 0EFh	; 'ï'
		in	a, (0FEh)
		and	1111b		; 7890
		ret	nz
		jp	START
; End of function CheckGameRestart7890


; =============== S U B	R O U T	I N E =======================================


chkSpheres:				; CODE XREF: CheckGameRestart7890-2430p
		ld	hl, spheresBUF	; up to	24 spheres on screen

spheresLoop:				; CODE XREF: chkSpheres+73 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, chkNextSphere
		inc	hl
		ld	a, 7
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, e
		or	a
		jr	z, loc_9A56
;
		cp	123
		jr	z, loc_9A56
;
		call	RND?
		cp	220
		jr	nc, loc_9A56
;
		ld	a, (hl)
		inc	a
		jr	nz, loc_9A50
		call	sub_9382
		jr	loc_9A53
; ---------------------------------------------------------------------------

loc_9A50:				; CODE XREF: chkSpheres+26j
		call	sub_9362

loc_9A53:				; CODE XREF: chkSpheres+2Bj
		or	a
		jr	z, loc_9A5A

loc_9A56:				; CODE XREF: chkSpheres+17j
					; chkSpheres+1Bj ...
		ld	a, (hl)
		neg
		ld	(hl), a

loc_9A5A:				; CODE XREF: chkSpheres+31j
		ld	a, (hl)
		add	a, e
		ld	c, a
		call	RND?
		and	1
		jr	z, loc_9A65
		inc	a

loc_9A65:				; CODE XREF: chkSpheres+3Fj
		dec	a
		ld	b, a
		cp	0FFh
		jr	nz, loc_9A70
		call	sub_93C2
		jr	loc_9A73
; ---------------------------------------------------------------------------

loc_9A70:				; CODE XREF: chkSpheres+46j
		call	sub_93A2

loc_9A73:				; CODE XREF: chkSpheres+4Bj
		or	a
		jr	z, loc_9A78
		ld	b, 0

loc_9A78:				; CODE XREF: chkSpheres+51j
		ld	a, b
		add	a, d
		ld	d, a
		or	a
		jr	nz, loc_9A7F
		inc	d

loc_9A7F:				; CODE XREF: chkSpheres+59j
		ld	e, c
		ld	a, 7
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	c, 42h ; 'B'
		call	sub_7C77
		pop	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		dec	hl
		jr	loc_9A92
; ---------------------------------------------------------------------------

chkNextSphere:				; CODE XREF: chkSpheres+Dj
		pop	hl

loc_9A92:				; CODE XREF: chkSpheres+6Cj
		ld	de, 4
		add	hl, de
		jp	spheresLoop
; End of function chkSpheres

; ---------------------------------------------------------------------------
spheresBUF:
		ds 	24*4
; 		strSpheres <0>		; DATA XREF: chkSphereso
; 					; clrSpheresBuf? o ...
; 		strSpheres <0>		; up to	24 spheres on screen
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
; 		strSpheres <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrSpheresBuf?:				; CODE XREF: ShowZone2Screen+2Bp
		ld	hl, spheresBUF	; up to	24 spheres on screen
		ld	de, spheresBUF+1 ; up to 24 spheres on screen
		ld	bc, 95
		ld	(hl), b
		ldir
		ret
; End of function clrSpheresBuf?


; =============== S U B	R O U T	I N E =======================================


init_Spheres:				; CODE XREF: ShowZone2Screen+83p
		ld	ix, spheresBUF	; up to	24 spheres on screen
		ld	hl, xySphereHome ; up to 3 sphere home

nextSphereHome:				; CODE XREF: init_Spheres+42 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		inc	e
		inc	e		; x+2
		inc	d
		inc	d
		inc	d		; y_3
		ld	bc, 4
		ld	a, 8

addNextSphere:				; CODE XREF: init_Spheres+40 j
		ex	af, af'
		ld	(ix+0),	e
		ld	(ix+1),	d
;
		ld	a, 4
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	(ix+2),	1
		call	RND?
		and	1
		or	a
		jr	z, loc_9B3B
		inc	a

loc_9B3B:				; CODE XREF: init_Spheres+31j
		dec	a
		ld	(ix+3),	a
;
		add	ix, bc
		ld	(ix+0),	0FFh	; stop mark
		ex	af, af'
		dec	a
		jr	nz, addNextSphere
		jr	nextSphereHome
; End of function init_Spheres

; ---------------------------------------------------------------------------
xySphereHome:
		ds 	3*2
; 		str_XY <0>		; DATA XREF: RAM:AnimInitTabo
; 					; init_Spheres+4o
; 		str_XY <0>		; up to	3 sphere home
; 		str_XY <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


moveSpheres?:				; CODE XREF: __move__???p
		ld	hl, spheresBUF	; up to	24 spheres on screen

loc_9B55:				; CODE XREF: moveSpheres?+E j
					; moveSpheres?+17 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		inc	hl
		or	a
		jr	z, loc_9B55
		call	sub_9B82
		or	a
		call	nz, sub_9B6B
		jr	loc_9B55
; End of function moveSpheres?


; =============== S U B	R O U T	I N E =======================================


sub_9B6B:				; CODE XREF: moveSpheres?+14p
					; sub_9BB4+19 p
		ld	a, 7
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		dec	hl
		dec	hl
		ld	(hl), 0
		inc	hl
		inc	hl
		call	addToParticleList
		call	snd_destroy_ball
		ld	de,  a000050+5
		jp	addPoints
; End of function sub_9B6B


; =============== S U B	R O U T	I N E =======================================


sub_9B82:				; CODE XREF: moveSpheres?+10p
					; moveShotLeft?+F p
		push	bc
		push	de
		push	hl
		inc	e
		inc	e
		ld	hl, stru_845F

loc_9B8A:				; CODE XREF: sub_9B82+14 j sub_9B82+1A j ...
		xor	a
		ld	c, (hl)
		bit	7, c
		jr	nz, loc_9BB0
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9B8A
		ld	a, c
		sub	e
		cp	0FCh ; 'ü'
		jr	c, loc_9B8A
		ld	a, b
		sub	d
		sub	9
		cp	0F6h ; 'ö'
		jr	c, loc_9B8A
		ld	d, b
		ld	e, c
		call	sub_82FC
		dec	hl
		ld	(hl), 0
		ld	a, 1

loc_9BB0:				; CODE XREF: sub_9B82+Cj
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_9B82


; =============== S U B	R O U T	I N E =======================================


sub_9BB4:				; CODE XREF: CheckGameRestart7890-23C6p
		ld	hl, spheresBUF	; up to	24 spheres on screen

loc_9BB7:				; CODE XREF: sub_9BB4+E j sub_9BB4+17 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		inc	hl
		or	a
		jr	z, loc_9BB7
		ld	bc, 804h
		call	chkPlayerInZone?
		or	a
		jr	z, loc_9BB7
		call	sub_9B6B
		call	snd_destroy_ball
		jp	KillPlayer?
; End of function sub_9BB4


; =============== S U B	R O U T	I N E =======================================


chkPlayerInZone?:			; CODE XREF: sub_90EA+12p sub_9BB4+13p ...
		push	hl
		ld	a, c
		add	a, 12
		neg
		ld	l, a
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	c
		cp	l
		ld	a, 0
		jr	c, loc_9BFE
		ld	a, (byte_82FB)
		or	a
		jr	nz, loc_9C00
		ld	a, b
		add	a, 20h ; ' '
		neg
		ld	h, a
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		sub	d
		sub	b
		cp	h
		ld	a, 0
		jr	c, loc_9BFE
		inc	a

loc_9BFE:				; CODE XREF: chkPlayerInZone?+Fj
					; chkPlayerInZone?+25j	...
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_9C00:				; CODE XREF: chkPlayerInZone?+15j
		ld	a, b
		add	a, 1Ah
		neg
		ld	h, a
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		add	a, 6
		sub	d
		sub	b
		cp	h
		ld	a, 0
		jr	c, loc_9BFE
		inc	a
		pop	hl
		ret
; End of function chkPlayerInZone?


; =============== S U B	R O U T	I N E =======================================


doPUMP?:				; CODE XREF: CheckGameRestart7890-242Dp
		ld	ix, Sprite_BUFFER???
		ld	hl, str_Pump?	; 4

doPUMPLoop:				; CODE XREF: doPUMP?+19 j doPUMP?+59 j
		ld	de, 80h	; '€'
		add	ix, de
;
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		ld	b, d
		inc	hl
		ld	a, (hl)
		inc	(hl)
		inc	hl
		cp	101
		jr	c, doPUMPLoop
		cp	105
		jr	nc, loc_9C3C
		dec	d
		dec	hl
		dec	hl
		ld	(hl), d
		inc	hl
		inc	hl
		jr	loc_9C56
; ---------------------------------------------------------------------------

loc_9C3C:				; CODE XREF: doPUMP?+1Dj
		cp	116
		jr	c, loc_9C56
		cp	120
		jr	nc, loc_9C4C
		inc	d
		dec	hl
		dec	hl
		ld	(hl), d
		inc	hl
		inc	hl
		jr	loc_9C56
; ---------------------------------------------------------------------------

loc_9C4C:				; CODE XREF: doPUMP?+2Dj
		dec	hl
		call	RND?
		and	3Fh ; '?'
		add	a, 20
		ld	(hl), a
		inc	hl

loc_9C56:				; CODE XREF: doPUMP?+25j doPUMP?+29j ...
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	c, e
		ld	a, b
		add	a, a
		add	a, a
		add	a, a
		ld	b, a
;
		ld	a, 24		; PUMP
		push	hl
		push	ix
		pop	hl
		call	Sprite24x32_Player ;
					; 00-09	- WALK
					; 10 - Duck
					; 11 - DIE
					; 12-21	WALK 2gun
					; 22 - Duck2gun
					; 23 - Die 2gun
					; 24 - PUMP
					;
		ld	c, 44h ; 'D'    ; green
		call	sub_7C5F
		pop	hl
		jr	doPUMPLoop
; End of function doPUMP?

; ---------------------------------------------------------------------------
str_Pump?:
		ds 	4*3
; 		strXYF <0>		; DATA XREF: RAM:AnimInitTabo
; 					; doPUMP?+4o ...
; 		strXYF <0>		; 4
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrPump?:				; CODE XREF: ShowZone2Screen+2Ep
		ld	hl, str_Pump?	; 4
		ld	de, str_Pump?+1	; 4
		ld	bc, 11
		ld	(hl), 5Fh ; '_'
		ldir
		ret
; End of function clrPump?


; =============== S U B	R O U T	I N E =======================================


chkPUMP:				; CODE XREF: CheckGameRestart7890-23C3p
		ld	hl, str_Pump?	; 4

loc_9C8E:				; CODE XREF: chkPUMP+E j chkPUMP+1A j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		cp	101
		jr	c, loc_9C8E
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	bc, 200Ch
		call	chkPlayerInZone?
		or	a
		jr	z, loc_9C8E
		jp	KillPlayerChkSuperShieldFlag

KillPlayerChkSuperShieldFlag:		; CODE XREF: do_MINES+5Aj
		ld	a, (SuperShieldFlag)
		or	a

cheat_ignore_mine:
		ret	nz
; End of function chkPUMP


; =============== S U B	R O U T	I N E =======================================


KillPlayer?:				; CODE XREF: sub_90EA+1Ej sub_9BB4+1Fj ...
		ld	a, (Die_Animation_Step)
		or	a
		ret	nz
		ld	a, (dead_sprite_delay2??)
		or	a
		ret	nz
		push	af
		push	de
		ld	hl, 0
		ld	(cntrDW), hl
		xor	a
		ld	(byte_82F7), a
		ld	(byte_83DC), a
		ld	a, 46
		ld	(Die_Animation_Step), a
		add	a, 14h
		ld	(dead_sprite_delay2??),	a
;
		ld	de, (Player_X_Pos) ; 0..127
		ld	a, d
		and	-4
		ld	d, a
;
		ld	a, 11		; dead player sprite ?
		call	ShowPlayerSprite?? ; a	- sprite
		pop	de
		pop	af
		ret
; End of function KillPlayer?

; ---------------------------------------------------------------------------
Die_Animation_Step:db 0			; DATA XREF: CheckGameRestart7890-2CAAw
					; KillPlayer?r	...
; ---------------------------------------------------------------------------

showDiePlayer:				; CODE XREF: CheckGameRestart7890-243Fp
		ld	a, (Die_Animation_Step)	; 40..0
		or	a
		ret	z
;
		ld	de, (Player_X_Pos) ; 0..127
		ld	c, a
		dec	a
		ld	(Die_Animation_Step), a
		jr	z, DIE?
;
		ld	hl,  loc_9D48+1	; DieYJumpTable-1
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		cp	10
		jr	nc, loc_9D06
		call	sub_814E
		ld	a, 11
		jp	nz, ShowPlayerSprite?? ; a  - sprite

loc_9D06:				; CODE XREF: RAM:9CFCj
		ld	a, (hl)
		add	a, d
		ld	d, a
		ld	a, 11		; dead_player
		jp	ShowPlayerSprite?? ; a	- sprite
; ---------------------------------------------------------------------------

DIE?:					; CODE XREF: RAM:9CF1j
		ld	a, (BigSpriteLeftRightFlag??) ;	0 - to right, 1	- to left
		or	a
		call	nz, swapBigSprite ; Swap sprites to left/right when move in left/right directions
;
		ld	a, 1
		ld	(byte_82FA), a
;
		ld	a, (LIVES?)

cheat????:				; DATA XREF: CheckGameRestart7890-29CFr
					; CheckGameRestart7890-29CAw
		dec	a
		ld	(LIVES?), a
		ld	a, 99
		ld	(_AMMO), a
		ld	a, 10
		ld	(_GRENADES), a
		call	showAMMO
		call	showGRENADES
		call	showLIVES
;
		ld	a, (LIVES?)
		or	a
		jp	z, _game_over
;
		ld	de, (PlayerXY_COPY)

land_player_?????:			; CODE XREF: RAM:loc_9D48 j
		call	sub_814E
;
		ld	a, 5
		jp	nz, ShowPlayerSprite?? ; a  - sprite
		inc	d

loc_9D48:				; DATA XREF: RAM:9CF3o
		jr	land_player_?????
; ---------------------------------------------------------------------------
DieYJumpTable:	db    4,   4,	4,   4,	  4,   4,   4,	 4; 0
		db    4,   4,	4,   4,	  4,   4,   4,	 4; 8
		db    4,   4,	4,   4,	  4,   4,   4,	 4; 16
		db    4,   4,	2,   2,	  2,   1,   1,	 1; 24
		db    1,   0,	0,   0,	  0,0FFh,0FFh,0FFh; 32
		db 0FFh,0FEh,0FEh,0FEh,0FCh,0FCh; 40

; =============== S U B	R O U T	I N E =======================================


nopIfPlayerDie:				; CODE XREF: sub_81A4p	chkFire?p ...
		ld	a, (Die_Animation_Step)
		or	a
		ret	z
		pop	af
		ret
; End of function nopIfPlayerDie


; =============== S U B	R O U T	I N E =======================================


chkRocketLauncher:			; CODE XREF: CheckGameRestart7890-23F6p
		ld	hl, xyRocket	; 10

		.assert $==0x9D82
loc_9D82:				; CODE XREF: chkRocketLauncher+F j
					; chkRocketLauncher+40 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		call	RND?
		cp	0F7h ; '÷'
		jr	c, loc_9D82
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		dec	e
		dec	e
		ld	a, e
		sub	1Eh
		ld	c, a
		ld	a, (Player_X_Pos) ; 0..127
		cp	c
		ret	nc
		push	hl
		ld	hl, stru_9E18

loc_9DA2:				; CODE XREF: chkRocketLauncher+2E j
		bit	7, (hl)
		jr	z, loc_9DA8
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_9DA8:				; CODE XREF: chkRocketLauncher+25j
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	nz, loc_9DA2
		dec	hl
		ld	(hl), 0FEh ; 'þ'
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e
		ld	a, 8
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		call	snd_shot_tworocket
		pop	hl
		jr	loc_9D82
; End of function chkRocketLauncher

; ---------------------------------------------------------------------------
xyRocket:
		ds 	10*2
; 		str_XY <0>		; DATA XREF: RAM:AnimInitTabo
; 					; chkRocketLaunchero
; 		str_XY <0>		; 10
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
; 		str_XY <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


sub_9DD6:				; CODE XREF: CheckGameRestart7890-23F3p
		ld	hl, stru_9E18

loc_9DD9:				; CODE XREF: sub_9DD6+E j sub_9DD6+1E j	...
		ld	e, (hl)
		bit	7, e
		ret	nz
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		ld	c, a
		inc	hl
		or	a
		jr	z, loc_9DD9
		push	hl
		ld	a, 8
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	a, e
		or	a
		jr	nz, loc_9DF6
		dec	hl
		ld	(hl), 0
		pop	hl
		jr	loc_9DD9
; ---------------------------------------------------------------------------

loc_9DF6:				; CODE XREF: sub_9DD6+18j
		ld	a, c
		add	a, e
		ld	e, a
		ld	a, 8
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		ld	c, 47h ; 'G'
		call	sub_7C77
		dec	hl
		dec	hl
		dec	hl
		ld	(hl), e
		pop	hl
		jr	loc_9DD9
; End of function sub_9DD6


; =============== S U B	R O U T	I N E =======================================


clrBUF9E18:				; CODE XREF: ShowZone2Screen+31p
		ld	hl, stru_9E18
		ld	de, stru_9E18+1
		ld	(hl), 0
		ld	bc, 29
		ldir
		ret
; End of function clrBUF9E18

; ---------------------------------------------------------------------------
stru_9E18:
		ds 	10*3
; 		strXYF <0>		; DATA XREF: chkRocketLauncher+20o
; 					; sub_9DD6o ...
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


moveShotLeft?:				; CODE XREF: __move__???+3p
		ld	hl, stru_9E18

loc_9E3A:				; CODE XREF: moveShotLeft?+D j
					; moveShotLeft?+16 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9E3A
		call	sub_9B82
		or	a
		call	nz, sub_9E4F
		jr	loc_9E3A
; End of function moveShotLeft?


; =============== S U B	R O U T	I N E =======================================


sub_9E4F:				; CODE XREF: moveShotLeft?+13p
					; sub_9E64+18 p
		ld	a, 8
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		dec	hl
		ld	(hl), 0
		inc	hl
		call	addToParticleList
		call	snd_destroy_ball
		ld	de,  a000050+5
		jp	addPoints
; End of function sub_9E4F


; =============== S U B	R O U T	I N E =======================================


sub_9E64:				; CODE XREF: CheckGameRestart7890-23C0p
		ld	hl, stru_9E18

loc_9E67:				; CODE XREF: sub_9E64+D j sub_9E64+16 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9E67
		ld	bc, 804h
		call	chkPlayerInZone?
		or	a
		jr	z, loc_9E67
		call	sub_9E4F
		call	snd_destroy_ball
		jp	KillPlayer?
; End of function sub_9E64


; =============== S U B	R O U T	I N E =======================================


CompensateNoShowenSprites8x8??????:	; CODE XREF: CheckGameRestart7890-23ABp
		ld	a, (PreshiftedSpritesCallCount?)
		cp	16
		ret	nc
		ld	b, a
		ld	a, 16
		sub	b
		ld	b, a
		ld	a, 6

loc_9E92:				; CODE XREF: CompensateNoShowenSprites8x8??????+10 j
		call	Sprite8x8_XOR_Preshifted ; a - sprite num
					; 0 - shot right
					; 1 - shot left
					; 2 - Boom1 - Biggest
					; 3 - Boom2
					; 4 - Boom3
					; 5 - Boom4 - Smalest
					; 6 - Boom5 - Empty?
					; 7 - Spheres
					; 8 - shot left	small
					;
					; d,e -	y(0..191),x(0..127)
					;
					; each sprites - preshifted, 4 phases (16*8 bytes each)
					; increment call count
		djnz	loc_9E92
		ret
; End of function CompensateNoShowenSprites8x8??????

; ---------------------------------------------------------------------------
PreshiftedSpritesCallCount?:db 0	; DATA XREF: CheckGameRestart7890-245Aw
					; Sprite8x8_XOR_Preshifted+5Eo	...

; =============== S U B	R O U T	I N E =======================================


CompensateNoShowenSprites16x16??????:	; CODE XREF: CheckGameRestart7890-23A8p
		ld	a, (Sprite16x16_count_MISSING???)
		cp	6
		ret	nc
;
		ld	b, a
		ld	a, 6
		sub	b
		ld	b, a
		ld	hl, byte_B101
		xor	a

loc_9EA8:				; CODE XREF: CompensateNoShowenSprites16x16??????+12 j
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		djnz	loc_9EA8
		ret
; End of function CompensateNoShowenSprites16x16??????

; ---------------------------------------------------------------------------
Sprite16x16_count_MISSING???:db	0	; DATA XREF: CheckGameRestart7890-2457w
					; CompensateNoShowenSprites16x16??????r

; =============== S U B	R O U T	I N E =======================================


add_A_bonus_and_snd:			; CODE XREF: sub_A26B+45 p
					; chkBonusPoint?+25 j ...
		push	hl
		push	de
		call	snd_add_extra_point
		ld	e, a
		ld	d, 0
		ld	hl, (addBonusCount)
		add	hl, de
		ld	(addBonusCount), hl
		pop	de
		pop	hl
		ret
; End of function add_A_bonus_and_snd


; =============== S U B	R O U T	I N E =======================================


updateBONUS:				; CODE XREF: CheckGameRestart7890-23F0p
		ld	hl, (addBonusCount)
		ld	a, l
		or	h
		ret	z
;
		dec	hl
		ld	(addBonusCount), hl
;
		ld	de,  a000025+5
		call	addPoints
		ld	b, 40
		jp	sound48
; End of function updateBONUS

; ---------------------------------------------------------------------------
addBonusCount:	dw 0			; DATA XREF: CheckGameRestart7890-2C9Ew
					; add_A_bonus_and_snd+8r ...
SuperShieldFlag:db 0			; DATA XREF: CheckGameRestart7890-2CA7w
					; ShowPlayerSprite??+1r ...

; =============== S U B	R O U T	I N E =======================================


addTeleportParticle?:			; CODE XREF: doTeleport+2Ep
					; doTeleport+3Cp ...
		ld	hl, teleportParticles?

loc_9EDC:				; CODE XREF: addTeleportParticle?+B j
		bit	7, (hl)
		ret	nz
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	nz, loc_9EDC
		dec	hl
		ld	(hl), 20
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e
		ret
; End of function addTeleportParticle?


; =============== S U B	R O U T	I N E =======================================


moveTeleportParticleToLIST:		; CODE XREF: CheckGameRestart7890-23EDp
		ld	hl, teleportParticles?

loc_9EF1:				; CODE XREF: moveTeleportParticleToLIST+D j
					; moveTeleportParticleToLIST+23 j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9EF1
;
		dec	hl
		dec	(hl)		; dec lifetime?
		inc	hl
;
		call	RND?
		and	3
		add	a, e
		ld	e, a		; x+=rnd(8)
;
		call	RND?
		and	0Fh
		add	a, d
		ld	d, a		; y+=rnd(16)
;
		call	addToParticleList
;
		jr	loc_9EF1
; End of function moveTeleportParticleToLIST

; ---------------------------------------------------------------------------
teleportParticles?:
		ds 	4*3
; 		strXYF <0>		; DATA XREF: addTeleportParticle?o
; 					; moveTeleportParticleToLISTo ...
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrBUF9F13:				; CODE XREF: ShowZone2Screen+34p
		ld	hl, teleportParticles?
		ld	de, teleportParticles?+1
		ld	bc, 11
		ld	(hl), b
		ldir
		ret
; End of function clrBUF9F13


; =============== S U B	R O U T	I N E =======================================


chkSuperShieldChange:			; CODE XREF: CheckGameRestart7890-23E4p
		ld	a, (fl_DOWN)
		or	a
		jr	nz, ChangeSupeShield
		ld	(fl_AlreadyDown), a
		ret
; ---------------------------------------------------------------------------

ChangeSupeShield:			; CODE XREF: chkSuperShieldChange+4j
		ld	a, (fl_AlreadyDown)
		or	a
		ret	nz
;
		inc	a
		ld	(fl_AlreadyDown), a
;
		ld	de, (xySuperShield)
		bit	7, e
		ret	nz
;
		inc	d
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		ret	nz
		ld	a, (Player_X_Pos) ; 0..127
		sub	e
		sub	9
		cp	235
		ret	c
;
		ld	de, (Player_X_Pos) ; 0..127
;
		ld	a, (SuperShieldFlag)
		xor	0Ch
		ld	(SuperShieldFlag), a ; =0x0c (12) if on
;
		call	snd_got_white_box
;
		ld	a, 5
		jp	ShowPlayerSprite?? ; a	- sprite
; End of function chkSuperShieldChange

; ---------------------------------------------------------------------------
fl_AlreadyDown:	db 0			; DATA XREF: chkSuperShieldChange+6w
					; chkSuperShieldChange:ChangeSupeShieldr ...
xySuperShield:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; chkSuperShieldChange+13r
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


sub_9F71:				; CODE XREF: moveEnemy?+13 p
		push	bc
		push	de
		push	hl
		inc	e
		inc	e
		ld	hl, stru_845F

loc_9F79:				; CODE XREF: sub_9F71+14 j sub_9F71+1A j ...
		xor	a
		ld	c, (hl)
		bit	7, c
		jr	nz, loc_9F9F
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_9F79
		ld	a, c
		sub	e
		cp	0F8h ; 'ø'
		jr	c, loc_9F79
		ld	a, b
		sub	d
		sub	11h
		cp	0EEh ; 'î'
		jr	c, loc_9F79
		ld	d, b
		ld	e, c
		call	sub_82FC
		dec	hl
		ld	(hl), 0
		ld	a, 1

loc_9F9F:				; CODE XREF: sub_9F71+Cj
		pop	hl
		pop	de
		pop	bc
		ret
; End of function sub_9F71


; =============== S U B	R O U T	I N E =======================================


sub_9FA3:				; CODE XREF: sub_A26B:loc_A2B3 p
					; sub_A62D+C p ...
		push	af
		push	hl
		ld	hl, byte_A00C

loc_9FA8:				; CODE XREF: sub_9FA3+E j
		bit	7, (hl)
		jr	nz, loc_9FBA
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		inc	hl
		jr	nz, loc_9FA8
		dec	hl
		ld	(hl), 0Bh
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e

loc_9FBA:				; CODE XREF: sub_9FA3+7j
		pop	hl
		pop	af
		ret
; End of function sub_9FA3


; =============== S U B	R O U T	I N E =======================================


processAfterCircle:			; CODE XREF: CheckGameRestart7890-23E7p
		ld	iy, byte_B401
		ld	hl, byte_A00C

loc_9FC4:				; CODE XREF: processAfterCircle:loc_9FFF j
		ld	e, (hl)
		bit	7, e
		ret	nz
		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, loc_9FF6
		dec	(hl)
		ld	l, a
		ld	h, 0
		ld	bc,  loc_9FFF+1
		add	hl, bc
		ld	a, (hl)
		push	iy
		pop	hl
		ld	b, d
		ld	c, e
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		call	RND?
		and	3
		add	a, 42h ; 'B'
		ld	c, a
		call	sub_7C8F
		call	RND?
		and	1Fh
		inc	a
		ld	b, a
		call	sound48

loc_9FF6:				; CODE XREF: processAfterCircle+11j
		ld	bc, 30h	; '0'
		add	iy, bc
		pop	hl
		inc	hl
		inc	hl
		inc	hl

loc_9FFF:				; DATA XREF: processAfterCircle+17o
		jr	loc_9FC4
; End of function processAfterCircle

; ---------------------------------------------------------------------------
BoomAfterCircleTab:db sEMPTY		   ; 0
		db sCircle1_5		; 1
		db sCircle1_5		; 2
		db sCircle1_4		; 3
		db sCircle1_4		; 4
		db sCircle1_3		; 5
		db sCircle1_3		; 6
		db sCircle1_2		; 7
		db sCircle1_2		; 8
		db sCircle1_1		; 9
		db sCircle1_1		; 10
byte_A00C:	ds 15			; 0 ; DATA XREF: sub_9FA3+2o
					; processAfterCircle+4o ...
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrBUFA00C:				; CODE XREF: ShowZone2Screen+3Ap
		ld	hl, byte_A00C
		ld	de,  byte_A00C+1
		ld	bc, 14
		ld	(hl), 0
		ldir
		ret
; End of function clrBUFA00C

; ---------------------------------------------------------------------------

_game_over:				; CODE XREF: RAM:9D38j
		ld	hl, xMSG_GameOver
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		ld	hl, musicGameOver
		call	playBeeperMusic
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	updateHighScoreTab
		call	waitKEY
;
		ld	bc, 20000

loc_A048:				; CODE XREF: RAM:A052 j
		call	GetKEY
		or	a
		jp	nz, START
		dec	bc
		ld	a, b
		or	c
		jr	nz, loc_A048
		jp	START
; ---------------------------------------------------------------------------
xMSG_GameOver:	db _DF_DW_xy		; DATA XREF: RAM:_game_overo
		_XY_ 9, 10
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _E0_Attribute?
		db 56h
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Bh
		db ' '
		db _A4_deltaX_m11_dbY
		db ' '
		db 'G'
		db 'A'
		db 'M'
		db 'E'
		db ' '
		db 'O'
		db 'V'
		db 'E'
		db 'R'
		db ' '
		db _A4_deltaX_m11_dbY
		db _E4_DBcnt_DBCHR_FillCharX
		db 0Bh
		db ' '
		db _FF_EndMSG
;

; =============== S U B	R O U T	I N E =======================================


updateHighScoreTab:			; CODE XREF: RAM:A03Fp
		ld	hl, sub_B6D1
		ld	ix, HiscoreTable ; "RAFFAELE  001000"

searchLoop:				; CODE XREF: updateHighScoreTab+E0 j
		bit	7, (ix+0)
		ret	nz		; End table reached
;
		push	ix
		ld	de, 10		; skip name
		add	ix, de
;
		ld	hl, points	; "000000"
		ld	b, 6

chkCurrentLP:				; CODE XREF: updateHighScoreTab+D6 j
		ld	a, (ix+0)
		cp	(hl)
		jp	z, tryNextCHR
		jp	nc, nextRecord
;
		pop	hl
		push	hl
;
		ld	a, 255
		ld	bc, 1000
		cpir
;
		ld	hl, 1000
		and	a
		sbc	hl, bc
		push	hl
		pop	bc
		ld	de,  hiTableTailBuffer+0Eh
		ld	hl,  lastHiScoreROW+0Fh
		lddr
;
		ld	a, 0FFh
		ld	(HiscoreTable_StopByte), a
;
		pop	hl
		push	hl
;
		ld	de, 10		; skip NAME
		add	hl, de
		ex	de, hl
		ld	hl, points	; "000000"
		ld	bc, 6
		ldir			; copy score to	HiScoreTable
;
		call	ClearToBLACK
;
		ld	hl, nameBUF?	; "        "
		ld	de,  nameBUF?+1
		ld	bc, 7
		ld	(hl), ' '
		ldir
;
		ld	hl, xMSG_Congratualtion
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
;
		ld	de, 0F0Ch
		ld	hl, nameBUF?	; "        "

edit_name_loop:				; CODE XREF: updateHighScoreTab+9B j
					; updateHighScoreTab+A0 j ...
		ld	c, 44h ; 'D'
		ld	a, 3Fh ; '?'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y

loc_A0E5:				; CODE XREF: updateHighScoreTab+B8 j
		ld	bc, 3E8h
		call	_delayLDIR	; BC
;
		call	waitKEY
;
		push	de

loc_A0EF:				; CODE XREF: updateHighScoreTab+80 j
					; updateHighScoreTab+84 j
		call	GetKEY
		or	a
		jr	z, loc_A0EF
		cp	2
		jr	z, loc_A0EF
		pop	de
		cp	0Dh
		jr	z, endEnterName
		cp	1
		jr	nz, plain_char
		ld	a, e
		cp	19		; x?
		jr	nz, loc_A110
		ld	a, (hl)
		cp	' '
		jr	z, loc_A110
		ld	(hl), ' '
		jr	edit_name_loop
; ---------------------------------------------------------------------------

loc_A110:				; CODE XREF: updateHighScoreTab+92j
					; updateHighScoreTab+97j
		ld	a, e
		cp	0Ch
		jr	z, edit_name_loop
		ld	a, 2Dh ; '-'
		ld	c, 47h ; 'G'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		dec	hl
		ld	(hl), 20h ; ' '
		dec	e
		jr	edit_name_loop
; ---------------------------------------------------------------------------

plain_char:				; CODE XREF: updateHighScoreTab+8Dj
		ld	(hl), a
		ld	c, 46h ; 'F'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		ld	a, e
		cp	13h
		jr	z, loc_A0E5
		inc	hl
		inc	e
		jr	edit_name_loop
; ---------------------------------------------------------------------------

endEnterName:				; CODE XREF: updateHighScoreTab+89j
		pop	de
		ld	hl, nameBUF?	; "        "
		ld	bc, 8
		ldir
		ld	a, 1
		ld	(HiScoreUpdatedFlag), a
		call	waitKEY
		jp	START
; ---------------------------------------------------------------------------

tryNextCHR:				; CODE XREF: updateHighScoreTab+1Cj
		inc	hl
		inc	ix
		dec	b
		jp	nz, chkCurrentLP

nextRecord:				; CODE XREF: updateHighScoreTab+1Fj
		pop	ix
		ld	de, 16
		add	ix, de
		jp	searchLoop
; End of function updateHighScoreTab

; ---------------------------------------------------------------------------
xMSG_Congratualtion:db _E6_DW_FONT	; DATA XREF: updateHighScoreTab+5Fo
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
;
xMSG_BorderHorizontal:db _E3_DWptr_RecursiveCallxMSG ; DATA XREF: RAM:A15Do
					; RAM:A170o ...
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
;
xMSG_BorderCorner?:db _DC_setLoColor_13_blue ; DATA XREF: RAM:A211o RAM:A225o
		db 0
		db _D4_setLoColor_05
		db 1
		db _AD_deltaX__m2
		db _DC_setLoColor_13_blue
		db 2
		db _D4_setLoColor_05
		db 3
		db _FF_EndMSG
;
nameBUF?:	db '        '       ; DATA XREF: updateHighScoreTab+52o
					; updateHighScoreTab+68o ...

; =============== S U B	R O U T	I N E =======================================


sub_A23A:				; CODE XREF: ShowZone2Screen+89p
					; sub_A26B+4 j ...
		xor	a
		ld	(byte_A26A), a
;
		ld	de, (xyGreenSphereWithLines)
		bit	7, e
		ret	nz
;
		ld	a, (Die_Animation_Step)
		or	a
		ret	nz
;
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
		ld	a, (hl)
		cp	anin_0D
		ret	nz
;
		ld	(byte_A26A), a
		call	RND?
		and	7Fh ; ''
		add	a, 20h ; ' '
		ld	h, a
		ld	l, 120
		ld	(xy???Random), hl
		ret
; End of function sub_A23A

; ---------------------------------------------------------------------------
xyGreenSphereWithLines:dw 0		; DATA XREF: RAM:AnimInitTabo
					; sub_A23A+4r ...
xy???Random:	dw 0			; DATA XREF: sub_A23A+28w sub_A26B+E r	...
byte_A26A:	db 0			; DATA XREF: sub_A23A+1w sub_A23A+1Bw	...

; =============== S U B	R O U T	I N E =======================================


sub_A26B:				; CODE XREF: CheckGameRestart7890-23E1p
		ld	a, (byte_A26A)
		or	a
		jp	z, sub_A23A
;
		ld	de, (xyGreenSphereWithLines)
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, (xy???Random)
		push	de
		ld	bc, no_walk_tab	; ?AnimationTab?
		add	hl, bc
		ld	a, (hl)
		cp	anin_0D
		jr	nz, loc_A2AE	; 34*25=850 points
		ld	l, 0Ah
		dec	e
		ld	a, e
		cp	0FFh
		jr	nc, loc_A2B6
		cp	46h ; 'F'
		jr	nc, loc_A295
		inc	l
		dec	e

loc_A295:				; CODE XREF: sub_A26B+26j
		ld	a, (Player_Y_Pos) ; 0x70 - ground
		cp	d
		jr	z, loc_A2A0
		jr	nc, loc_A29F
		dec	d
		dec	d

loc_A29F:				; CODE XREF: sub_A26B+30j
		inc	d

loc_A2A0:				; CODE XREF: sub_A26B+2Ej
		ld	bc, 1008h
		call	chkPlayerInZone?
		or	a
		jr	z, loc_A2C4
		call	KillPlayer?
		jr	loc_A2B3
; ---------------------------------------------------------------------------

loc_A2AE:				; CODE XREF: sub_A26B+1Aj
		ld	a, 34		; 34*25=850 points
		call	add_A_bonus_and_snd

loc_A2B3:				; CODE XREF: sub_A26B+41j
		call	sub_9FA3

loc_A2B6:				; CODE XREF: sub_A26B+22j
		pop	bc
		xor	a
		ld	hl, byte_B4F1
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		ld	(byte_A26A), a
		jp	sub_A23A
; ---------------------------------------------------------------------------

loc_A2C4:				; CODE XREF: sub_A26B+3Cj
		ld	(xy???Random), de
		pop	bc
		ld	a, l
		ld	hl, byte_B4F1
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		ld	c, 47h ; 'G'
		jp	sub_7C8F
; End of function sub_A26B


; =============== S U B	R O U T	I N E =======================================


randomStars:				; CODE XREF: ShowZone2Screen+7Dp
		ld	hl, FNT_SmallHLIne ; 4 chars
		ld	(FontPTR+1), hl
		ld	b, 22

StarLineLoop:				; CODE XREF: randomStars+33 j
		push	bc
		ld	a, 3

starInLineLoop:				; CODE XREF: randomStars+30 j
		ex	af, af'
		call	RND?
		and	1Fh
		ld	e, a
		ld	d, b
		dec	d
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		push	bc
		ld	bc, ATTR_TABLE_COPY
		add	hl, bc
		pop	bc
		ld	a, (hl)
		or	a
		jr	nz, loc_A303
		call	RND?
		and	7
		or	42h ; 'B'
		ld	c, a
		ld	a, 3		; one dot (START)
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y

loc_A303:				; CODE XREF: randomStars+1Fj
		ex	af, af'
		dec	a
		jr	nz, starInLineLoop
		pop	bc
		djnz	StarLineLoop
		ret
; End of function randomStars


; =============== S U B	R O U T	I N E =======================================


chkBonusPoint?:				; CODE XREF: CheckGameRestart7890-23DEp
		ld	hl, xyBONUS

loc_A30E:				; CODE XREF: chkBonusPoint?+D j
					; chkBonusPoint?+1B j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_A30E
		push	de
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	bc, 804h
		call	chkPlayerInZone?
		pop	de
		or	a
		jr	z, loc_A30E
		dec	hl
		ld	(hl), 0
		call	snd_add_extra_point
		ld	a, 40		; 25*40=1000 points
		jp	add_A_bonus_and_snd
; End of function chkBonusPoint?

; ---------------------------------------------------------------------------
xyBONUS:
		ds 	10*3
; 		strXYF <0>		; DATA XREF: RAM:AnimInitTabo
; 					; chkBonusPoint?o ...
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrBONUSBUF:				; CODE XREF: ShowZone2Screen+3Dp
		ld	hl, xyBONUS
		ld	de, xyBONUS+1
		ld	bc, 11
		ld	(hl), 1
		ldir
		ret
; End of function clrBONUSBUF


; =============== S U B	R O U T	I N E =======================================


;ENEMY ------------------------------------------------------------------------------------------------------------------------- ENEMY

doEnemyMove:				; CODE XREF: CheckGameRestart7890-23DBp
		ld	iy, byte_B521
		ld	hl, _enimy_data?

enemyDataLoop:				; CODE XREF: doEnemyMove+A3 j
		ld	e, (hl)		; x
		bit	7, e
		ret	nz
;
		push	hl
		inc	hl
		ld	d, (hl)		; y
		inc	hl
		ld	a, (hl)		; inuse
		or	a
		jp	z, emNext
;
		push	de
		inc	hl
		inc	hl		; ;dw strategy src
		inc	hl
;
		ld	c, (hl)
		inc	hl
		ld	b, (hl)		; bc - strategy	work
		inc	hl
		ld	a, (hl)		; sequence_c4_len
		or	a
		jr	nz, doC4Step

processEnemyDataLoop:			; CODE XREF: doEnemyMove+5D j
		ld	a, (bc)		; dx
		cp	0C4h ; 'Ä'
		jp	z, prepareC4	; loop ?
		cp	0C3h ; 'Ã'
		jp	z, restartSequence ; last byte ?
;
		add	a, e
		ld	e, a
		inc	bc
;
		ld	a, (bc)		; dy
		add	a, d
		ld	d, a
;
		inc	bc
		dec	hl
		ld	(hl), b
		dec	hl
		ld	(hl), c
		jp	showHideSprite?	; prev xy
; ---------------------------------------------------------------------------

doC4Step:				; CODE XREF: doEnemyMove+1Ej
					; doEnemyMove+4F j
		dec	(hl)
		ld	a, (bc)
		add	a, e
		ld	e, a
		inc	bc
		ld	a, (bc)
		add	a, d
		ld	d, a
		jp	showHideSprite?	; prev xy
; ---------------------------------------------------------------------------

prepareC4:				; CODE XREF: doEnemyMove+23j
		inc	bc
		ld	a, (bc)		; len?
		dec	a
		ld	(hl), a
		inc	bc
		dec	hl
		ld	(hl), b
		dec	hl
		ld	(hl), c
		inc	hl
		inc	hl
		jr	doC4Step
; ---------------------------------------------------------------------------

restartSequence:			; CODE XREF: doEnemyMove+28j
		dec	hl
		dec	hl
		dec	hl
		ld	b, (hl)
		dec	hl
		ld	c, (hl)
		inc	hl
		inc	hl
		ld	(hl), c
		inc	hl
		ld	(hl), b
		inc	hl
		jp	processEnemyDataLoop ; dx
; ---------------------------------------------------------------------------

showHideSprite?:			; CODE XREF: doEnemyMove+36j
					; doEnemyMove+41j
		pop	bc		; prev xy
		pop	hl		; str ptr
		push	hl
		ld	a, e
		cp	128
		jp	nc, enemyOutOfScreen
		ld	a, d
		cp	176
		jp	nc, enemyOutOfScreen
;
; save new xy
		ld	(hl), e
		inc	hl
		ld	(hl), d
		push	de
;
		ld	de, 7
		add	hl, de
		ld	a, (hl)		; sprite phase
		inc	(hl)
		and	3

en_sprite_base_number:			; DATA XREF: prepareEnemy???+28 w
		add	a, 1		; sprite base number
		pop	de
		push	hl
		push	iy
		pop	hl
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		pop	hl
		inc	hl
		ld	c, (hl)
		call	sub_7C8F
		jp	emNext
; ---------------------------------------------------------------------------

enemyOutOfScreen:			; CODE XREF: doEnemyMove+66j
					; doEnemyMove+6Cj
		inc	hl
		inc	hl
		ld	(hl), 0
		xor	a
		push	iy
		pop	hl
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;

emNext:					; CODE XREF: doEnemyMove+11j
					; doEnemyMove+8Bj
		pop	hl
		ld	de, 0Ah
		add	hl, de
		ld	de, 30h	; '0'
		add	iy, de
		jp	enemyDataLoop	; x
; End of function doEnemyMove

; ---------------------------------------------------------------------------
enemy_strategy_01:
		str_SpriteStragegy 0FFh,    0 ; 0
		str_SpriteStragegy 0FFh,    0 ; 1
		str_SpriteStragegy 0FFh, 0FFh ; 2
		str_SpriteStragegy 0FFh, 0FFh ; 3
		str_SpriteStragegy 0FFh, 0FEh ; 4
		str_SpriteStragegy 0FFh, 0FEh ; 5
		str_SpriteStragegy 0FFh, 0FDh ; 6
		str_SpriteStragegy 0FFh, 0FDh ; 7
		str_SpriteStragegy 0FFh, 0FDh ; 8
		str_SpriteStragegy 0FFh, 0FDh ; 9
		str_SpriteStragegy 0FFh, 0FDh ; 10
		str_SpriteStragegy 0FFh, 0FDh ; 11
		str_SpriteStragegy 0FFh, 0FEh ; 12
		str_SpriteStragegy 0FFh, 0FEh ; 13
		str_SpriteStragegy 0FFh, 0FFh ; 14
		str_SpriteStragegy 0FFh, 0FFh ; 15
		str_SpriteStragegy 0FFh,    0 ; 16
		str_SpriteStragegy 0FFh,    1 ; 17
		str_SpriteStragegy 0FFh,    1 ; 18
		str_SpriteStragegy 0FFh,    2 ; 19
		str_SpriteStragegy 0FFh,    2 ; 20
		str_SpriteStragegy 0FFh,    3 ; 21
		str_SpriteStragegy 0FFh,    3 ; 22
		str_SpriteStragegy 0FFh,    3 ; 23
		str_SpriteStragegy 0FFh,    3 ; 24
		str_SpriteStragegy 0FFh,    3 ; 25
		str_SpriteStragegy 0FFh,    3 ; 26
		str_SpriteStragegy 0FFh,    2 ; 27
		str_SpriteStragegy 0FFh,    2 ; 28
		str_SpriteStragegy 0FFh,    1 ; 29
		str_SpriteStragegy 0FFh,    1 ; 30
		db 0C3h	 ; Ã
enemy_strategy_02:
		str_SpriteStragegy 0FFh,    0 ; 0  ; DATA XREF: RAM:tab_enemy o
		str_SpriteStragegy 0FFh,    0 ; 1
		str_SpriteStragegy 0FFh, 0FFh ; 2
		str_SpriteStragegy 0FFh, 0FFh ; 3
		str_SpriteStragegy 0FFh, 0FEh ; 4
		str_SpriteStragegy 0FFh, 0FEh ; 5
		str_SpriteStragegy 0FFh, 0FDh ; 6
		str_SpriteStragegy 0FFh, 0FDh ; 7
		str_SpriteStragegy 0FFh, 0FDh ; 8
		str_SpriteStragegy 0FFh, 0FDh ; 9
		str_SpriteStragegy 0FFh, 0FDh ; 10
		str_SpriteStragegy 0FFh, 0FDh ; 11
		str_SpriteStragegy 0FFh, 0FEh ; 12
		str_SpriteStragegy 0FFh, 0FEh ; 13
		str_SpriteStragegy 0FFh, 0FFh ; 14
		str_SpriteStragegy 0FFh, 0FFh ; 15
		str_SpriteStragegy 0FFh,    0 ; 16
		str_SpriteStragegy 0FFh,    1 ; 17
		str_SpriteStragegy 0FFh,    1 ; 18
		str_SpriteStragegy 0FFh,    2 ; 19
		str_SpriteStragegy 0FFh,    2 ; 20
		str_SpriteStragegy 0FFh,    3 ; 21
		str_SpriteStragegy 0FFh,    3 ; 22
		str_SpriteStragegy 0FFh,    3 ; 23
		str_SpriteStragegy 0FFh,    3 ; 24
		str_SpriteStragegy 0FFh,    3 ; 25
		str_SpriteStragegy 0FFh,    3 ; 26
		str_SpriteStragegy 0FFh,    2 ; 27
		str_SpriteStragegy 0FFh,    2 ; 28
		str_SpriteStragegy 0FFh,    1 ; 29
		str_SpriteStragegy 0FFh,    1 ; 30
		str_SpriteStragegy 0C4h,  0Fh ; 31
		str_SpriteStragegy 0FFh,    0 ; 32
		str_SpriteStragegy 0C4h,    6 ; 33
		str_SpriteStragegy 0FEh,    0 ; 34
		str_SpriteStragegy 0C4h,  64h ; 35
		str_SpriteStragegy 0FCh,    0 ; 36
		db 0C3h	 ; Ã
enemy_strategy_03:
		str_SpriteStragegy 0C4h,  22h ; 0  ; DATA XREF: RAM:tab_enemy o
		str_SpriteStragegy 0FEh,    0 ; 1
		str_SpriteStragegy 0C4h,    4 ; 2
		str_SpriteStragegy 0FEh, 0FEh ; 3
		str_SpriteStragegy 0C4h,    2 ; 4
		str_SpriteStragegy 0FEh, 0F8h ; 5
		str_SpriteStragegy 0C4h,    3 ; 6
		str_SpriteStragegy    0, 0F8h ; 7
		str_SpriteStragegy 0C4h,    2 ; 8
		str_SpriteStragegy    2, 0F8h ; 9
		str_SpriteStragegy 0C4h,    4 ; 10
		str_SpriteStragegy    2, 0FEh ; 11
		str_SpriteStragegy 0C4h,    6 ; 12
		str_SpriteStragegy    2,    0 ; 13
		str_SpriteStragegy 0C4h,    4 ; 14
		str_SpriteStragegy    2,    2 ; 15
		str_SpriteStragegy 0C4h,    2 ; 16
		str_SpriteStragegy    2,    8 ; 17
		str_SpriteStragegy 0C4h,    3 ; 18
		str_SpriteStragegy    0,    8 ; 19
		str_SpriteStragegy 0C4h,    2 ; 20
		str_SpriteStragegy 0FEh,    8 ; 21
		str_SpriteStragegy 0C4h,    4 ; 22
		str_SpriteStragegy 0FEh,    2 ; 23
		str_SpriteStragegy 0C4h,  64h ; 24
		str_SpriteStragegy 0FEh,    0 ; 25
		db 0C3h	 ; Ã
enemy_strategy_04:
		str_SpriteStragegy 0C4h,  28h ; 0  ; DATA XREF: RAM:tab_enemy o
		str_SpriteStragegy 0FFh,    0 ; 1
		str_SpriteStragegy 0C4h,  64h ; 2
		str_SpriteStragegy 0FCh,    0 ; 3
		db 0C3h	 ; Ã
enemy_strategy_05:
		str_SpriteStragegy 0C4h,  12h ; 0  ; DATA XREF: RAM:tab_enemy o
		str_SpriteStragegy 0FEh,    0 ; 1
		str_SpriteStragegy 0C4h,  20h ; 2
		str_SpriteStragegy    0, 0FFh ; 3
		str_SpriteStragegy 0C4h,  18h ; 4
		str_SpriteStragegy    0,    1 ; 5
		str_SpriteStragegy 0C4h,    6 ; 6
		str_SpriteStragegy    0,    0 ; 7
		str_SpriteStragegy 0C4h,  64h ; 8
		str_SpriteStragegy 0FCh,    0 ; 9
		db 0C3h	 ; Ã
enemy_strategy_06:
		str_SpriteStragegy 0C4h,    8 ; 0  ; DATA XREF: RAM:tab_enemy o
		str_SpriteStragegy 0FEh, 0FCh ; 1
		str_SpriteStragegy 0C4h,    8 ; 2
		str_SpriteStragegy 0FEh,    4 ; 3
		str_SpriteStragegy 0C4h,    8 ; 4
		str_SpriteStragegy 0FEh, 0FCh ; 5
		str_SpriteStragegy 0C4h,    8 ; 6
		str_SpriteStragegy    0,    4 ; 7
		str_SpriteStragegy 0C4h,  18h ; 8
		str_SpriteStragegy 0FEh,    0 ; 9
		str_SpriteStragegy 0C4h,    6 ; 10
		str_SpriteStragegy    0, 0FCh ; 11
		str_SpriteStragegy 0C4h,    6 ; 12
		str_SpriteStragegy    2,    0 ; 13
		str_SpriteStragegy 0C4h,    6 ; 14
		str_SpriteStragegy    0,    4 ; 15
		str_SpriteStragegy 0C4h,  64h ; 16
		str_SpriteStragegy 0FCh,    0 ; 17
		db 0C3h	 ; Ã
;
_enimy_data?:	
		ds 	6*10
 ; 		str_enemy <0>		; DATA XREF: doEnemyMove+4o
; 					; clrEnemyData o ...
; 		str_enemy <0>
; 		str_enemy <0>
; 		str_enemy <0>
; 		str_enemy <0>
; 		str_enemy <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clrEnemyData:				; CODE XREF: ShowZone2Screen+37p
		ld	hl, _enimy_data?
		ld	de, _enimy_data?+1
		ld	bc, 59
		ld	(hl), 0
		ldir
		ret
; End of function clrEnemyData

;

; =============== S U B	R O U T	I N E =======================================


addNewFlyingEnemy:			; CODE XREF: CheckGameRestart7890-23EAp
		call	nopIfPlayerDie
		ld	a, (fl_enemy)
		or	a

cheat_no_enemy:				; replace to RET
		ret	z
;
		ld	hl, NextEnemyDelay??
		ld	a, (hl)
		or	a
		jr	z, loc_A564

CHEAT_FLYING:				; change to NOP	- remove flying	enemy
		dec	(hl)
		ret
; ---------------------------------------------------------------------------

loc_A564:				; CODE XREF: addNewFlyingEnemy+Dj
		ld	a, (Player_X_Pos) ; 0..127
		cp	84		; 2/3 of screen, no new	enemy if player	of 3 part of screen
		ret	nc
;
		ld	hl, _enimy_data?
		ld	bc, 0Ah		; struct size

loc_A570:				; CODE XREF: addNewFlyingEnemy+2A j
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		push	hl
		inc	hl
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, loc_A57F
		pop	hl
		add	hl, bc
		jr	loc_A570
; ---------------------------------------------------------------------------
		.assert $==0xA57F

loc_A57F:				; CODE XREF: addNewFlyingEnemy+26j
		pop	hl
		call	RND?
		cp	200
		ret	c
;
		ld	(hl), 120	; missle x ?
		inc	hl
		ld	de, (Player_X_Pos) ; 0..127
;
		call	RND?
		cp	175
		jr	c, loc_A599
;
		ld	a, d
		sub	10		; y-10
		jr	loc_A59F	; Y
; ---------------------------------------------------------------------------

loc_A599:				; CODE XREF: addNewFlyingEnemy+3Fj
		call	RND?
		and	0Fh
		add	a, d		; y+rnd(0..15)

loc_A59F:				; CODE XREF: addNewFlyingEnemy+44j
		ld	(hl), a		; Y
		inc	hl
		ld	(hl), 1
		inc	hl

en_strategy?:				; DATA XREF: prepareEnemy???+22 w
		ld	de, enemy_strategy_01
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), 0		; +7
		inc	hl
		ld	(hl), 3		; +8
		inc	hl
;
		call	RND?
		and	7
		cp	2
		jr	nc, loc_A5C0
		add	a, 4

loc_A5C0:				; CODE XREF: addNewFlyingEnemy+69j
		or	40h ; '@'
		ld	(hl), a		; +9 Color?

en_delay:				; DATA XREF: prepareEnemy???+2D w
		ld	a, 9
		ld	(NextEnemyDelay??), a
		ret
; End of function addNewFlyingEnemy

; ---------------------------------------------------------------------------
NextEnemyDelay??:db 0			; DATA XREF: addNewFlyingEnemy+8o
					; addNewFlyingEnemy+72w

; =============== S U B	R O U T	I N E =======================================


moveEnemy?:				; CODE XREF: __move__???+6p
		ld	iy, byte_B521
		ld	hl, _enimy_data?

loc_A5D1:				; CODE XREF: moveEnemy?+28 j
		ld	e, (hl)		; x
		bit	7, e
		ret	nz
;
		push	hl
		inc	hl
		ld	d, (hl)		; y
		inc	hl
		ld	a, (hl)		; flag
		or	a
		jr	z, loc_A5E8
		call	sub_9F71
		or	a
		jr	z, loc_A5E8
		pop	hl
		push	hl
		call	sub_A62D

loc_A5E8:				; CODE XREF: moveEnemy?+11j
					; moveEnemy?+17j
		pop	hl
		ld	de, 10
		add	hl, de
		ld	de, 48
		add	iy, de
		jr	loc_A5D1	; x
; End of function moveEnemy?


; =============== S U B	R O U T	I N E =======================================


sub_A5F4:				; CODE XREF: CheckGameRestart7890-23BDp
		ld	iy, byte_B521
		ld	hl, _enimy_data?

loc_A5FB:				; CODE XREF: sub_A5F4+37 j
		ld	e, (hl)
		bit	7, e
		ret	nz
		push	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		or	a
		jr	z, loc_A621
		ld	bc, 804h
		inc	e
		inc	e
		inc	d
		inc	d
		inc	d
		inc	d
		call	chkPlayerInZone?
		or	a
		jr	z, loc_A621
		pop	hl
		push	hl
		dec	e
		dec	d
		dec	d
		call	sub_A62D
		call	KillPlayer?

		.assert $==0xA621
loc_A621:				; CODE XREF: sub_A5F4+11j sub_A5F4+20j
		pop	hl
		ld	de, 10
		add	hl, de
		ld	de, 48
		add	iy, de
		jr	loc_A5FB
; End of function sub_A5F4


; =============== S U B	R O U T	I N E =======================================


sub_A62D:				; CODE XREF: moveEnemy?+1Bp
					; sub_A5F4+27p
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		xor	a
		ld	(hl), a
		push	iy
		pop	hl
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		call	sub_9FA3
		call	snd_destroy_ball
		ld	de,  a000150+5
		jp	addPoints
; End of function sub_A62D


; =============== S U B	R O U T	I N E =======================================


prepareEnemy???:			; CODE XREF: ShowZone2Screen+86p
		xor	a
		ld	(fl_enemy), a
;
		ld	hl, tab_enemy
		ld	a, (_ZONE)
		ld	b, a

loc_A650:				; CODE XREF: prepareEnemy???+17 j
		ld	a, (hl)
		cp	0FFh
		ret	z
		cp	b
		jr	z, loc_A65E
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		jr	loc_A650
; ---------------------------------------------------------------------------

loc_A65E:				; CODE XREF: prepareEnemy???+10j
		ld	a, 1
		ld	(fl_enemy), a
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(en_strategy?+1), de
		inc	hl
		ld	a, (hl)
		ld	(en_sprite_base_number+1), a ; sprite base number
		inc	hl
		ld	a, (hl)
		ld	(en_delay+1), a
		ret
; End of function prepareEnemy???

; ---------------------------------------------------------------------------
fl_enemy:	db 0			; DATA XREF: addNewFlyingEnemy+3r

tab_enemy:	str_enemy_params   3, enemy_strategy_01, sBall_1,  20 ; 0
		str_enemy_params   4, enemy_strategy_01, sBall_1,  20 ; 1
		str_enemy_params   5, enemy_strategy_01, sBall_1,  20 ; 2
		str_enemy_params  10, enemy_strategy_02, sRocket_1,  20 ; 3
		str_enemy_params  11, enemy_strategy_02, sRocket_1,  40 ; 4
		str_enemy_params  13, enemy_strategy_02, sRocket_1,  20 ; 5
		str_enemy_params  15, enemy_strategy_03, sShip1_1,  13 ; 6
		str_enemy_params  16, enemy_strategy_02, sRocket_1,  30 ; 7
		str_enemy_params  17, enemy_strategy_01, sBall_1,  20 ; 8
		str_enemy_params  19, enemy_strategy_04, sRocket_1,  20 ; 9
		str_enemy_params  21, enemy_strategy_01, sBall_1,  30 ; 10
		str_enemy_params  22, enemy_strategy_03, sShip1_1,  13 ; 11
		str_enemy_params  26, enemy_strategy_04, sShipBee_1,	8 ; 12
		str_enemy_params  28, enemy_strategy_01, sShip1_1,  16 ; 13
		str_enemy_params  29, enemy_strategy_04, sRocket_1,  25 ; 14
		str_enemy_params  30, enemy_strategy_04, sRocket_1,  15 ; 15
		str_enemy_params  33, enemy_strategy_01, sBall_1,  20 ; 16
		str_enemy_params  36, enemy_strategy_03, sShipBee_1,	8 ; 17
		str_enemy_params  37, enemy_strategy_02, sShip1_1,  20 ; 18
		str_enemy_params  38, enemy_strategy_02, sShip1_1,   8 ; 19
		str_enemy_params  39, enemy_strategy_01, sBall_1,  20 ; 20
		str_enemy_params  42, enemy_strategy_04, sRocket_1,   8 ; 21
		str_enemy_params  43, enemy_strategy_04, sRocket_1,   8 ; 22
		str_enemy_params  44, enemy_strategy_01, sBall_1,  20 ; 23
		str_enemy_params  48, enemy_strategy_04, sRocket_1,  20 ; 24
		str_enemy_params  49, enemy_strategy_03, sBall_1,   8 ; 25
		str_enemy_params  51, enemy_strategy_05, sRocket2_1,	9 ; 26
		str_enemy_params  54, enemy_strategy_06, sRocket3_1,  30 ; 27
		str_enemy_params  55, enemy_strategy_01, sBall_1,   9 ; 28
		str_enemy_params  56, enemy_strategy_02, sRocket3_1,	9 ; 29
		str_enemy_params  58, enemy_strategy_06, sBall_1,  20 ; 30
		str_enemy_params  59, enemy_strategy_04, sRocket2_1,	9 ; 31
		str_enemy_params  62, enemy_strategy_05, sShip1_1,   9 ; 32
		str_enemy_params  63, enemy_strategy_01, sRocket2_1,	9 ; 33
		str_enemy_params  64, enemy_strategy_04, sRocket_1,   9 ; 34
		str_enemy_params  66, enemy_strategy_06, sRocket_1,  30 ; 35
		str_enemy_params  68, enemy_strategy_01, sShipBee_1,	8 ; 36
		str_enemy_params  69, enemy_strategy_04, sRocket_1,  40 ; 37
		str_enemy_params  72, enemy_strategy_06, sBall_1,  35 ; 38
		str_enemy_params  74, enemy_strategy_06, sRocket_1,  12 ; 39
		str_enemy_params  75, enemy_strategy_01, sBall_1,   9 ; 40
		str_enemy_params  76, enemy_strategy_04, sBall_1,   9 ; 41
		str_enemy_params  77, enemy_strategy_05, sRocket2_1,	9 ; 42
		str_enemy_params  79, enemy_strategy_03, sShip1_1,   9 ; 43
		str_enemy_params  80, enemy_strategy_06, sRocket3_1,  30 ; 44
		str_enemy_params  83, enemy_strategy_06, sRocket3_1,	9 ; 45
		str_enemy_params  84, enemy_strategy_05, sRocket3_1,	9 ; 46
		str_enemy_params  85, enemy_strategy_03, sBall_1,   8 ; 47
		str_enemy_params  86, enemy_strategy_04, sShipBee_1,	9 ; 48
		str_enemy_params  89, enemy_strategy_02, sRocket_1,   9 ; 49
		str_enemy_params  90, enemy_strategy_04, sRocket2_1,	8 ; 50
		str_enemy_params  91, enemy_strategy_05, sRocket3_1,  25 ; 51
		str_enemy_params  94, enemy_strategy_02, sShipBee_1,  16 ; 52
		str_enemy_params  96, enemy_strategy_06, sRocket_1,  30 ; 53
		str_enemy_params  98, enemy_strategy_06, sRocket3_1,  35 ; 54
		str_enemy_params  99, enemy_strategy_03, sBall_1,   8 ; 55
		str_enemy_params 101, enemy_strategy_04, sShipBee_1,	8 ; 56
		str_enemy_params 103, enemy_strategy_01, sShip1_1,  10 ; 57
		str_enemy_params 104, enemy_strategy_04, sRocket_1,  10 ; 58
		str_enemy_params 105, enemy_strategy_04, sRocket_1,  10 ; 59
		str_enemy_params 108, enemy_strategy_01, sBall_1,  10 ; 60
		str_enemy_params 111, enemy_strategy_03, sShipBee_1,	8 ; 61
		str_enemy_params 112, enemy_strategy_02, sShip1_1,  20 ; 62
		str_enemy_params 113, enemy_strategy_02, sShip1_1,   8 ; 63
		str_enemy_params 114, enemy_strategy_01, sBall_1,  10 ; 64
		str_enemy_params 117, enemy_strategy_04, sRocket_1,   8 ; 65
		str_enemy_params 118, enemy_strategy_04, sRocket_1,   8 ; 66
		str_enemy_params 119, enemy_strategy_01, sBall_1,  10 ; 67
		str_enemy_params 123, enemy_strategy_04, sRocket_1,  10 ; 68
		str_enemy_params 124, enemy_strategy_03, sBall_1,   8 ; 69
		db 0FFh

; =============== S U B	R O U T	I N E =======================================

;ENEMY ------------------------------------------------------------------------------------------------------------------------- ENEMY

chkHighVoltage:				; CODE XREF: CheckGameRestart7890-23D8p
		ld	hl, xyHighVoltage
		ld	e, (hl)
		bit	7, e
		ret	nz
;
		inc	hl
		ld	d, (hl)
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	hl, byte_B641
		ld	b, d
		ld	c, e
		call	RND?
		and	3
		add	a, 28		; HighVoltage1..8
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		ld	bc, 48
		add	hl, bc
		ld	c, a
		ld	a, e
		add	a, 8
		ld	e, a
		ld	a, c
		inc	a
		ld	b, d
		ld	c, e
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		call	RND?
		and	7
		or	40h ; '@'
		ld	c, a
		call	sub_7C8F
		ld	b, a
		ld	a, e
		sub	8
		ld	e, a
		jp	sub_7C8F
; End of function chkHighVoltage

; ---------------------------------------------------------------------------
xyHighVoltage:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; chkHighVoltageo
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


chkEndLevel???:				; CODE XREF: CheckGameRestart7890-23D5p
		ld	de, (xyEndLevel)
		bit	7, e
		ret	nz
;
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_X_Pos) ; 0..127
		cp	e
		ret	c
		ld	hl, xMSG_Bonus?
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		ld	a, (LIVES?)
		ld	b, a
		add	a, 30h ; '0'
		ld	de, 0C0Dh
		ld	c, 46h ; 'F'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		ld	de,  a001000+5

loc_A83D:				; CODE XREF: chkEndLevel???+29 j
		call	addPoints
		djnz	loc_A83D
;
		ld	a, (SuperShieldFlag)
		or	a
		jr	nz, skipBonusIfSuperShield
;
		ld	c, 47h ; 'G'
		ld	a, '1'
		ld	de, 80Eh
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		ld	bc, 80

		.assert $==0xA855
loc_A855:				; CODE XREF: chkEndLevel???+4E j
		push	bc
		ld	de,  a000125+5
		call	addPoints
		ld	b, 3Ch ; '<'
		call	sound48
		pop	bc
		dec	bc
		ld	a, b
		or	c
		jr	nz, loc_A855

skipBonusIfSuperShield:			; CODE XREF: chkEndLevel???+2Fj
		ld	a, (_ZONE)
		cp	124
		jr	nz, noLastLevel
;
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
;
		call	ClearToBLACK
		ld	hl, xMsg_FULL_COMBAT_ABILITY
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		ld	a, 0FFh
		ld	(_ZONE), a
;
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC

noLastLevel:				; CODE XREF: chkEndLevel???+55j
		call	doLevelBonusScreen
;
		ld	hl, unk_768E
		ld	a, (LIVES?)
		cp	9
		jr	nc, loc_A8A5
		inc	a
		ld	(LIVES?), a

loc_A8A5:				; CODE XREF: chkEndLevel???+88j
		xor	a
		ld	(SuperShieldFlag), a
		ld	a, 99
		ld	(_AMMO), a
		ld	a, 10
		ld	(_GRENADES), a
;
		ld	a, 136
		call	nextZONEPrepare	; A - player Y pos
;
		call	doNewZone
		call	show2BottomLine
;
		xor	a
		ld	(byte_82F7), a


; here only for	first stage levels
; fix player position for New Stage



		ld	hl, tab_StagePlayerStartPos
		ld	a, (_ZONE)
		ld	b, a

loc_A8C9:				; CODE XREF: chkEndLevel???+B9 j
		ld	a, (hl)
		cp	b
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		jr	nz, loc_A8C9
;
		ld	(Player_X_Pos),	de ; 0..127
		ld	(PlayerXY_COPY), de
		ret
; End of function chkEndLevel???


; =============== S U B	R O U T	I N E =======================================


doLevelBonusScreen:			; CODE XREF: chkEndLevel???:noLastLevelp
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
;
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
;
		call	ClearToBLACK
;
		ld	hl, eMSG_BonuScreen
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		call	waitKEY
;
		ld	bc, 0
		call	_delayLDIR	; BC

waitKeyBonus:				; CODE XREF: doLevelBonusScreen+61 j
		ld	a, (bonusCursor)
		inc	a
		ld	(bonusCursor), a
		and	7
		add	a, 0Dh
		ld	d, a
		ld	e, 16h
		ld	c, 47h ; 'G'
		ld	a, '*'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		ld	a, (bonusCursor)
		dec	a
		and	7
		add	a, 0Dh
		ld	d, a
		ld	e, 16h
		ld	c, 47h ; 'G'
		ld	a, ' '
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		call	chkKEYS
;
		ld	bc, 6000
		call	_delayLDIR	; BC
;
		ld	a, (fl_FIRE)
		or	a
		jp	z, waitKeyBonus
;
		ld	bc, 0
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
		call	_delayLDIR	; BC
;
		ld	a, (bonusCursor)
		and	1
		ret	z
		ld	a, (bonusCursor)
		and	7
		ld	b, a
		ld	de,  a001000+5

loc_A95A:				; CODE XREF: doLevelBonusScreen+82 j
		call	addPoints
		djnz	loc_A95A
		ret
; End of function doLevelBonusScreen

; ---------------------------------------------------------------------------
bonusCursor:	db 0			; DATA XREF: doLevelBonusScreen:waitKeyBonusr
					; doLevelBonusScreen+31w ...
eMSG_BonuScreen:db _E6_DW_FONT		; DATA XREF: doLevelBonusScreen+1Eo
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
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 8, 6
		db _DE_setLoColor_15
		db 'EXOLON BONUS SCREEN!'
		db _DF_DW_xy
		_XY_ 10, 3
		db _DB_setLoColor_12_green
		db 'PRESS FIRE TO STOP POINTER'
		db _DF_DW_xy
		_XY_ 13, 9
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '01000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '03000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '05000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DD_setLoColor_14
		db '00000 POINTS'
		db _A3_deltaX_m12_dbY
		db _DC_setLoColor_13_blue
		db '07000 POINTS'
		db _FF_EndMSG
;
xMsg_FULL_COMBAT_ABILITY:db _E6_DW_FONT	; DATA XREF: chkEndLevel???+63o
		dw FNT_BORDER_BONUS	; 12
		db _DF_DW_xy
		_XY_ 0,0
		db _E3_DWptr_RecursiveCallxMSG
		dw xMSG_BorderHorizontal
		db _DF_DW_xy
		_XY_ 2, 0
		db _E1_DBcnt_xLoopStart
		db 10
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
		db 10
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
		db -12h
		db _DB_setLoColor_12_green
		db 'YOU HAVE PROVEN YOUR'
		db _7A_deltaY__p2_dbX
		db -12h
		db _DA_setLoColor_11_purple
		db 'COMBAT ABILITIES'
		db _7A_deltaY__p2_dbX
		db 0F2h
		db _DE_setLoColor_15
		db 'TO THE FULL'
		db _7B_deltaY__p3_dbX
		db 0F4h
		db _DC_setLoColor_13_blue
		db 'PRESS FIRE TO'
		db _7A_deltaY__p2_dbX
		db 0F4h
		db _DC_setLoColor_13_blue
		db 'RESUME PLAY'
		db _FF_EndMSG
;
tab_StagePlayerStartPos:
		str_StartPos   0,  16,	112 ; 0	; DATA XREF: chkEndLevel???+ABo
		str_StartPos  25,   0,	120 ; 1
		str_StartPos  50,   0,	 32 ;  2
		str_StartPos  75,  40,	128 ; 3
		str_StartPos 100,  16,	112 ; 4
;
xyEndLevel:	dw 0			; DATA XREF: RAM:AnimInitTabo
					; chkEndLevel???r
		db 0FFh
;
xMSG_Bonus?:	db _DF_DW_xy		; DATA XREF: chkEndLevel???+Fo
		_XY_ 3, 7
		db _E0_Attribute?
		db 0
		db _E6_DW_FONT
		dw FONT_GunMachineBottom+88h ; 25 chars
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
; ---------------------------------------------------------------------------
;
		call	NextScrLineAddr
; START	OF FUNCTION CHUNK FOR ShowZone2Screen

ShowBEAM:				; CODE XREF: ShowZone2Screen+8Cj
		ld	de, (xyBeam)	; XY?
		bit	7, e
		ret	nz
;
		inc	d
		ld	hl, FONT_ZONE_00 ; 38 chars
		ld	(FontPTR+1), hl
;
		xor	a
		ld	(byte_AC58), a
		ld	(overPlayerFlag+1), a
;
		inc	a
		ld	(noWalkFlag+1),	a
		ld	bc, 1

		.assert $==0xABB3
loc_ABB3:				; CODE XREF: ShowZone2Screen+2731 j
		ld	a, '%'
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	d
		inc	b
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		push	de
		ld	de, no_walk_tab	; ?AnimationTab?
		add	hl, de
		pop	de
		ld	a, (hl)
		or	a
		jr	z, loc_ABB3
		ld	a, b
		ld	(BeamLength?), a
		ret
; END OF FUNCTION CHUNK	FOR ShowZone2Screen
; ---------------------------------------------------------------------------
xyBeam:		dw 0			; DATA XREF: RAM:AnimInitTabo
					; ShowZone2Screen:ShowBEAMr ...
					; XY?
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


updateBeam:				; CODE XREF: CheckGameRestart7890-23D2p
		ld	de, (xyBeam)	; XY?
		bit	7, e
		ret	nz
;
		call	snd_vertical_laser_beam
		inc	d
		ld	a, (BeamLength?)
		ld	b, a
		call	textXY2TABLEOFFSET? ; in:
					; d - y	(0..23)
					; e - x	(0..31)
					; out:
					; hl=Y*32+X
		ld	de, ATTR_TABLE
		add	hl, de
		ld	de, 32

ChangeBeamColor:			; CODE XREF: updateBeam+22 j
		ld	a, (cntrDB)
		and	7
		or	40h ; '@'
		ld	(hl), a
		add	hl, de
		djnz	ChangeBeamColor
;
		ld	de, (xyBeam)	; XY?
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	a, (Player_X_Pos) ; 0..127
		add	a, 12
		cp	e
		jp	z, KillPlayer?
		ret
; End of function updateBeam


; =============== S U B	R O U T	I N E =======================================


chkBeamDestroy?????:			; CODE XREF: __move__???+9p
		ld	de, (xyBeam)	; XY?
		bit	7, e
		ret	nz
;
		dec	e
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		ld	hl, stru_845F

loc_AC12:				; CODE XREF: chkBeamDestroy?????+17 j
					; chkBeamDestroy?????+1B j
		ld	c, (hl)
		bit	7, c
		ret	nz
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_AC12
		ld	a, e
		cp	c
		jr	nz, loc_AC12
		ld	a, (byte_AC58)
		inc	a
		ld	(byte_AC58), a
		cp	19h

cheat_one_shoot:
		ret	c
		ld	hl, FONT_ZONE_00 ; 38 chars
		ld	(FontPTR+1), hl
		ld	de, (xyBeam)	; XY?
		ld	a, (BeamLength?)
		ld	b, a
		inc	d

loc_AC3A:				; CODE XREF: chkBeamDestroy?????+44 j
		call	RND?
		and	7
		or	42h ; 'B'
		ld	c, a
		ld	a, 25h ; '%'
		call	PutCharXorOVER_CHK_X
		inc	d
		djnz	loc_AC3A
;
		ld	a, 0FFh
		ld	(xyBeam), a	; XY?
		ld	a, 40		; 25*40=1000 points
		call	snd_first_first_gun
		jp	add_A_bonus_and_snd
; End of function chkBeamDestroy?????

; ---------------------------------------------------------------------------
BeamLength?:	db 0			; DATA XREF: ShowZone2Screen+2734w
					; updateBeam+Br ...
byte_AC58:	db 0			; DATA XREF: ShowZone2Screen+2712w
					; chkBeamDestroy?????+1Dr ...

; =============== S U B	R O U T	I N E =======================================


chkLongDelayKiller:			; CODE XREF: CheckGameRestart7890-23CFp
		ld	a, (flLongDelayKiller)
		or	a
		ret	nz
;
		ld	hl, (cntrDW)
		and	a
		ld	de, 700
		sbc	hl, de
		ret	c
;
		ld	de, (Player_X_Pos) ; 0..127
		ld	e, 120		; y=player Y
					; x=120
		ld	(xyLongDelayKiller), de
		ld	a, 1
		ld	(flLongDelayKiller), a
		ret
; End of function chkLongDelayKiller

; ---------------------------------------------------------------------------
flLongDelayKiller:db 0			; DATA XREF: ShowZone2Screen+Dw
					; chkLongDelayKillerr ...
xyLongDelayKiller:dw 0			; DATA XREF: chkLongDelayKiller+15w
					; moveLongDelayKiller?+5 r ...
cntrDW:		dw 0			; DATA XREF: CheckGameRestart7890-2397r
					; CheckGameRestart7890-2393w ...

; =============== S U B	R O U T	I N E =======================================


moveLongDelayKiller?:			; CODE XREF: CheckGameRestart7890-23CCp
		ld	a, (flLongDelayKiller)
		or	a
		ret	z
;
		ld	de, (xyLongDelayKiller)
		ld	b, d
		ld	c, e
		ld	a, e
		or	a
		jr	z, loc_ACC4
		cp	111
		jr	nc, loc_ACA4
		call	RND?
		cp	80h ; '€'
		jr	c, loc_ACA4
		push	de
		ld	a, e
		add	a, 6
		ld	e, a
		ld	a, d
		add	a, 4
		ld	d, a
		call	addToParticleList
		pop	de

loc_ACA4:				; CODE XREF: moveLongDelayKiller?+11j
					; moveLongDelayKiller?+18j
		dec	e
		dec	e
		ld	(xyLongDelayKiller), de	; x-=2
;
		ld	a, sLongDelayKiller ; Fighter
		ld	hl, byte_B6A1
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		ld	c, 47h ; 'G'
		call	sub_7C8F
		ld	bc, 1008h
		call	chkPlayerInZone?
		or	a
		ret	z
		push	de
		call	KillPlayer?
		pop	bc

loc_ACC4:				; CODE XREF: moveLongDelayKiller?+Dj
		ld	hl, byte_B6A1
		xor	a
		ld	(flLongDelayKiller), a
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - ????
					;
		jp	sub_9FA3
; End of function moveLongDelayKiller?


; =============== S U B	R O U T	I N E =======================================


GetKEY:					; CODE XREF: CheckGameRestart7890-2C39p
					; CheckGameRestart7890:loc_6FE8p ...
		push	bc
		push	hl
		ld	hl, KBD_TABLE
		ld	d, 0FEh	; 'þ'

loc_ACD8:				; CODE XREF: GetKEY+18 j
		ld	a, d
		in	a, (0FEh)
		ld	e, 1
		ld	b, 5

loc_ACDF:				; CODE XREF: GetKEY+14 j
		rrca
		jr	nc, loc_ACEB
		inc	hl
		sla	e
		djnz	loc_ACDF
		rlc	d
		jr	c, loc_ACD8

loc_ACEB:				; CODE XREF: GetKEY+Fj
		ld	a, (hl)
		pop	hl
		pop	bc
		ret
; End of function GetKEY

; ---------------------------------------------------------------------------
; 1 - SS
; 2 - CS
KBD_TABLE:	db   1,'Z','X','C','V'  ; DATA XREF: chk_key_3-3028o GetKEY+2o
		db 'A','S','D','F','G'
		db 'Q','W','E','R','T'
		db '1','2','3','4','5'
		db '0','9','8','7','6'
		db 'P','O','I','U','Y'
		db 0Dh,'L','K','J','H'
		db ' ',  2,'M','N','B'
		db   0

; =============== S U B	R O U T	I N E =======================================


waitKEY:				; CODE XREF: CheckGameRestart7890-2A34p
					; RAM:A042p ...
		xor	a
		in	a, (0FEh)
		cpl
		and	11111b
		jr	nz, waitKEY
		ret
; End of function waitKEY


; =============== S U B	R O U T	I N E =======================================

; step by step animation while pressing	3

chk_key_3:				; CODE XREF: CheckGameRestart7890-23BAp

; FUNCTION CHUNK AT 7CEC SIZE 0000002B BYTES

		ld	a, 0F7h	; '÷'
		in	a, (0FEh)	; 54321
		and	1Fh
		cp	11011b		; 3
		ret	nz
;
		ld	bc, 1F4h
		call	_delayLDIR	; BC
		call	waitKEY
		jp	loc_7CEC
; End of function chk_key_3


; =============== S U B	R O U T	I N E =======================================


RND?:					; CODE XREF: starsAnimationStep+21p
					; starsAnimationStep+27p ...
		push	hl
		push	de
		push	bc
		ld	hl, (rndSEED)
		ld	de, 7
		add	hl, de
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		add	hl, de
		ld	(rndSEED), hl
		xor	h
		pop	bc
		pop	de
		pop	hl
		ret
; End of function RND?

; ---------------------------------------------------------------------------
rndSEED:	dw 8EAAh		; DATA XREF: RND?+3r RND?+13w

; =============== S U B	R O U T	I N E =======================================


addPoints:				; CODE XREF: sub_925F+1CEj
					; sub_9B6B+14j	...
		push	af
		push	bc
		push	de
		push	hl
		ld	c, 0
		ld	hl,  points+5
		ld	b, 6

loc_AD5E:				; CODE XREF: addPoints+1E j
		ld	a, (de)
		add	a, (hl)
		sub	'0'
		add	a, c
		cp	3Ah ; ':'
		ld	c, 1
		jr	c, loc_AD6D
		sub	0Ah
		jr	loc_AD6E
; ---------------------------------------------------------------------------

loc_AD6D:				; CODE XREF: addPoints+14j
		dec	c

		.assert $==0xAD6E
loc_AD6E:				; CODE XREF: addPoints+18j
		ld	(hl), a
		dec	hl
		dec	de
		djnz	loc_AD5E
		xor	a
		ld	(overPlayerFlag+1), a
		ld	hl, xMSG_Points
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function addPoints

; ---------------------------------------------------------------------------
xMSG_Points:	db _E0_Attribute?	; DATA XREF: RAM:76D7o	addPoints+24o
		db 45h
		db _E6_DW_FONT
		dw FNT_MAIN	; FONT_ALPHA1 -	0x20*8
		db _DF_DW_xy
		_XY_ 23, 14
points:		db '000000'         ; DATA XREF: CheckGameRestart7890-2C91o
					; updateHighScoreTab+13o ...
		db _FF_EndMSG
;
;
;

a000025:	db '000025'         ; DATA XREF: updateBONUS+Ao
a000050:	db '000050'         ; DATA XREF: sub_9B6B+11o sub_9E4F+Fo
a000100:	db '000100'
a000125:	db '000125'         ; DATA XREF: chkEndLevel???+3Fo
a000150:	db '000150'         ; DATA XREF: sub_925F+1CBo
					; sub_A62D+12o
a000200:	db '000200'
a000250:	db '000250'
a000300:	db '000300'
a000350:	db '000350'
a001000:	db '001000'         ; DATA XREF: chkEndLevel???+23o
					; doLevelBonusScreen+7Co
; ---------------------------------------------------------------------------
		ld	a, d
		sub	b
		sub	9
		cp	0F1h ; 'ñ'
		ld	a, 0
		ret	c
		ld	a, e
		sub	c
		sub	9
		cp	0F1h ; 'ñ'
		ld	a, 0
		ret	c
		inc	a
		ret

; =============== S U B	R O U T	I N E =======================================

; C - color?
; E-X
; D-Y

PurCharAndSetVarsChkX:			; CODE XREF: CheckGameRestart7890-2A38p
					; do_MINES+2Ap	...
		bit	5, e
		ret	nz
;
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl		; *8

FontPTR:				; DATA XREF: CheckGameRestart7890-28B9w
					; showAMMO-2Dw	...
		ld	bc, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		add	hl, bc
; CALC scr addr	- D,E
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
;
		ld	b, 8

char_lp:				; CODE XREF: PurCharAndSetVarsChkX+26 j
		ld	a, (hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	char_lp
;cal ATTR addr
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'       ; 5800 - ATTR_TABLE
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
;
		ld	de, 900h	; 6100 - no_walk_tab
		add	hl, de

noWalkFlag:				; DATA XREF: ShowZone2Screen+66w
					; ShowZone2Screen+2719w ...
		ld	(hl), 1
		ld	de, -600h	; 5B00 - over_player_tab
		add	hl, de

overPlayerFlag:				; DATA XREF: ShowZone2Screen+6Aw
					; ShowZone2Screen+2715w ...
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		ret
; End of function PurCharAndSetVarsChkX


; =============== S U B	R O U T	I N E =======================================

; A - chr
; C - COLOR
; E-X
; D-Y

putChar:				; CODE XREF: nextHiScoreToScr+10p
					; sub_8E37+12p	...
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

		.assert $==0xAE46
loc_AE46:				; CODE XREF: putChar+24 j
		ld	a, (hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AE46
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
		pop	hl
		pop	de
		pop	af
		ret
; End of function putChar


; =============== S U B	R O U T	I N E =======================================


putCharXOR:				; CODE XREF: do_GunMachine????+2Bp
					; do_GunMachine????+30p ...
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AE7D:				; CODE XREF: putCharXOR+25 j
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AE7D
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		or	58h ; 'X'
		ld	h, a
		ld	l, e
		pop	bc
		ld	(hl), c
		pop	hl
		pop	de
		pop	af
		ret
; End of function putCharXOR


; =============== S U B	R O U T	I N E =======================================


PutCharXorOVER_CHK_X:			; CODE XREF: chkBeamDestroy?????+40p
					; DATA XREF: RAM:9A15o
		bit	5, e
		ret	nz
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AEB8:				; CODE XREF: PutCharXorOVER_CHK_X+28 j
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AEB8
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	l, e
		ld	de, over_player_tab
		add	hl, de
		pop	bc
		ld	(hl), 0FFh
		ld	de, 300h	; 5b00
		add	hl, de
		ld	(hl), 0
		ld	de, 300h	; 6100
		add	hl, de
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		call	add_boom_particle? ; e-x (/4)
					; d-y (/8)
		jp	add_boom_particle? ; e-x (/4)
; End of function PutCharXorOVER_CHK_X	; d-y (/8)

; ---------------------------------------------------------------------------

PutCharXorNoWalk:			; DATA XREF: RAM:9A17o
		push	af
		push	de
		push	hl
		push	bc
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, (FontPTR+1)
		add	hl, bc
		ld	a, d
		and	0F8h ; 'ø'
		or	40h ; '@'
		ld	b, a
		ld	a, d
		ld	d, b
		and	7
		rrca
		rrca
		rrca
		add	a, e
		ld	e, a
		ld	b, 8

loc_AF04:				; CODE XREF: RAM:AF09 j
		ld	a, (de)
		xor	(hl)
		ld	(de), a
		inc	d
		inc	hl
		djnz	loc_AF04
		dec	d
		ld	a, d
		rrca
		rrca
		rrca
		and	3
		ld	h, a
		ld	l, e
		ld	de, over_player_tab
		add	hl, de
		pop	bc
		ld	(hl), 0FFh
		ld	de, 300h	; 5b00
		add	hl, de
		ld	(hl), 0
		ld	de, 300h	; 6100
		add	hl, de
		ld	(hl), 0
		pop	hl
		pop	de
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================

; C - color?
; HL - PRE
; E-X
; D-Y

xMSG:					; CODE XREF: CheckGameRestart7890-2C67p
					; CheckGameRestart7890-2C13p ...
		ld	a, (hl)
		inc	hl
		cp	61h ; 'a'
		jp	nc, ctrlChar

putCharxMSGAddr:			; DATA XREF: selectPutCHR+8w
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	e
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

ctrlChar:				; CODE XREF: xMSG+4j
		cp	90h ; ''
		jp	nc, loc_AF49
		sub	_78_deltaY__p0_dbX
		add	a, d
		ld	d, a
		ld	a, (hl)
		add	a, e
		ld	e, a		; X
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF49:				; CODE XREF: xMSG+10j
		cp	0CFh ; 'Ï'
		jp	nc, loc_AF56
		inc	d
		sub	-51h
		add	a, e
		ld	e, a		; X
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF56:				; CODE XREF: xMSG+20j
		cp	0DFh ; 'ß'
		jp	nc, loc_AF6F
		sub	_CF_setLoColor_00
		cp	8
		jp	c, loc_AF66
		sub	8
		or	40h ; '@'

		.assert $==0xAF66
loc_AF66:				; CODE XREF: xMSG+34j
		ld	b, a
		ld	a, c
		and	38h ; '8'
		or	b
		ld	c, a		; color
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF6F:				; CODE XREF: xMSG+2Dj
		cp	_DF_DW_xy
		jp	nz, loc_AF7B
		ld	d, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF7B:				; CODE XREF: xMSG+46j
		cp	_E0_Attribute?
		jp	nz, loc_AF85
		ld	c, (hl)
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF85:				; CODE XREF: xMSG+52j
		cp	_E1_DBcnt_xLoopStart
		jp	nz, loc_AF91
		ld	b, (hl)
		inc	hl

loc_AF8C:				; CODE XREF: xMSG+73 j
		push	hl
		push	bc
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF91:				; CODE XREF: xMSG+5Cj
		cp	_E2_xMSG_NEXT_e1
		jp	nz, loc_AFA1
		pop	bc
		djnz	loc_AF9D
		pop	af
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AF9D:				; CODE XREF: xMSG+6Cj
		pop	hl
		jp	loc_AF8C
; ---------------------------------------------------------------------------

loc_AFA1:				; CODE XREF: xMSG+68j
		cp	_E3_DWptr_RecursiveCallxMSG
		jp	nz, loc_AFB7
		ld	a, (hl)
		inc	hl
		push	hl
		ld	h, (hl)
		ld	l, a
		push	bc
		push	de
		call	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
		pop	de
		pop	bc
		pop	hl
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AFB7:				; CODE XREF: xMSG+78j
		cp	_E4_DBcnt_DBCHR_FillCharX
		jp	nz, loc_AFC9
		ld	b, (hl)
		inc	hl
		ld	a, (hl)

putChar_xMSG_E4:			; CODE XREF: xMSG+98 j
					; DATA XREF: selectPutCHR+Bw
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	e
		djnz	putChar_xMSG_E4
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AFC9:				; CODE XREF: xMSG+8Ej
		cp	_E5_DBcnt_DBCHR_FillCharY
		jp	nz, loc_AFDB
		ld	b, (hl)
		inc	hl
		ld	a, (hl)

putChar_xMSG_E5:			; CODE XREF: xMSG+AA j
					; DATA XREF: selectPutCHR+Ew
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	d
		djnz	putChar_xMSG_E5
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AFDB:				; CODE XREF: xMSG+A0j
		cp	_E6_DW_FONT
		jr	nz, loc_AFEC
		ld	a, (hl)
		ld	(FontPTR+1), a
		inc	hl
		ld	a, (hl)
		ld	(FontPTR+2), a
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_AFEC:				; CODE XREF: xMSG+B2j
		cp	_E7_SPACE
		jr	nz, loc_B009
		push	hl
		ld	hl, (FontPTR+1)
		push	hl
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
		ld	a, 20h ; ' '

putChar_xMSG_E7:			; DATA XREF: selectPutCHR+11w
					; xMSG+108 r
		call	PurCharAndSetVarsChkX ;	C - color?
					; E-X
					; D-Y
		inc	e
		pop	hl
		ld	(FontPTR+1), hl
		pop	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_B009:				; CODE XREF: xMSG+C3j
		cp	_E8_LD_DB_setNoWalk
		jr	nz, loc_B015
		ld	a, (hl)
		ld	(noWalkFlag+1),	a
		inc	hl
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_B015:				; CODE XREF: xMSG+E0j
		cp	_E9_setNoOverPlayer
		jr	nz, loc_B020
		xor	a
		ld	(overPlayerFlag+1), a
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_B020:				; CODE XREF: xMSG+ECj
		cp	_EA_setOverPlayer
		jr	nz, loc_B02C
		ld	a, 0FFh
		ld	(overPlayerFlag+1), a
		jp	xMSG		; C - color?
					; HL - PRE
					; E-X
					; D-Y
; ---------------------------------------------------------------------------

loc_B02C:				; CODE XREF: xMSG+F7j
		cp	_EB_AnimatedObject
		ret	nz
;
		ld	a, (hl)
		push	bc
		push	de
		push	hl
		ld	hl, (putChar_xMSG_E7+1)
		ld	bc, PurCharAndSetVarsChkX ; C -	color?
					; E-X
					; D-Y
		sbc	hl, bc
		jr	nz, loc_B044
;
		call	block2xy	; _Dx4_Ex8
					; d*4
					; e*8
					;
		call	getNowalkAddrForXY ; d-y (0..191) ,e-x (0..127)
					; ret
					; hl-NoWalkaddr
		ld	(hl), a

loc_B044:				; CODE XREF: xMSG+110j
		pop	hl
		pop	de
		pop	bc
		inc	hl
		jp	xMSG		; C - color?
; End of function xMSG			; HL - PRE
					; E-X
					; D-Y

; =============== S U B	R O U T	I N E =======================================


ClearToBLACK:				; CODE XREF: CheckGameRestart7890:xmenup
					; CheckGameRestart7890-2A6Bp ...
		ld	c, 0
; End of function ClearToBLACK


; =============== S U B	R O U T	I N E =======================================

; C - Attr value

ClearScreen_fromback:			; CODE XREF: CheckGameRestart7890-28CEp
		ld	hl,  ATTR_TABLE+2FFh
		ld	de,  ATTR_TABLE+2FEh
		ld	(hl), c
		ld	bc, 767
		lddr
		ld	(hl), 0
		ld	bc, 6143
		lddr
		ret
; End of function ClearScreen_fromback


; =============== S U B	R O U T	I N E =======================================


ClearPlayArea:				; CODE XREF: ShowZone2Screen+40p
		ld	c, 0
		ld	hl, ATTR_TABLE
		ld	(hl), c
		ld	de,  ATTR_TABLE+1
		ld	bc, 703
		ldir
		ld	hl, SCRLINE000
		ld	b, 176

loc_B074:				; CODE XREF: ClearPlayArea+24 j
		push	bc
		push	hl
		ld	e, l
		ld	d, h
		inc	de
		ld	(hl), 0
		ld	bc, 1Fh
		ldir
		pop	hl
		call	NextScrLineAddr
		pop	bc
		djnz	loc_B074
		ret
; End of function ClearPlayArea


; =============== S U B	R O U T	I N E =======================================

; IN: D	- Y (0..191),E - X (0..127)
; OUT: HL - scr	addr

XY2SCR_ADDR:				; CODE XREF: RAM:7771p	RAM:77FFp ...
		push	af
		ld	l, d
		ld	h, 65h ; 'e'    ; 6500 - Y2SCR_HI
		ld	a, (hl)
		inc	h		; 6600 - Y2SCR_LO
		ld	l, (hl)
		ld	h, a		; HL - Y-ScrAddr
;
		ld	a, e
		and	1111100b
		rrca
		rrca
		add	a, l
		ld	l, a		; hl+=(x&0xfc)>>2
;
		pop	af
		ret
; End of function XY2SCR_ADDR


; =============== S U B	R O U T	I N E =======================================


NextScrLineAddr:			; CODE XREF: InitScrAddtTables+17p
					; InitScrAddtTables+2Fp ...
		inc	h
		ld	a, h
		and	7
		ret	nz
		ld	a, l
		add	a, 20h ; ' '
		ld	l, a
		ret	c
		ld	a, h
		sub	8
		ld	h, a
		ret
; End of function NextScrLineAddr

; ---------------------------------------------------------------------------
		ld	a, h
		dec	h
		and	7
		ret	nz
		ld	a, l
		sub	20h ; ' '
		ld	l, a
		ret	c
		ld	a, h
		add	a, 8
		ld	h, a
		ret

; =============== S U B	R O U T	I N E =======================================

; BC

_delayLDIR:				; CODE XREF: CheckGameRestart7890-29E6p
					; CheckGameRestart7890-29E3p ...
		push	bc
		push	de
		push	hl
		ld	hl, 0
		ld	de, 0
		ldir
		pop	hl
		pop	de
		pop	bc
		ret
; End of function _delayLDIR

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR showZONE

show_A:					; CODE XREF: showZONE+8j
		push	bc
		push	hl
		ld	hl, FNT_MAIN ; FONT_ALPHA1 - 0x20*8
		ld	(FontPTR+1), hl
		ld	b, 100
		call	putDec31
		ld	b, 10
		call	putDec31
		ld	b, 1
		call	putDec31
		pop	hl
		pop	bc
		ret
; END OF FUNCTION CHUNK	FOR showZONE

; =============== S U B	R O U T	I N E =======================================


putDec31:				; CODE XREF: showZONE+2255p
					; showZONE+225Ap ...
		ld	l, 0

loc_B0E2:				; CODE XREF: putDec31+6 j
		sub	b
		jr	c, loc_B0E8
		inc	l
		jr	loc_B0E2
; ---------------------------------------------------------------------------

loc_B0E8:				; CODE XREF: putDec31+3j
		add	a, b
		push	af
		ld	a, l
		add	a, 30h ; '0'
		call	putChar		; A - chr
					; C - COLOR
					; E-X
					; D-Y
		pop	af
		inc	e
		ret
; End of function putDec31


; =============== S U B	R O U T	I N E =======================================


clr_Sprite_BUFFER???:			; CODE XREF: CheckGameRestart7890-2C45p
					; CheckGameRestart7890-2A50p ...
		ld	hl, Sprite_BUFFER???
		ld	de,  Sprite_BUFFER???+1
		ld	bc, 1359
		ld	(hl), 0
		ldir
		ret
; End of function clr_Sprite_BUFFER???

; ---------------------------------------------------------------------------
byte_B101:	ds  80h 	; 0 ; DATA XREF: RAM:7867o RAM:7A80o ...
Sprite_BUFFER???:
		db    0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   1,	0,   0,	  1,   0,   0,	 3, 80h,   0, 0Fh,0E0h,	  0,   3, 80h,	 0,   1,   0,	0,   1,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0; 0
					; DATA XREF: starsAnimationStep+6o
					; show32xsprite+24o ...
		db    0,   0,	0,   0,	  0,   0,   1,	 0,   0,   1,	0,   0,	  1,   0,   0,	 5, 40h,   0,	3, 80h,	  0, 3Fh,0F8h,	 0,   3, 80h,	0,   5,	40h,   0,   1,	 0,   0,   1,	0,   0,	  1,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 48
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 96
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 144
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  1,   0,   0,	 1,   0,   0,	3, 80h,	  0, 0Fh,0E0h,	 0,   3, 80h,	0,   1,	  0,   0,   1,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 192
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	1,   0,	  0,   3, 80h,	 0,   1,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 240
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 288
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 336
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  1,   0,   0,	 1,   0,   0,	3, 80h,	  0, 0Fh,0E0h,	 0,   3, 80h,	0,   1,	  0,   0,   1,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 384
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  1,   0,   0,	 1,   0,   0,	3, 80h,	  0, 0Fh,0E0h,	 0,   3, 80h,	0,   1,	  0,   0,   1,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 432
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  1,   0,   0,	 1,   0,   0,	3, 80h,	  0, 0Fh,0E0h,	 0,   3, 80h,	0,   1,	  0,   0,   1,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 480
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	1,   0,	  0,   3, 80h,	 0,   1,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 528
		ds    40h	; 0
byte_B401:	db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 0
					; DATA XREF: processAfterCircleo
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 48
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 96
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 144
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 192
byte_B4F1:	db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 0
					; DATA XREF: sub_A26B+4Do sub_A26B+5Fo
byte_B521:	db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 0
					; DATA XREF: doEnemyMoveo moveEnemy?o	...
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 48
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 96
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 144
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 192
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 240

		.assert $==0xB641
byte_B641:	ds   60h 	; 0 ; DATA XREF: chkHighVoltage+Co
byte_B6A1:	ds   30h 	; 0 ; DATA XREF: moveLongDelayKiller?+2Fo
					; moveLongDelayKiller?:loc_ACC4o

	include 	"psg.asm"
;

	include 	"zone_data.asm"
;

	include 	"fonts.asm"
;
	include 	"sprites.asm"

;

_stack 		EQU 	$
		dw 	start
		ds 	0xffff-$
		db 	0


		end 	start
