;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

addTeleportParticle:
		ld	hl, teleportParticles

tp_loop:
		bit	7, (hl)
		ret	nz
		inc	hl
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	nz, tp_loop

		dec	hl
 		ld	(hl), 20 	;duration frames
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e
		ret

; =============== S U B	R O U T	I N E =======================================


move_TeleportParticles:

		ld	hl, teleportParticles

mtp_loop:
		ld	e, (hl)
		bit	7, e
		ret	nz

		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, mtp_loop

		dec	hl
		dec	(hl)		; dec lifetime?
		inc	hl

		call	RND
		and	3
		add	a, e
		ld	e, a		; x+=rnd(8)

		call	RND
		and	0Fh
		add	a, d
		ld	d, a		; y+=rnd(16)

		call	add_AnimatedParticle

		jr	mtp_loop

; ---------------------------------------------------------------------------
teleportParticles:
		ds 	4*3
; 		strXYF <0>
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


clr_TeleportParticles:
		ld	hl, teleportParticles
		ld	de, teleportParticles+1
		ld	bc, 4*3-1 		;11
		ld	(hl), b
		ldir
		ret
