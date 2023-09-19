;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;use preshifted sprites
;20 particles
;each particle anumated thru following sprites, then disappear
; 6, 5, 5, 5, 4, 5, 3, 5, 4, 3, 6
; 3 - particle3
; 4 - particle4
; 5 - particle5 - Smalest
; 6 - particle6 - Empty?


add_AnimatedParticle:
		push	hl
		ld	hl, animatedParticles

apt_loop:
		bit	7, (hl)		;x
		jr	nz, apt_full

		inc	hl
		inc	hl
		ld	a, (hl)		;phase?
		or	a
		inc	hl
		jr	nz, apt_loop
		dec	hl
		ld	(hl), 10 	;phase?
		dec	hl
		ld	(hl), d 	;y
		dec	hl
		ld	(hl), e 	;x
apt_full:
		pop	hl
		ret

; =============== S U B	R O U T	I N E =======================================


move_AnimatedParticles:
		ld	hl, animatedParticles

animatedParticlesLoop:
		ld	e, (hl) 		;inUse
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, animatedParticlesLoop

		push	hl
		dec	hl
		dec	(hl)			;phase-=1
		ld	l, a
		ld	h, 0
		ld	bc,  particlesPhaseTable-1	; 6, 5,	5, 5, 4, 5, 3, 5, 4, 3,	6
		add	hl, bc
		inc	hl
		ld	a, (hl)
		call	Sprite8x8_XOR_Preshifted ; erase old ...
		dec	hl
		ld	a, (hl)
		call	Sprite8x8_XOR_Preshifted

		ld	a, r
		and	7
		or	42h ; 'B'
		ld	c, a
		call	fillAttr_1x1	;color
		pop	hl

		jr	animatedParticlesLoop

; ---------------------------------------------------------------------------

particlesPhaseTable:
		;   0  1  2  3  4  5  6  7  8  9  10
		db  6, 5, 5, 5,	4, 5, 3, 5, 4, 3, 6

animatedParticles:
		ds 	20*3
; 		strAnimatedParticles <0>
		db 0FFh

; strAnimatedParticles struc	; (sizeof=0x4)
; x:		db ?
; y:		db ?
; phase:	db ?
; strAnimatedParticles ends

; =============== S U B	R O U T	I N E =======================================


clr_AnimatedParticles:
		ld	hl, animatedParticles
		ld	de, animatedParticles+1
		ld	bc, 20*3-1 	;59
		ld	(hl), b
		ldir
;ESLDEBUG
;LIMIT particle size
; 		ld 	a,0xff
; 		ld 	(animatedParticles+3*2),a
;ESLDEBUG
		ret

