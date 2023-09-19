; =============== S U B	R O U T	I N E =======================================


sub_B6D1:				; CODE XREF: Init_AY_Music?+2Ep
					; DATA XREF: updateHighScoreTabo
		ld	a, (byte_B6E0)
		ld	(_CH_1_xxx+8), a
		inc	a
		ld	(_CH_0_xxx+8), a
		ld	(_CH_2_xxx+8), a
		ret
; End of function sub_B6D1

; ---------------------------------------------------------------------------
		db    0
byte_B6E0:	db 0Ch			; DATA XREF: sub_B6D1r	init_xx0Dr
byte_B6E1:	db 0			; DATA XREF: do128musicstep+1w
					; RAM:loc_B88Fr ...
		db    0
		db    3
play_ay_music_flag?:db 0		; DATA XREF: Init_AY_Music?+Bw
					; Init_AY_Music?+40w ...
					; Z - play,. NZ- ignore
AY_VIOCEENA:	db 0AAh			; DATA XREF: psg_mute+2w RAM:B913o
_CH_0_ptr?:	dw 0BB6Bh		; DATA XREF: Init_AY_Music?+Ew
					; do128musicstep+Er ...
_CH_1_ptr?:	dw 0BCFDh		; DATA XREF: Init_AY_Music?+12w
					; do128musicstep+1Dr ...
_CH_2_ptr?:	dw 0BDDEh		; DATA XREF: Init_AY_Music?+16w
					; do128musicstep+2Cr ...

; =============== S U B	R O U T	I N E =======================================


Init_AY_Music?:				; CODE XREF: CheckGameRestart7890-2C61p
		ld	bc, M01
		ld	de, M02
		ld	hl, M03
		ld	a, 0FFh
		ld	(play_ay_music_flag?), a ; Z - play,. NZ- ignore
		ld	(_CH_0_ptr?), bc
		ld	(_CH_1_ptr?), de
		ld	(_CH_2_ptr?), hl
;
		ld	ix, _CH_0_xxx
		call	init_xx0D
;
		ld	ix, _CH_1_xxx
		call	init_xx0D
;
		ld	ix, _CH_2_xxx
		call	init_xx0D
;
		call	sub_B6D1
;
		call	psg_mute
;
		ld	a, 1
		ld	(_CH_0_xxx+2), a
		ld	(_CH_1_xxx+2), a
		ld	(_CH_2_xxx+2), a
		xor	a
		ld	(play_ay_music_flag?), a ; Z - play,. NZ- ignore
		ret
; End of function Init_AY_Music?


; =============== S U B	R O U T	I N E =======================================


init_xx0D:				; CODE XREF: Init_AY_Music?+1Dp
					; Init_AY_Music?+24p ...
		ld	a, (byte_B6E0)
		ld	(ix+3),	a
		xor	a
		ld	(ix+9),	a
		ld	(ix+0Ch), a
		ld	(ix+0Dh), a
		ld	(ix+0),	a
		ld	(ix+1),	a
		ld	(ix+2),	1
		ld	(ix+4),	5
		ld	(ix+5),	5
		ret
; End of function init_xx0D


; =============== S U B	R O U T	I N E =======================================


psg_mute:				; CODE XREF: CheckGameRestart7890:DefineKeysp
					; CheckGameRestart7890-248Ep ...
		ld	a, 0B8h	; '¸'
		ld	(AY_VIOCEENA), a
		ld	c, a
		ld	a, AY_VIOCE_ENABLE
		ld	e, 4

loc_B75D:				; CODE XREF: psg_mute+11j
		call	write2psg	; a-reg
					; c-value
		ld	c, 0
		inc	a
		dec	e
		jr	nz, loc_B75D
		ret
; End of function psg_mute


; =============== S U B	R O U T	I N E =======================================


do128musicstep:				; CODE XREF: putSpriteAndPlay128Music?+21p
		xor	a
		ld	(byte_B6E1), a
;
		ld	a, (play_ay_music_flag?) ; Z - play,. NZ- ignore
		or	a
		jr	nz, locret_B79E
;
		ld	ix, _CH_0_xxx
		ld	iy, (_CH_0_ptr?)
		call	m128_process_channel?
		ld	(_CH_0_ptr?), iy
;
		ld	ix, _CH_1_xxx
		ld	iy, (_CH_1_ptr?)
		call	m128_process_channel?
		ld	(_CH_1_ptr?), iy
;
		ld	ix, _CH_2_xxx
		ld	iy, (_CH_2_ptr?)
		call	m128_process_channel?
		ld	(_CH_2_ptr?), iy

locret_B79E:				; CODE XREF: do128musicstep+8j
					; RAM:B9FEj
		ret
; End of function do128musicstep

; ---------------------------------------------------------------------------

m128_process_channel?:			; CODE XREF: do128musicstep+12p
					; do128musicstep+21p ...
		ld	a, (ix+0Dh)
		or	a
		jr	z, loc_B7AE
		ld	(ix+0Dh), 0
		call	loc_B88F
		jr	loc_B7B4
; ---------------------------------------------------------------------------

loc_B7AE:				; CODE XREF: RAM:B7A3j
		dec	(ix+2)
		jp	z, loc_B88F

loc_B7B4:				; CODE XREF: RAM:B7ACj
		dec	(ix+1Bh)
		jp	nz, loc_B822
		ld	a, (ix+19h)
		add	a, (ix+1Dh)
		ld	(ix+19h), a
		dec	(ix+1Ch)
		jr	nz, loc_B7F8
		ld	a, (ix+1Ah)
		add	a, 3
		ld	(ix+1Ah), a
		cp	(ix+1Fh)
		jr	nz, loc_B7D9
		xor	a
		ld	(ix+1Ah), a

loc_B7D9:				; CODE XREF: RAM:B7D3j
		add	a, 20h ; ' '
		ld	(loc_B7E6+2), a
		inc	a
		ld	(loc_B7EC+2), a
		inc	a
		ld	(loc_B7F2+2), a

loc_B7E6:				; DATA XREF: RAM:B7DBw
		ld	a, (ix+26h)
		ld	(ix+1Ch), a

loc_B7EC:				; DATA XREF: RAM:B7DFw
		ld	a, (ix+27h)
		ld	(ix+1Dh), a

loc_B7F2:				; DATA XREF: RAM:B7E3w
		ld	a, (ix+28h)
		ld	(ix+1Eh), a

loc_B7F8:				; CODE XREF: RAM:B7C6j
		ld	a, (ix+1Eh)
		ld	(ix+1Bh), a
		ld	l, (ix+ayp_01_freqhi)
		ld	h, (ix+ayp_02_freqlo)
		ld	a, l
		or	h
		jr	z, loc_B815
		ld	d, 0FFh
		ld	a, (ix+19h)
		or	a
		jp	m, loc_B813
		ld	d, 0

loc_B813:				; CODE XREF: RAM:B80Ej
		ld	e, a
		add	hl, de

loc_B815:				; CODE XREF: RAM:B806j
		ld	a, (ix+ayp_06_ch)
		inc	a
		ld	c, h
		call	write2psg	; a-reg
					; c-value
		dec	a
		ld	c, l
		call	write2psg	; a-reg
					; c-value

loc_B822:				; CODE XREF: RAM:B7B7j
		dec	(ix+36h)
		jr	nz, locret_B88E
		ld	a, (ix+3)
		add	a, (ix+38h)
		jp	p, loc_B831
		xor	a

loc_B831:				; CODE XREF: RAM:B82Dj
		ld	(ix+3),	a
		ld	a, (ix+8)
		cp	(ix+3)
		jr	nc, loc_B83F
		ld	(ix+3),	a

loc_B83F:				; CODE XREF: RAM:B83Aj
		dec	(ix+37h)
		jr	nz, loc_B87E
		ld	a, (ix+35h)
		add	a, 3
		ld	(ix+35h), a
		cp	(ix+3Ah)
		jr	nz, loc_B85F
		ld	(ix+38h), 0
		ld	(ix+37h), 0FFh
		ld	(ix+39h), 0FFh
		jr	loc_B87E
