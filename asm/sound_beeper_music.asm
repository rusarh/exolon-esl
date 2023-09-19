;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

playBeeperMusic:
		xor	a
		in	a, (0FEh)
		cpl
		and	1Fh
		jr	nz, playBeeperMusic
		ld	(NoteAddr), hl

loc_7D22:
		xor	a
		in	a, (0FEh)
		and	1Fh
		cp	1Fh
		jp	z, loc_7D2D

locret_7D2C:
		ret
; ---------------------------------------------------------------------------

loc_7D2D:
		ld	hl, (NoteAddr)
		ld	a, (hl)
		or	a
		jp	z, locret_7D2C
		inc	hl
		ld	(byte_7FEE), a
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	(NoteAddr), hl
		ld	a, c
		or	b
		jp	nz, loc_7D4E
		ld	a, (byte_7FEE)
		call	sub_8004
		jp	loc_7D22
; ---------------------------------------------------------------------------

loc_7D4E:
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

; ---------------------------------------------------------------------------

flag_BeeperMenuMusic:db	0
musicGameOver:	db  0Fh, 1Ch, 28h, 0Fh,	1Ch, 2Ch, 0Fh, 1Ch, 2Fh, 0Fh, 1Bh, 27h,	0Fh, 1Bh, 2Bh, 0Fh; 0
		db  1Bh, 2Eh, 0Fh, 1Ah,	26h, 0Fh, 1Ah, 2Ah, 0Fh, 1Ah, 2Dh, 0Fh,	19h, 25h, 0Fh, 19h; 16
		db  29h, 0Fh, 19h, 2Ch,	0Fh, 18h, 24h, 0Fh, 18h, 28h, 0Fh, 18h,	2Bh, 0Fh, 17h, 23h; 32
		db  0Fh, 17h, 27h, 0Fh,	17h, 2Ah, 2Dh, 1Ch, 28h,   0,	0; 48
;
menuMusic:	db  12h, 13h, 2Bh, 12h,	13h, 26h, 12h, 13h, 2Bh, 12h, 13h, 2Fh,	24h, 13h, 32h, 24h; 0
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
byte_7FEE:	db 0EEh
NoteAddr:	dw 0
; ---------------------------------------------------------------------------

loc_7FF1:
		and	0FFh
		ex	af, af'
		inc	d
		jp	nz, loc_801F

loc_7FF8:
		nop
		nop
		nop
		xor	c
		ld	d, l
		djnz	loc_800E
		dec	h
		jp	nz, loc_8010
		ret

sub_8004:


		ld	h, a
		ld	ixl, e
		ld	l, d
		ld	c, 10h
		xor	a
		ex	af, af'
		xor	a
		ld	b, a

loc_800E:
		or	a
		and	a

loc_8010:
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

loc_801F:
		nop
		nop
		nop
		or	a
		and	a
		djnz	loc_800E
		dec	h
		jp	nz, loc_8010
		ret

; ---------------------------------------------------------------------------

loc_802B:
		and	0FFh
		ex	af, af'
		inc	d
		jp	nz, loc_8057

loc_8032:
		out	(0FEh),	a
		xor	c
		ld	d, l
		djnz	loc_8047
		dec	h
		jp	nz, loc_8049
		ret

; =============== S U B	R O U T	I N E =======================================


sub_803D:


		ld	h, a
		ld	ixl, e
		ld	l, d
		ld	c, 10h
		xor	a
		ex	af, af'
		xor	a
		ld	b, a

loc_8047:
		or	a
		and	a

loc_8049:
		ex	af, af'
		inc	e
		out	(0FEh),	a
		jr	nz, loc_802B
		xor	c
		ld	e, ixl
		ex	af, af'
		inc	d
		jp	z, loc_8032

loc_8057:
		out	(0FEh),	a
		or	a
		and	a
		djnz	loc_8047
		dec	h
		jp	nz, loc_8049
		ret

; ---------------------------------------------------------------------------
byte_8062:	db   1,	16, 29,	41, 52,	64, 76,	84, 95,105,112,120,128,135,142,148; 0
		db 154,160,165,170,175,180,184,188,192,195,199,202,205,208,211,213; 16
		db 216,218,220,222,224,226,228,229,231,232,233,235,236,237,238,239; 32
		db 240,241,242,243,244	; 48

