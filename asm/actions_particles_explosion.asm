;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;use preshifted sprites
;explossions related particles
;used only wheb object destroyed
;called only from PutCharXorRemoveObject_2boom
;supported up to - 100 items

; e-x (/4)
; d-y (/8)

add_explosion_particle:
		push	af
		push	de
		push	hl
		push	bc
;
		ld	bc, 6
		ld	hl, explosion_particles_Buf

aep_loop:
		ld	a, (hl) 		;inUse flag
		or	a
		jr	z, expl_found_empty
		cp	0FFh
		jr	z, expl_table_full
		add	hl, bc
		jr	aep_loop
; ---------------------------------------------------------------------------

expl_found_empty:
		ld	(hl), 1 	;used
		inc	hl

		ld	a, e
		rlca
		rlca
		ld	e, a
		ld	(hl), e 	;x
		inc	hl

		ld	a, d
		rlca
		rlca
		rlca
		ld	d, a
		ld	(hl), d		;y
		inc	hl

		call	RND
		and	7
		call	getdelta
		ld	(hl), a		;dx
		ld	c, a 		;random color update
		inc	hl

same_as_dx:
		call	RND
		and	7
		call	getdelta
		add	a, a
		ld	b, a
		or	c 		;random color update
		jr	z, same_as_dx 	;????
		ld	(hl), b 	;dy

		ld	a, 2		; 2 - Boom1 - Biggest
		call	Sprite8x8_XOR_Preshifted 

		pop	bc
		push	bc
		inc	hl

		ld	a, c
		and	47h ; 'G'
		ld	(hl), a 	;color

expl_table_full:
		pop	bc
		pop	hl
		pop	de
		pop	af
		ret
; =============== S U B	R O U T	I N E =======================================

getdelta:
		push	hl
		push	bc
		ld	l, a
		ld	h, 0
		ld	bc, delta_tab
		add	hl, bc
		ld	a, (hl)
		pop	bc
		pop	hl
		ret
; ---------------------------------------------------------------------------
delta_tab:	db    -4, -3, -2, 0
		db     0,  2,  3, 4

; =============== S U B	R O U T	I N E =======================================

move_ExplosionParticles:
		ld	hl, explosion_particles_Buf

mv_explosion_lp:
		ld	a, (hl)
		cp	0FFh
		ret	z
		cp	1
		jr	z, mv_explosion_found
		ld	bc, 6
		add	hl, bc
		jr	mv_explosion_lp
; ---------------------------------------------------------------------------

mv_explosion_found:
		push	hl
		inc	hl
		push	hl
		ld	e, (hl)			;x
		inc	hl
		ld	d, (hl)			;y
		ld	a, 2		; 2 - Boom1 - Biggest
		call	Sprite8x8_XOR_Preshifted ; erase?
		inc	hl

		ld	a, e
		add	a, (hl) 		;dx
		ld	e, a
		cp	120
		jr	nc, deactivatrParticle

		inc	hl
		ld	a, d
		add	a, (hl)			;dy
		ld	d, a
		cp	169
		jr	nc, deactivatrParticle

		inc	hl
		ld	c, (hl)
		pop	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d

		ld	a, 2		; 2 - Boom1 - Biggest
		call	Sprite8x8_XOR_Preshifted

		call	fillAttr_1x1

		ld	a, (FlagZX128)	; 00 - zx48
		or	a
		jr	nz, no_explosion_48
		ld	a, e
		rlca
		rlca
		rlca
		and	0F8h ; 'ø'
		out	(0FEh),	a

no_explosion_48:
		pop	hl
		ld	bc, 6
		add	hl, bc
		jr	mv_explosion_lp

deactivatrParticle:
		pop	hl
		pop	hl
		ld	(hl), 0
		ld	bc, 6
		add	hl, bc
		jr	mv_explosion_lp

; ---------------------------------------------------------------------------
explosion_particles_Buf:
		ds 	100*6
; 		str_explosion_particle <0>
		db 0FFh

; str_explosion_particle	struc ;	(sizeof=0x6)
; inUse:	db ?
; x:		db ?
; y:		db ?
; dx:		db ?
; dy:		db ?
; color?:		db ?
; str_explosion_particle	ends


; =============== S U B	R O U T	I N E =======================================


clr_ExplosionParicles:
		ld	hl, explosion_particles_Buf
		ld	de, explosion_particles_Buf+1
		ld	bc, 100*6-1 	;599
		ld	(hl), 0
		ldir


;ESL debug - limit boom particles
; 		ld 	hl,explosion_particles_Buf+6*10
; 		ld 	(hl),0xff

		ret