; ---------------------------------------------------------------------------

loc_B85F:				; CODE XREF: RAM:B84Fj
		add	a, 3Bh ; ';'
		ld	(loc_B86C+2), a
		inc	a
		ld	(loc_B872+2), a
		inc	a
		ld	(loc_B878+2), a

loc_B86C:				; DATA XREF: RAM:B861w
		ld	a, (ix+3Eh)
		ld	(ix+37h), a

loc_B872:				; DATA XREF: RAM:B865w
		ld	a, (ix+3Fh)
		ld	(ix+38h), a

loc_B878:				; DATA XREF: RAM:B869w
		ld	a, (ix+40h)
		ld	(ix+39h), a

loc_B87E:				; CODE XREF: RAM:B842j	RAM:B85Dj
		ld	a, (ix+39h)
		ld	(ix+36h), a
		ld	a, (ix+3)
		ld	c, a
		ld	a, (ix+7)
		jp	write2psg	; a-reg
					; c-value
; ---------------------------------------------------------------------------

locret_B88E:				; CODE XREF: RAM:B825j
		ret
; ---------------------------------------------------------------------------

loc_B88F:				; CODE XREF: RAM:B7A9p	RAM:B7B1j
		ld	a, (byte_B6E1)
		or	a
		jr	z, loc_B899
		ld	(ix+0Dh), a
		ret
; ---------------------------------------------------------------------------

loc_B899:				; CODE XREF: RAM:B893j
		dec	a
		ld	(byte_B6E1), a

loc_B89D:				; CODE XREF: RAM:B923j	RAM:B936j ...
		ld	a, (iy+0)
		cp	32h ; '2'
		jr	nc, loc_B8FC

loc_B8A4:				; CODE XREF: RAM:B90Dj
		or	a
		jr	z, loc_B8AA
		add	a, (ix+9)

loc_B8AA:				; CODE XREF: RAM:B8A5j
		ld	l, a
		sla	l
		ld	h, 0
		push	de
		ld	de, byte_C71B
		add	hl, de
		pop	de
		ld	a, (hl)
		ld	(ix+0),	a
		inc	hl
		ld	a, (hl)
		ld	(ix+1),	a
		ld	a, (ix+0Ah)
		ld	(ix+2),	a
		ld	(ix+3),	0
		inc	iy
		ld	(ix+5),	1
		ld	(ix+19h), 0
		ld	(ix+1Bh), 1
		ld	(ix+1Ch), 1
		ld	(ix+1Ah), 0FDh ; 'ý'
		ld	(ix+1Dh), 0
		ld	a, (ix+3Bh)
		ld	(ix+37h), a
		ld	a, (ix+3Ch)
		ld	(ix+38h), a
		ld	a, (ix+3Dh)
		ld	(ix+39h), a
		ld	(ix+36h), a
		ld	(ix+35h), 0
		ret
; ---------------------------------------------------------------------------

loc_B8FC:				; CODE XREF: RAM:B8A2j
		cp	64h ; 'd'
		jr	nc, loc_B90F
		ld	a, (iy+1)
		ld	(ix+0Ah), a
		ld	a, (iy+0)
		inc	iy
		sub	32h ; '2'
		jr	loc_B8A4
; ---------------------------------------------------------------------------

loc_B90F:				; CODE XREF: RAM:B8FEj
		cp	'd'
		jr	nz, loc_B926
		ld	hl, AY_VIOCEENA
		ld	a, (hl)
		xor	(ix+0Bh)
		ld	(hl), a
		ld	c, a
		ld	a, AY_VIOCE_ENABLE
		call	write2psg	; a-reg
					; c-value

loc_B921:				; CODE XREF: RAM:B942j
		inc	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B926:				; CODE XREF: RAM:B911j
		cp	'y'
		jr	nz, loc_B939
		inc	iy
		ld	c, (iy+0)
		ld	a, AY_NOISE_PERIOD
		call	write2psg	; a-reg
					; c-value
		inc	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B939:				; CODE XREF: RAM:B928j
		cp	'u'
		jr	nc, loc_B944
		sub	65h ; 'e'
		ld	(ix+8),	a
		jr	loc_B921
; ---------------------------------------------------------------------------

loc_B944:				; CODE XREF: RAM:B93Bj
		cp	'u'
		jr	nz, loc_B974
		ld	l, (iy+1)
		ld	h, (iy+2)
		inc	iy
		inc	iy
		inc	iy
		push	iy
		pop	bc
		ld	a, (ix+0Ch)
		sla	a
		add	a, 0Eh
		ld	(loc_B965+2), a
		inc	a
		ld	(loc_B968+2), a

loc_B965:				; DATA XREF: RAM:B95Ew
		ld	(ix+0Eh), c

loc_B968:				; DATA XREF: RAM:B962w
		ld	(ix+0Fh), b
		inc	(ix+0Ch)
		push	hl
		pop	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B974:				; CODE XREF: RAM:B946j
		cp	76h ; 'v'
		jr	nz, loc_B995
		dec	(ix+0Ch)
		ld	a, (ix+0Ch)
		sla	a
		add	a, 0Eh
		ld	(loc_B989+2), a
		inc	a
		ld	(loc_B98C+2), a

loc_B989:				; DATA XREF: RAM:B982w
		ld	c, (ix+0Eh)

loc_B98C:				; DATA XREF: RAM:B986w
		ld	b, (ix+0Fh)
		push	bc
		pop	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B995:				; CODE XREF: RAM:B976j
		cp	77h ; 'w'
		jr	nz, loc_B9A6
		inc	iy
		ld	a, (iy+0)
		ld	(ix+9),	a
		inc	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B9A6:				; CODE XREF: RAM:B997j
		cp	78h ; 'x'
		jr	nz, loc_B9B6
		ld	l, (iy+1)
		ld	h, (iy+2)
		push	hl
		pop	iy
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B9B6:				; CODE XREF: RAM:B9A8j
		cp	0FFh
		jr	z, loc_B9F7
		cp	89h ; '‰'
		jr	nz, loc_B9D8
		inc	iy
		ld	a, (iy+0)
		ld	b, a
		inc	b
		push	ix

loc_B9C7:				; CODE XREF: RAM:B9D1j
		ld	a, (iy+0)
		ld	(ix+1Fh), a
		inc	iy
		inc	ix
		djnz	loc_B9C7
		pop	ix
		jp	loc_B89D
; ---------------------------------------------------------------------------

loc_B9D8:				; CODE XREF: RAM:B9BCj
		cp	8Ah ; 'Š'
		jr	nz, locret_B9F6
		inc	iy
		ld	a, (iy+0)
		ld	b, a
		inc	b
		push	ix

loc_B9E5:				; CODE XREF: RAM:B9EFj
		ld	a, (iy+0)
		ld	(ix+3Ah), a
		inc	iy
		inc	ix
		djnz	loc_B9E5
		pop	ix
		jp	loc_B89D
; ---------------------------------------------------------------------------

locret_B9F6:				; CODE XREF: RAM:B9DAj
		ret
; ---------------------------------------------------------------------------

loc_B9F7:				; CODE XREF: RAM:B9B8j
		ld	(play_ay_music_flag?), a ; Z - play,. NZ- ignore
		call	psg_mute
		pop	af
		jp	locret_B79E
; ---------------------------------------------------------------------------
M01:		db  75h,0F3h,0BDh, 75h,	54h,0BBh, 75h, 41h; 0 ;	DATA XREF: Init_AY_Music?o
		db 0BBh, 75h, 41h,0BBh,	75h, 32h,0BBh, 75h; 8
		db  32h,0BBh, 75h,   4,0BBh, 75h, 32h,0BBh; 16
		db  75h, 32h,0BBh, 75h,	  4,0BBh, 75h,0D6h; 24
		db 0BAh, 75h, 32h,0BBh,	75h, 32h,0BBh, 75h; 32
		db  32h,0BBh, 75h, 32h,0BBh, 75h,0C9h,0BAh; 40
		db  75h,0C9h,0BAh, 75h,0AEh,0BAh, 75h, 32h; 48
		db 0BBh, 75h, 32h,0BBh,	75h, 32h,0BBh, 75h; 56
		db  32h,0BBh, 75h,0A1h,0BAh, 75h,0A1h,0BAh; 64
		db  75h, 92h,0BAh, 75h,	92h,0BAh, 75h, 75h; 72
		db 0BAh, 75h, 58h,0BAh,	4Eh,0A0h,0FFh, 55h; 80
		db  14h, 24h, 53h, 0Ah,	55h, 14h, 21h, 23h; 88
		db  1Fh, 51h, 0Ah, 53h,	14h, 51h, 14h, 21h; 96
		db  50h, 0Ah, 51h, 14h,	1Eh, 1Fh, 1Ch, 4Eh; 104
		db  0Ah, 50h, 14h, 76h,	50h, 14h, 1Fh, 4Eh; 112
		db  0Ah, 50h, 14h, 1Eh,	1Fh, 1Ch, 4Eh, 0Ah; 120
		db  50h, 14h, 50h, 14h,	1Fh, 4Eh, 0Ah, 50h; 128
		db  14h, 1Bh, 1Ch, 1Eh,	51h, 0Ah, 53h, 14h; 136
		db  76h, 4Eh, 14h, 1Dh,	4Ch, 0Ah, 4Eh, 14h; 144
		db  1Ch, 1Dh, 1Ah, 4Ch,	0Ah, 4Eh, 14h, 76h; 152
		db  4Ch, 14h, 1Ch, 4Ah,	0Ah, 4Ch, 14h, 17h; 160
		db  18h, 15h, 49h, 1Eh,	76h, 50h, 14h, 1Fh; 168
		db  4Eh, 0Ah, 50h, 14h,	1Bh, 1Ch, 19h, 4Dh; 176
		db  1Eh, 50h, 14h, 1Fh,	4Eh, 0Ah, 50h, 14h; 184
		db  1Bh, 1Ch, 1Eh, 51h,	0Ah, 53h, 14h, 76h; 192
		db  51h, 14h, 21h, 50h,	0Ah, 51h, 14h, 1Ch; 200
		db  1Eh, 1Ah, 4Eh, 1Eh,	76h, 75h, 71h,0BEh; 208
		db  4Ah, 28h, 15h, 4Ah,	1Eh, 18h, 4Eh, 0Ah; 216
		db  1Ah, 4Ah, 28h, 13h,	4Ah, 1Eh, 18h, 4Eh; 224
		db  0Ah, 1Ah, 4Ah, 28h,	18h, 4Ah, 1Eh, 18h; 232
		db  4Eh, 0Ah, 1Ah, 4Ah,	28h, 18h, 4Ah, 0Ah; 240
		db  1Ch, 18h, 1Ch, 1Fh,	1Ch, 1Fh, 23h, 75h; 248
		db    5,0BEh, 76h, 75h,0EAh,0BDh, 53h, 14h; 256
		db  53h, 0Ah, 75h,   5,0BEh, 51h, 32h, 51h; 264
		db  14h, 4Ah, 0Ah, 53h,	14h, 4Ah, 0Ah, 51h; 272
		db  14h, 75h,0EAh,0BDh,	4Eh, 14h, 4Eh, 0Ah; 280
		db  75h,   5,0BEh, 4Ch,	32h, 4Ch, 14h, 45h; 288
		db  0Ah, 4Eh, 14h, 45h,	0Ah, 4Ch, 0Ah, 13h; 296
		db  76h, 55h, 14h, 24h,	53h, 0Ah, 55h, 14h; 304
		db  1Fh, 21h, 1Eh, 55h,	0Ah, 4Eh, 14h, 76h; 312
		db  51h, 28h, 51h, 1Eh,	23h, 55h, 14h, 21h; 320
		db  1Fh, 51h, 28h, 51h,	1Eh, 23h, 55h, 14h; 328
		db  21h, 1Fh, 76h, 75h,	5Fh,0BBh, 51h, 14h; 336
		db  75h, 5Fh,0BBh, 53h,	14h, 76h, 51h, 0Ah; 344
		db  1Ah, 1Fh, 23h, 58h,	14h, 1Ah, 1Ch, 56h; 352
		db  0Ah, 23h, 24h, 23h,	53h, 1Eh, 50h, 0Ah; 360
		db  1Fh, 53h, 14h, 50h,	0Ah, 4Ch, 14h, 24h; 368
		db  56h, 0Ah, 55h, 1Eh,	76h; 376
M02:		db  75h,0E1h,0BDh, 64h,	75h,0E7h,0BCh, 75h; 0 ;	DATA XREF: Init_AY_Music?+3o
		db 0E7h,0BCh, 75h,0E7h,0BCh, 75h,0E7h,0BCh; 8
		db  64h, 75h,0F3h,0BDh,	75h,0C6h,0BCh, 75h; 16
		db 0C6h,0BCh, 75h,0B7h,0BCh, 75h,0B7h,0BCh; 24
		db  75h, 89h,0BCh, 75h,0B7h,0BCh, 75h,0B7h; 32
		db 0BCh, 75h, 89h,0BCh,	75h, 61h,0BCh, 75h; 40
		db 0B7h,0BCh, 75h,0B7h,0BCh, 75h,0B7h,0BCh; 48
		db  75h,0B7h,0BCh, 75h,	54h,0BCh, 75h, 54h; 56
		db 0BCh, 75h, 39h,0BCh,	75h,0B7h,0BCh, 75h; 64
		db 0B7h,0BCh, 75h,0B7h,0BCh, 75h,0B7h,0BCh; 72
		db  75h, 2Ch,0BCh, 75h,	2Ch,0BCh, 75h, 1Dh; 80
		db 0BCh, 75h, 1Dh,0BCh,	75h,   0,0BCh, 75h; 88
		db 0E3h,0BBh, 49h,0A0h,0FFh, 51h, 14h, 21h; 96
		db  50h, 0Ah, 51h, 14h,	1Eh, 1Fh, 1Ch, 4Eh; 104
		db  0Ah, 50h, 14h, 4Eh,	14h, 1Eh, 4Ch, 0Ah; 112
		db  4Eh, 14h, 1Bh, 1Ch,	19h, 4Bh, 0Ah, 4Dh; 120
		db  14h, 76h, 4Dh, 14h,	1Ch, 4Bh, 0Ah, 4Dh; 128
		db  14h, 1Bh, 1Ch, 19h,	4Bh, 0Ah, 4Dh, 14h; 136
		db  4Dh, 14h, 1Ch, 4Bh,	0Ah, 4Dh, 14h, 17h; 144
		db  19h, 1Bh, 4Eh, 0Ah,	50h, 14h, 76h, 4Ah; 152
		db  14h, 1Ah, 49h, 0Ah,	4Ah, 14h, 18h, 1Ah; 160
		db  17h, 49h, 0Ah, 4Ah,	14h, 76h, 49h, 14h; 168
		db  18h, 47h, 0Ah, 49h,	14h, 13h, 15h, 12h; 176
		db  45h, 1Eh, 76h, 4Dh,	14h, 1Ch, 4Bh, 0Ah; 184
		db  4Dh, 14h, 17h, 19h,	15h, 49h, 1Eh, 4Dh; 192
		db  14h, 1Ch, 4Bh, 0Ah,	4Dh, 14h, 17h, 19h; 200
		db  1Bh, 4Eh, 0Ah, 50h,	14h, 76h, 4Eh, 14h; 208
		db  1Eh, 4Ch, 0Ah, 4Eh,	14h, 18h, 1Ah, 17h; 216
		db  4Ah, 1Eh, 76h, 75h,	71h,0BEh, 32h, 28h; 224
		db  15h, 32h, 14h, 47h,	1Eh, 15h, 32h, 28h; 232
		db  13h, 32h, 14h, 45h,	1Eh, 13h, 32h, 14h; 240
		db  15h,   0, 15h, 32h,	14h, 47h, 1Eh, 15h; 248
		db  32h, 14h, 13h,   0,	13h, 32h, 50h, 75h; 256
		db    5,0BEh, 76h, 75h,0EAh,0BDh, 4Fh, 14h; 264
		db  4Fh, 0Ah, 75h,   5,0BEh, 4Eh, 32h, 4Eh; 272
		db  14h, 4Ah, 0Ah, 4Fh,	14h, 4Ah, 0Ah, 4Eh; 280
		db  14h, 75h,0EAh,0BDh,	4Ah, 14h, 4Ah, 0Ah; 288
		db  75h,   5,0BEh, 49h,	32h, 49h, 14h, 45h; 296
		db  0Ah, 4Ah, 14h, 45h,	0Ah, 49h, 0Ah, 13h; 304
		db  76h, 51h, 14h, 21h,	50h, 0Ah, 51h, 14h; 312
		db  1Ch, 1Eh, 1Ah, 50h,	0Ah, 49h, 14h, 76h; 320
		db  4Eh, 14h, 17h, 1Ch,	49h, 0Ah, 51h, 14h; 328
		db  49h, 0Ah, 1Fh, 17h,	1Eh, 17h, 1Ch, 17h; 336
		db  4Eh, 14h, 18h, 1Ch,	4Ah, 0Ah, 51h, 14h; 344
		db  4Ah, 0Ah, 1Fh, 18h,	1Eh, 18h, 1Ch, 18h; 352
		db  76h, 79h, 1Fh, 32h,	14h,   0,   0, 32h; 360
		db    5, 79h, 0Fh,   0,	79h, 1Fh,   0, 79h; 368
		db  0Fh,   0, 79h, 1Fh,	32h, 14h,   0,	 0; 376
		db  79h, 1Fh, 32h, 0Ah,	79h, 0Fh,   0, 76h; 384
M03:		db  75h, 5Fh,0BEh, 75h,0DBh,0BDh, 75h,0DBh; 0 ;	DATA XREF: Init_AY_Music?+6o
		db 0BDh, 75h,0D7h,0BDh,	75h,0D7h,0BDh, 75h; 8
		db  5Eh,0BDh, 75h, 5Eh,0BDh, 75h,0BCh,0BDh; 16
		db  75h, 5Eh,0BDh, 75h,	5Eh,0BDh, 75h,0BCh; 24
		db 0BDh, 75h,0AFh,0BDh,	75h,0A7h,0BDh, 75h; 32
		db 0A7h,0BDh, 75h,0A7h,0BDh, 75h,0D1h,0BDh; 40
		db  75h, 95h,0BDh, 75h,	9Eh,0BDh, 75h, 8Ah; 48
		db 0BDh, 75h, 8Ah,0BDh,	75h, 8Ah,0BDh, 75h; 56
		db  8Ah,0BDh, 75h, 6Fh,0BDh, 75h, 6Fh,0BDh; 64
		db  75h, 78h,0BDh, 75h,	78h,0BDh, 75h, 81h; 72
		db 0BDh, 75h, 81h,0BDh,	75h, 65h,0BDh,0FFh; 80
		db  75h, 68h,0BEh, 36h,	50h, 10h, 76h, 42h; 88
		db  50h, 0Eh, 0Ch, 0Bh,	75h,   5,0BEh, 10h; 96
		db  76h, 75h, 68h,0BEh,	39h, 8Ch, 45h, 0Ah; 104
		db    7, 76h, 75h, 68h,0BEh, 3Eh, 8Ch, 4Ah; 112
		db  0Ah, 0Ch, 76h, 75h,	68h,0BEh, 3Dh, 8Ch; 120
		db  49h, 0Ah, 0Bh, 76h,	75h, 68h,0BEh, 42h; 128
		db  78h, 3Dh, 14h, 42h,	0Ah, 0Bh, 76h, 3Eh; 136
		db  78h, 39h, 28h, 3Eh,	78h, 39h, 28h, 76h; 144
		db  3Dh, 78h, 38h, 28h,	3Dh, 78h, 3Dh, 28h; 152
		db  76h, 75h, 68h,0BEh,	42h, 78h, 3Dh, 28h; 160
		db  76h, 75h, 71h,0BEh,	43h, 50h, 11h, 10h; 168
		db  10h, 11h, 11h, 10h,	10h, 76h, 75h,0EAh; 176
		db 0BDh, 3Eh, 14h, 75h,	4Dh,0BEh, 3Eh, 8Ch; 184
		db  75h,0EAh,0BDh, 39h,	14h, 75h, 4Dh,0BEh; 192
		db  39h, 8Ch, 76h, 75h,	68h,0BEh, 36h,0A0h; 200
		db  76h, 42h,0A0h, 0Ch,	76h, 39h, 50h, 0Ch; 208
		db  0Eh,   7, 76h, 8Ah,	  6,   1, 0Fh,	 1; 216
		db  0Fh,0FFh,	1, 76h,	8Ah,   6,   1, 0Fh; 224
		db    1, 0Fh,0FFh,   2,	76h, 8Ah,   6,	 2; 232
		db    7,   1, 0Fh,0FFh,	  3, 76h, 8Ah,	 6; 240
		db    2,   7,	1, 0Fh,0FFh,   4, 76h, 8Ah; 248
		db    6,   2,	7,   1,	0Fh,0FFh,   5, 76h; 256
		db  8Ah,   6,	2,   7,	  1, 0Fh,0FFh,	 6; 264
		db  76h, 8Ah,	6,   2,	  7,   1, 0Fh,0FFh; 272
		db    7, 76h, 8Ah,   6,	  2,   7,   1, 0Fh; 280
		db 0FFh,   8, 76h, 8Ah,	  6,   2,   7,	 1; 288
		db  0Fh,0FFh,	9, 76h,	8Ah,   6,   2,	 7; 296
		db    1, 0Fh,0FFh, 0Ah,	76h, 8Ah,   6,	 2; 304
		db    7,   1, 0Fh,0FFh,	0Bh, 76h, 8Ah,	 6; 312
		db    2,   7,	1, 0Fh,0FFh, 0Ch, 76h, 8Ah; 320
		db    6,   2,	7,   1,	0Fh,0FFh, 0Dh, 76h; 328
		db  8Ah,   6,	2,   7,	  1, 0Fh,0FFh, 0Eh; 336
		db  76h, 8Ah,	6,   2,	  7,   1, 0Fh,0FFh; 344
		db  0Fh, 76h, 8Ah,   6,	  4,   4,   1, 0Fh; 352
		db 0FFh, 17h, 76h, 8Ah,	  9,   1, 0Fh,	 1; 360
		db    3,0FFh,	5, 32h,	  0, 32h, 76h; 368
_CH_0_xxx:	db  7Fh,   0,	7, 0Dh,	  5,   1,   0,	 8; 0
					; DATA XREF: Init_AY_Music?+19o
					; do128musicstep+Ao ...
		db  0Dh,   0, 0Ah,   9,	  2,   0,   7,0BAh; 8
		db  5Ch,0BBh,	0,   0,	  0,   0,   0,	 0; 16
		db    0,   1,	0,   2,	  1,   1,   2,	 9; 24
		db    2,   1,	2,   4,0FFh,   2,   2,	 1; 32
		db    2,   0,	0,   0,	  0,   0,   0,	 0; 40
		db    0,   0,	0,   0,	  0,   3,   2, 0Fh; 48
		db 0FFh,   3,	6,   2,	  7,   1, 0Fh,0FFh; 56
		db    3,   0,	0,   0,	  0,   0,   0,	 0; 64
		db    0,   0,	0,   0,	  0,   0,   0,	 0; 72
_CH_1_xxx:	db 0BCh,   3,	8,   1,	  5,   1,   2,	 9; 0
					; DATA XREF: Init_AY_Music?+20o
					; do128musicstep+19o ...
		db  0Ch,   0, 14h, 12h,	  1,   0, 8Bh,0BBh; 8
		db    0,   0,	0,   0,	  0,   0,   0,	 0; 16
		db    0,0FFh,	6,   1,	  1,   1,   1,	 9; 24
		db    3,   1,	1,   6,0FFh,   1,   3,	 1; 32
		db    1,   0,	0,   0,	  0,   0,   0,	 0; 40
		db    0,   0,	0,   0,	  0,   3,   1,	 4; 48
		db 0FFh,   1,	6,   1,	0Fh,   1, 0Fh,0FFh; 56
		db    1,   0,	0,   0,	  0,   0,   0,	 0; 64
		db    0,   0,	0,   0,	  0,   0,   0,	 0; 72
_CH_2_xxx:	db 0DEh,   1, 31h, 0Ch,	  5,   1,   4, 0Ah; 0
					; DATA XREF: Init_AY_Music?+27o
					; do128musicstep+28o ...
		db  0Dh,   0, 50h, 24h,	  1,   0, 0Fh,0BDh; 8
		db    0,   0,	0,   0,	  0,   0,   0,	 0; 16
		db    0,   0,	3,   1,	  3,0FFh,   1,	 9; 24
		db    3,   1,	1,   6,0FFh,   1,   3,	 1; 32
		db    1,   0,	0,   0,	  0,   0,   0,	 0; 40
		db    0,   0,	0,   0,	  0,   3,   1, 0Eh; 48
		db 0FFh, 0Fh,	6,   2,	  7,   1, 0Fh,0FFh; 56
		db  0Fh,   0,	0,   0,	  0,   0,   0,	 0; 64
		db    0,   0,	0,   0,	  0,   0,   0,	 0; 72

; =============== S U B	R O U T	I N E =======================================

; a-reg
; c-value

write2psg:				; CODE XREF: psg_mute:loc_B75Dp
					; RAM:B81Ap ...
		push	af
		push	bc
		push	hl
		ld	h, c
		ld	bc, 0FFFDh
		out	(c), a
		ld	b, 0BFh	; '¿'
		out	(c), h
		pop	hl
		pop	bc
		pop	af
		ret
; End of function write2psg


; =============== S U B	R O U T	I N E =======================================


doPSG:				; CODE XREF: CheckGameRestart7890-2454p
					; CheckGameRestart7890-2418p ...
		xor	a
		ld	(byte_C5EA), a
		ld	a, 10111111b
		ld	(ayvoicena), a
		ld	a, 11110110b
		ld	(byte_C5E7), a
		ld	ix, byte_C5EB
		ld	b, 10h

loc_BF92:				; CODE XREF: doPSG+2Ej
		push	ix
		push	bc
		ld	a, (ix+0)
		cp	0FFh
		jr	z, loc_BFA4
		call	sub_BFBF
		ld	hl, byte_C5E7
		rlc	(hl)

loc_BFA4:				; CODE XREF: doPSG+1Cj
		pop	bc
		pop	ix
		ld	de, 10h
		add	ix, de
		djnz	loc_BF92
		ld	a, AY_NOISE_PERIOD
		ld	bc, (aynoise)
		call	write2psg	; a-reg
					; c-value
		ld	bc, (ayvoicena)
		inc	a
		jp	write2psg	; a-reg
; End of function doPSG		; c-value


; =============== S U B	R O U T	I N E =======================================


sub_BFBF:				; CODE XREF: doPSG+1Ep

; FUNCTION CHUNK AT C05A SIZE 0000001D BYTES

		dec	(ix+3)
		call	z, sub_BFE1
		dec	(ix+6)
		jp	nz, loc_BFDE
		ld	a, (ix+7)
		ld	(ix+6),	a
		ld	a, (ix+4)
		or	a
		jp	z, loc_BFDE
		sub	(ix+8)
		ld	(ix+4),	a

loc_BFDE:				; CODE XREF: sub_BFBF+9j sub_BFBF+16j
		jp	loc_C05A
; End of function sub_BFBF


; =============== S U B	R O U T	I N E =======================================


sub_BFE1:				; CODE XREF: sub_BFBF+3p
		ld	l, (ix+1)
		ld	h, (ix+2)

loc_BFE7:				; CODE XREF: sub_BFE1+1Bj sub_BFE1+32j ...
		ld	a, (hl)
		cp	0FFh
		jr	nz, loc_BFF2
		ld	(ix+0),	0FFh
		pop	af
		ret
; ---------------------------------------------------------------------------

loc_BFF2:				; CODE XREF: sub_BFE1+9j
		cp	0FEh ; 'þ'
		jr	nz, loc_BFFE
		inc	hl
		ld	a, (hl)
		ld	(ix+5),	a
		inc	hl
		jr	loc_BFE7
; ---------------------------------------------------------------------------

loc_BFFE:				; CODE XREF: sub_BFE1+13j
		cp	0FDh ; 'ý'
		jr	nz, loc_C015
		inc	hl
		ld	a, (hl)
		ld	(ix+7),	a
		srl	a
		inc	a
		ld	(ix+6),	a
		inc	hl
		ld	a, (hl)
		ld	(ix+8),	a
		inc	hl
		jr	loc_BFE7
; ---------------------------------------------------------------------------

loc_C015:				; CODE XREF: sub_BFE1+1Fj
		cp	0FCh ; 'ü'
		jr	nz, loc_C021
		inc	hl
		ld	a, (hl)
		ld	(ix+0Bh), a
		inc	hl
		jr	loc_BFE7
; ---------------------------------------------------------------------------

loc_C021:				; CODE XREF: sub_BFE1+36j
		cp	0FBh ; 'û'
		jr	nz, loc_C02A
		inc	hl
		ld	a, (hl)
		ld	(aynoise), a

loc_C02A:				; CODE XREF: sub_BFE1+42j
		cp	60h ; '`'
		jr	c, loc_C035
		sub	60h ; '`'
		inc	hl
		ld	c, (hl)
		ld	(ix+0Ch), c

loc_C035:				; CODE XREF: sub_BFE1+4Bj
		inc	hl
		ld	(ix+1),	l
		ld	(ix+2),	h
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, byte_C6EB
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+9),	e
		ld	(ix+0Ah), d
		ld	a, (ix+0Ch)
		ld	(ix+3),	a
		ld	a, (ix+5)
		ld	(ix+4),	a
		ret
; End of function sub_BFE1

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_BFBF

loc_C05A:				; CODE XREF: sub_BFBF:loc_BFDEj
		ld	a, (byte_C5EA)
		ld	l, a
		inc	a
		ld	(byte_C5EA), a
		ld	h, 0
		add	hl, hl
		ld	de, off_C077
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	e, (ix+9)
		ld	d, (ix+0Ah)
		ld	c, (ix+4)
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_BFBF
; ---------------------------------------------------------------------------
off_C077:	dw loc_C097		; DATA XREF: sub_BFBF+A6o
		dw loc_C0B1
		dw loc_C0CC
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
		dw _ret
; ---------------------------------------------------------------------------

loc_C097:				; DATA XREF: RAM:off_C077o
		ld	hl, ayvoicena
		ld	a, (byte_C5E7)
		or	(ix+0Bh)
		and	(hl)
		ld	(hl), a
		ld	a, AY_CH_A_Volume
		call	write2psg	; a-reg
					; c-value
		xor	a
		ld	c, e
		call	write2psg	; a-reg
					; c-value
		inc	a
		ld	c, d
		jp	write2psg	; a-reg
					; c-value
; ---------------------------------------------------------------------------

loc_C0B1:				; DATA XREF: RAM:C079o
		ld	hl, ayvoicena
		ld	a, (byte_C5E7)
		or	(ix+0Bh)
		and	(hl)
		ld	(hl), a
		ld	a, AY_CH_B_Volume
		call	write2psg	; a-reg
					; c-value
		ld	a, AY_CH_B_FREQ0
		ld	c, e
		call	write2psg	; a-reg
					; c-value
		inc	a
		ld	c, d
		jp	write2psg	; a-reg
					; c-value
; ---------------------------------------------------------------------------

loc_C0CC:				; DATA XREF: RAM:C07Bo
		ld	hl, ayvoicena
		ld	a, (byte_C5E7)
		or	(ix+0Bh)
		and	(hl)
		ld	(hl), a
		ld	a, AY_CH_C_Volume
		call	write2psg	; a-reg
					; c-value
		ld	a, AY_CH_C_FREQ0
		ld	c, e
		call	write2psg	; a-reg
					; c-value
		inc	a		; niose	period ?
		ld	c, d
		jp	write2psg	; a-reg
					; c-value

; =============== S U B	R O U T	I N E =======================================


snd_single_shot_to_item:		; CODE XREF: __move__???+2Bp
					; __move__???+3Ap
		push	af
		push	bc
		ld	a, 0Dh
		ld	bc, byte_C264
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_single_shot_to_item


; =============== S U B	R O U T	I N E =======================================


snd_got_white_box:			; CODE XREF: chkBoxAmoGrenade?+3Ep
					; chkSuperShieldChange+38p
		push	af
		push	bc
		ld	a, 2
		ld	bc, byte_C218
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_got_white_box


; =============== S U B	R O U T	I N E =======================================


snd_got_yellow_box:			; CODE XREF: chkBoxAmoGrenade?+94p
		push	af
		push	bc
		ld	a, 2
		ld	bc, byte_C23E
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_got_yellow_box

; ---------------------------------------------------------------------------

snd_quirk:
		ld	a, 4
		ld	bc, byte_C55D
		jp	init_snd_effect
; ---------------------------------------------------------------------------

snd_DinDuDu:
		ld	a, 0Eh
		ld	bc, byte_C54D
		call	init_snd_effect
		ld	a, 5
		ld	bc, byte_C56D
		jp	init_snd_effect
; ---------------------------------------------------------------------------

snd_Quuu:
		ld	a, 0Dh
		ld	bc, byte_C5BA
		jp	init_snd_effect

; =============== S U B	R O U T	I N E =======================================


snd_add_extra_point:			; CODE XREF: add_A_bonus_and_snd+2p
					; chkBonusPoint?+20p
		push	af
		push	bc
		ld	a, 5
		ld	bc, byte_C280
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_add_extra_point


; =============== S U B	R O U T	I N E =======================================


snd_shot_tworocket:			; CODE XREF: chkRocketLauncher+3Cp
		push	af
		push	bc
		ld	a, 7
		ld	bc, byte_C2C7
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_shot_tworocket


; =============== S U B	R O U T	I N E =======================================


snd_first_first_gun:			; CODE XREF: sub_9071+2Ej do_MINES+57p ...
		push	af
		push	bc
		ld	a, 6
		ld	bc, byte_C305
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_first_first_gun


; =============== S U B	R O U T	I N E =======================================


snd_destroy_ball:			; CODE XREF: sub_9B6B+Ep sub_9BB4+1Cp	...
		push	af
		push	bc
		ld	a, 8
		ld	bc, byte_C33E
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_destroy_ball


; =============== S U B	R O U T	I N E =======================================


snd_teleport:				; CODE XREF: doTeleport+39p
					; doTeleport+6Ep
		push	af
		push	bc
		ld	a, 0Dh
		ld	bc, byte_C462
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_teleport

; ---------------------------------------------------------------------------

snd_Buue:
		ld	a, 0Ch
		ld	bc, byte_C5C8
		jp	init_snd_effect

; =============== S U B	R O U T	I N E =======================================


snd_player_shot:			; CODE XREF: chkFire?+3Ap
		ld	a, 0Fh
		ld	bc, byte_C5A1
		jp	init_snd_effect
; End of function snd_player_shot

; ---------------------------------------------------------------------------

snd_trululo:
		ld	a, 8
		ld	bc, byte_C577
		call	init_snd_effect
		inc	a
		ld	bc, byte_C585
		call	init_snd_effect
		inc	a
		ld	bc, byte_C593
		jp	init_snd_effect
; ---------------------------------------------------------------------------

snd_Dududu:
		push	af
		push	bc
		xor	a
		ld	bc, byte_C44A
		call	init_snd_effect
		ld	a, 0Fh
		ld	bc, byte_C53F
		call	init_snd_effect
		pop	bc
		pop	af
		ret

; =============== S U B	R O U T	I N E =======================================


snd_vertical_laser_beam:		; CODE XREF: updateBeam+7p
		push	af
		push	bc
		ld	a, 1
		ld	bc, byte_C35C
		call	init_snd_effect
		ld	a, 0Bh
		ld	bc, byte_C361
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_vertical_laser_beam


; =============== S U B	R O U T	I N E =======================================


snd_Fire_Grenades:			; CODE XREF: chkGrenades?+4Cp
		push	af
		push	bc
		ld	a, 9
		ld	bc, byte_C366
		call	init_snd_effect
		ld	a, 0Fh
		ld	bc, byte_C3D8
		call	init_snd_effect
		pop	bc
		pop	af
		ret
; End of function snd_Fire_Grenades


; =============== S U B	R O U T	I N E =======================================


init_snd_effect:			; CODE XREF: snd_single_shot_to_item+7p
					; snd_got_white_box+7p	...
		push	ix
		push	hl
		push	de
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; 16
		ld	de, byte_C5EB
		add	hl, de
		push	hl
		pop	ix
		ld	(ix+0),	0FFh
		ld	(ix+1),	c
		ld	(ix+2),	b
		ld	(ix+3),	1
		ld	(ix+4),	0Fh
		ld	(ix+5),	0Fh
		ld	(ix+8),	1
		ld	(ix+9),	0
		ld	(ix+0Ah), 0
		ld	(ix+0Bh), 38h ;	'8'
		ld	(ix+0Ch), 1
		ld	(ix+0),	0
		pop	de
		pop	hl
		pop	ix
		ret
; End of function init_snd_effect

; ---------------------------------------------------------------------------
byte_C218:	db 0FEh, 0Dh,0AFh,   3,	47h, 3Fh, 37h,0FEh; 0
					; DATA XREF: snd_got_white_box+4o
		db  0Bh, 4Fh, 47h, 3Fh,	37h,0FEh,   9, 4Fh; 8
		db  47h, 3Fh, 37h,0FEh,	  7, 4Fh, 47h, 3Fh; 16
		db  37h,0FEh,	5, 4Fh,	47h, 3Fh, 37h,0FEh; 24
		db    3, 4Fh, 47h, 3Fh,	37h,0FFh; 32
byte_C23E:	db 0FEh, 0Dh,0B4h,   3,	4Ch, 44h, 3Ch,0FEh; 0
					; DATA XREF: snd_got_yellow_box+4o
		db  0Bh, 54h, 4Ch, 44h,	3Ch,0FEh,   9, 54h; 8
		db  4Ch, 44h, 3Ch,0FEh,	  7, 54h, 4Ch, 44h; 16
		db  3Ch,0FEh,	5, 54h,	4Ch, 44h, 3Ch,0FEh; 24
		db    3, 54h, 4Ch, 44h,	3Ch,0FFh; 32
byte_C264:	db 0FCh,   0,0FEh, 0Dh,0FBh,   0,0ABh,	 1; 0
					; DATA XREF: snd_single_shot_to_item+4o
		db 0FEh, 0Ch, 4Bh,0FEh,	0Bh, 4Bh,0FEh, 0Ah; 8
		db  4Bh,0FEh,	5,0ABh,	  3,0FEh,   4, 4Bh; 16
		db 0FEh,   3, 4Bh,0FFh	; 24
byte_C280:	db 0FEh, 0Ch, 9Ch,   3,	  0, 3Ch,   0, 3Ch; 0
					; DATA XREF: snd_add_extra_point+4o
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 8
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 16
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 24
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 32
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 40
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 0
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,   0, 3Ch; 8
		db    0, 3Ch,	0, 3Ch,	  0, 3Ch,0FFh; 16
byte_C2C7:	db 0FCh,   7,0FEh, 0Eh,0FBh,   0, 63h,	 1; 0
					; DATA XREF: snd_shot_tworocket+4o
		db 0FBh,   2,	1,0FBh,	  4,   1,0FBh,	 6; 8
		db    1,0FBh,	8,   1,0FBh, 0Ah,   1,0FBh; 16
		db  0Ch,   1,0FBh, 0Eh,	  1,0FBh, 10h,	 1; 24
		db 0FBh, 12h,	1,0FBh,	14h,   1,0FBh, 16h; 32
		db    1,0FEh,	8,0FBh,	18h,   1,0FEh,	 6; 40
		db 0FBh, 1Ah,	1,0FEh,	  4,0FBh, 1Ch,	 1; 48
		db 0FEh,   2,0FBh, 1Eh,	  1,0FFh; 56
byte_C305:	db 0FCh,   0,0FBh, 1Fh,0FEh, 0Fh, 88h,	 2, 27h, 26h, 25h, 24h,0FEh, 0Eh, 23h, 22h,0FEh, 0Dh, 21h, 20h,0FEh, 0Ch, 1Fh,0FEh, 0Bh, 1Eh,0FEh, 0Ah,	1Dh,0FEh,   9, 1Ch,0FEh,   8, 1Ah,0FEh,	  7, 18h,0FEh,	 6, 16h,0FEh,	5, 14h,0FEh,   4, 12h,0FEh; 0
					; DATA XREF: snd_first_first_gun+4o
		db    3, 10h,0FEh,   2,	0Eh,0FEh,   1, 0Ch,0FFh; 48
byte_C33E:	db 0FCh,   0,0FBh,   0,0FEh, 0Eh, 92h,	 1; 0
					; DATA XREF: snd_destroy_ball+4o
		db 0FEh, 0Dh, 30h,0FEh,	0Ch, 2Eh,0FEh, 0Bh; 8
		db  2Ch,0FEh,	9, 2Ah,0FEh,   7, 28h,0FEh; 16
		db    5, 26h,0FEh,   3,	24h,0FFh; 24
byte_C35C:	db 0FEh, 0Ch, 61h, 0Ah,0FFh; 0 ; DATA XREF: snd_vertical_laser_beam+4o
byte_C361:	db 0FEh, 0Ch, 62h, 0Ah,0FFh; 0 ; DATA XREF: snd_vertical_laser_beam+Co
byte_C366:	db 0FEh,   1,0AFh,   1,0FEh,   3, 4Eh,0FEh,   5, 4Dh,0FEh,   7,	4Ch,0FEh,   9, 4Bh,0FEh, 0Bh, 4Ah,0FEh,	0Dh, 49h,0FEh, 0Fh, 48h, 47h, 46h, 45h,0FEh, 0Eh, 44h, 43h, 42h, 41h,0FEh, 0Dh,	40h, 3Fh, 3Eh, 3Dh,0FEh, 0Ch, 3Ch, 3Bh,	3Ah, 39h,0FEh, 0Bh; 0
					; DATA XREF: snd_Fire_Grenades+4o
		db  38h, 37h, 36h, 35h,0FEh, 0Ah, 34h, 33h, 32h, 31h,0FEh,   9,	30h, 2Fh, 2Eh, 2Dh,0FEh,   8, 2Ch, 2Bh,	2Ah, 29h,0FEh,	 7, 28h, 27h, 26h, 25h,0FEh,   6, 24h, 23h, 22h, 21h,0FEh,   5,	20h, 1Fh, 1Eh, 1Dh,0FEh,   4, 1Ch, 1Bh,	1Ah, 19h,0FEh,	 3; 48
		db  18h, 17h, 16h, 15h,0FEh,   2, 14h, 14h, 13h, 12h,0FEh,   1,	11h, 10h, 0Fh, 0Eh, 0Dh,0FFh; 96
byte_C3D8:	db 0FEh,   1, 9Bh,   1,0FEh,   3, 3Ah,0FEh; 0
					; DATA XREF: snd_Fire_Grenades+Co
		db    5, 39h,0FEh,   7,	38h,0FEh,   9, 37h; 8
		db 0FEh, 0Bh, 36h,0FEh,	0Dh, 35h,0FEh, 0Fh; 16
		db  34h, 33h, 32h, 31h,0FEh, 0Eh, 30h, 2Fh; 24
		db  2Eh, 2Dh,0FEh, 0Dh,	2Ch, 2Bh, 2Ah, 29h; 32
		db 0FEh, 0Ch, 28h, 27h,	26h, 25h,0FEh, 0Bh; 40
		db  24h, 23h, 22h, 21h,0FEh, 0Ah, 20h, 1Fh; 48
		db  1Eh, 1Dh,0FEh,   9,	1Ch, 1Bh, 1Ah, 19h; 56
		db 0FEh,   8, 18h, 17h,	16h, 15h,0FEh,	 7; 64
		db  14h, 13h, 12h, 11h,0FEh,   6, 10h, 0Fh; 72
		db  0Eh, 0Dh,0FEh,   5,	0Ch, 0Bh, 0Ah, 13h; 80
		db 0FEh,   4, 12h, 11h,	10h, 0Fh,0FEh,	 3; 88
		db  0Eh, 0Dh, 0Ch, 0Bh,0FEh,   2, 0Ah, 0Ah; 96
		db    9,   8,0FEh,   1,	  7,   6,   5,	 4; 104
		db    3,0FFh		; 112
byte_C44A:	db 0FEh, 0Fh, 9Ch,   2,	40h, 43h, 3Bh, 3Fh; 0 ;	DATA XREF: RAM:C198o
		db  42h, 3Ah, 3Eh, 41h,	39h, 3Dh, 40h, 38h; 8
		db  3Ch, 3Fh, 37h, 3Bh,	3Eh, 9Ch,   6,0FFh; 16
byte_C462:	db 0FCh,   0,0FEh, 0Fh,	9Ch,   1,0FEh, 0Eh; 0 ;	DATA XREF: snd_teleport+4o
		db  3Ch,0FEh, 0Dh, 3Ch,0FEh, 0Ch, 3Ch,0FEh; 8
		db  0Fh, 3Ch,	1,0FEh,	0Eh, 3Ch,0FEh, 0Dh; 16
		db  3Ch,0FEh, 0Ch, 3Ch,0FEh, 0Eh, 3Ch,0FEh; 24
		db  0Dh, 3Ch,0FEh, 0Ch,	3Ch,0FEh, 0Bh, 3Ch; 32
		db 0FEh, 0Eh, 3Ch,0FEh,	0Dh, 3Ch,0FEh, 0Ch; 40
		db  3Ch,0FEh, 0Bh, 3Ch,0FEh, 0Dh, 3Ch,0FEh; 48
		db  0Ch, 3Ch,0FEh, 0Bh,	3Ch,0FEh, 0Ah, 3Ch; 56
		db 0FEh, 0Dh, 3Ch,0FEh,	0Ch, 3Ch,0FEh, 0Bh; 64
		db  3Ch,0FEh, 0Ah, 3Ch,0FEh, 0Ch, 3Ch,0FEh; 72
		db  0Bh, 3Ch,0FEh, 0Ah,	3Ch,0FEh,   9, 3Ch; 80
		db 0FEh, 0Ch, 3Ch,0FEh,	0Bh, 3Ch,0FEh, 0Ah; 88
		db  3Ch,0FEh,	9, 3Ch,0FEh, 0Bh, 3Ch,0FEh; 96
		db  0Ah, 3Ch,0FEh,   9,	3Ch,0FEh,   8, 3Ch; 104
		db 0FEh, 0Bh, 3Ch,0FEh,	0Ah, 3Ch,0FEh,	 9; 112
		db  3Ch,0FEh,	8, 3Ch,0FEh, 0Ah, 3Ch,0FEh; 120
		db    9, 3Ch,0FEh,   8,	3Ch,0FEh,   7, 3Ch; 128
		db 0FEh, 0Ah, 3Ch,0FEh,	  9, 3Ch,0FEh,	 8; 136
		db  3Ch,0FEh,	7, 3Ch,0FEh,   9, 3Ch,0FEh; 144
		db    8, 3Ch,0FEh,   7,	3Ch,0FEh,   6, 3Ch; 152
		db 0FEh,   9, 3Ch,0FEh,	  8, 3Ch,0FEh,	 7; 160
		db  3Ch,0FEh,	6, 3Ch,0FEh,   8, 3Ch,0FEh; 168
		db    7, 3Ch,0FEh,   6,	3Ch,0FEh,   5, 3Ch; 176
		db 0FEh,   8, 3Ch,0FEh,	  7, 3Ch,0FEh,	 6; 184
		db  3Ch,0FEh,	5, 3Ch,0FEh,   7, 3Ch,0FEh; 192
		db    6, 3Ch,0FEh,   5,	3Ch,0FEh,   4, 3Ch; 200
		db 0FEh,   7, 3Ch,0FEh,	  6, 3Ch,0FEh,	 5; 208
		db  3Ch,0FEh,	4, 3Ch,0FFh; 216
byte_C53F:	db 0FEh, 0Fh,0FDh,   1,	  1, 90h,   6, 2Fh; 0 ;	DATA XREF: RAM:C1A0o
		db  2Eh, 2Dh, 2Ch, 2Bh,	30h,0FFh; 8
byte_C54D:	db 0FEh, 0Fh,0FDh,   2,	  1,0A3h,   9,0A0h; 0 ;	DATA XREF: RAM:C118o
		db    3, 3Eh, 40h,0A1h,	  6, 40h, 3Ch,0FFh; 8
byte_C55D:	db 0FEh, 0Fh,0FDh,   1,	  1,0A3h,   1, 41h; 0 ;	DATA XREF: RAM:C110o
		db  46h, 45h, 43h, 41h,	46h,0A5h,   2,0FFh; 8
byte_C56D:	db 0FEh, 0Ch,0FDh,   4,	  1, 9Ch, 0Ch, 37h; 0 ;	DATA XREF: RAM:C120o
		db  3Ch,0FFh		; 8
byte_C577:	db 0FEh, 0Fh,0FDh,   1,	  1,0A8h,   4, 43h; 0 ;	DATA XREF: RAM:C181o
		db  40h, 3Ch, 40h, 43h,	48h,0FFh; 8
byte_C585:	db 0FEh, 0Ah,0FDh,   1,	  1,0A3h,   4, 40h; 0 ;	DATA XREF: RAM:C188o
		db  3Ch, 37h, 3Ch, 40h,	43h,0FFh; 8
byte_C593:	db 0FEh, 0Ah,0FDh,   1,	  1,0A0h,   4, 3Ch; 0 ;	DATA XREF: RAM:C18Fo
		db  37h, 34h, 37h, 3Ch,	40h,0FFh; 8
byte_C5A1:	db 0FCh,   0,0FEh, 0Dh,0FBh, 0Fh, 74h,	 1; 0
					; DATA XREF: snd_player_shot+2o
		db 0FEh, 0Bh, 14h,0FEh,	  9, 14h,0FEh,	 7; 8
		db  14h,0FEh,	3, 74h,	  3,0FEh,   2, 14h; 16
		db 0FFh			; 24
byte_C5BA:	db 0FEh, 0Fh,0FDh,   2,	  1,0A5h,   2, 46h; 0 ;	DATA XREF: RAM:C128o
		db  47h, 48h, 47h, 46h,	45h,0FFh; 8
byte_C5C8:	db 0FEh, 0Dh,0FDh,   3,	  1,0FCh,   0,0FBh; 0 ;	DATA XREF: RAM:C171o
		db    0, 88h,	3, 89h,	  1, 2Ah, 2Bh, 2Ch; 8
		db  2Dh, 2Eh, 2Fh, 30h,	31h, 32h, 33h, 34h; 16
		db  35h, 36h, 37h, 98h,	  4,0FFh,   0; 24
byte_C5E7:	db 0			; DATA XREF: doPSG+Bw doPSG+21o	...
aynoise:	db 0			; DATA XREF: doPSG+32r sub_BFE1+46w
ayvoicena:	db 0			; DATA XREF: doPSG+6w doPSG+39r	...
byte_C5EA:	db 0			; DATA XREF: doPSG+1w
					; sub_BFBF:loc_C05Ar ...
byte_C5EB:	db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 0
					; DATA XREF: doPSG+Eo
					; init_snd_effect+Bo
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 16
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 32
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 48
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 64
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 80
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 96
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 112
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 128
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 144
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 160
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 176
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 192
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 208
		db 0FFh,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0; 224
		db 0FFh
		db    0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0; 0
byte_C6EB:	db    0,   0, 84h,   3,	92h,   3, 8Eh, 0Ch,0DAh, 0Bh, 2Fh, 0Bh,	8Fh, 0Ah,0F7h,	 9, 68h,   9,0E1h,   8,	61h,   8,0E9h,	 7, 77h,   7, 0Ch,   7,0A7h,   6, 47h,	 6,0EDh,   5, 98h,   5,	47h,   5,0FCh,	 4,0B4h,   4, 70h,   4,	31h,   4,0F4h,	 3; 0
					; DATA XREF: sub_BFE1+5Fo
byte_C71B:	db 0BCh,   3, 86h,   3,	53h,   3, 24h,	 3,0F6h,   2,0CCh,   2,0A4h,   2, 7Eh,	 2, 5Ah,   2, 38h,   2,	18h,   2,0FAh,	 1,0DEh,   1,0C3h,   1,0AAh,   1, 92h,	 1, 7Bh,   1, 66h,   1,	52h,   1, 3Fh,	 1, 2Dh,   1, 1Ch,   1,	0Ch,   1,0FDh,	 0; 0
					; DATA XREF: RAM:B8B0o
		db 0EFh,   0,0E1h,   0,0D5h,   0,0C9h,	 0,0BEh,   0,0B3h,   0,0A9h,   0, 9Fh,	 0, 96h,   0, 8Eh,   0,	86h,   0, 7Fh,	 0, 77h,   0, 71h,   0,	6Ah,   0, 64h,	 0, 5Fh,   0, 59h,   0,	54h,   0, 50h,	 0, 4Bh,   0, 47h,   0,	43h,   0, 3Fh,	 0; 48
		db  3Ch,   0, 38h,   0,	35h,   0, 32h,	 0, 2Fh,   0, 2Dh,   0,	2Ah,   0, 28h,	 0, 26h,   0, 24h,   0,	22h,   0, 20h,	 0, 1Eh,   0, 1Ch,   0,	1Bh,   0, 19h,	 0, 18h,   0, 16h,   0,	15h,   0, 14h,	 0, 13h,   0, 12h,   0,	11h,   0, 10h,	 0; 96
		db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0F3h, 21h,0AAh,0C7h,   1, 0Eh,0F4h,0EDh, 49h,   6,0F6h,0EDh, 78h,0E6h, 30h, 4Fh,0F6h,0C0h,0EDh, 79h,0EDh, 49h,   4, 3Eh, 92h,0EDh,	79h,0C5h,0CBh,0F1h,   6,0F6h,0EDh, 49h,	  6,0F4h,0EDh, 78h; 144
		db  23h, 77h, 0Ch, 79h,0E6h, 0Fh,0FEh, 0Ah, 20h,0EEh,0C1h, 3Eh,	82h,0EDh, 79h,	 5,0EDh, 49h, 7Eh,0F6h,	60h, 77h,0FBh,0C9h; 192
; ---------------------------------------------------------------------------

_ret:					; DATA XREF: RAM:C07Do	RAM:C07Fo ...
		ret
; ---------------------------------------------------------------------------
