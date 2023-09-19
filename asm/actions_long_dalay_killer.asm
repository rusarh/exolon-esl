;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;LongDelayKiller executed after some time from level start
;they can't be destroyed and kill player when touched
;when started - placed at player Y and x =right border
;if touch left border - destroyed and restart after delay ....

chk_LongDelayKiller:
		ld	a, (flag_LongDelayKiller)
		or	a
		ret	nz

		ld	hl, (delay_to_killer)
		and	a
		ld	de, 700
		sbc	hl, de
		ret	c

		ld	de, (Player_X_Pos)
		ld	e, 120			; y=player Y
						; x=120
		ld	(xyLongDelayKiller), de

		ld	a, 1
		ld	(flag_LongDelayKiller), a
		ret

; ---------------------------------------------------------------------------
flag_LongDelayKiller:
		db 0
xyLongDelayKiller:
		dw 0
delay_to_killer:
		dw 0

; =============== S U B	R O U T	I N E =======================================


move_LongDelayKiller:
		ld	a, (flag_LongDelayKiller)
		or	a
		ret	z

		ld	de, (xyLongDelayKiller)
		ld	b, d
		ld	c, e

		ld	a, e
		or	a
		jr	z, destroyLongDelayKille

		cp	111
		jr	nc, no_ldk_tail

		call	RND
		cp	80h
		jr	c, no_ldk_tail

		push	de
		ld	a, e
		add	a, 6
		ld	e, a
		ld	a, d
		add	a, 4
		ld	d, a
		call	add_AnimatedParticle
		pop	de

no_ldk_tail:
		dec	e
		dec	e
		ld	(xyLongDelayKiller), de	; x-=2

		ld	a, sLongDelayKiller ; Fighter
		ld	hl, longDelayKillerSpriteBuf
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - saveSpriteArea
					;
		ld	c, 47h
		call	fillAttr_2x2

		ld	bc, 1008h
		call	chkPlayerInZone
		or	a
		ret	z

		push	de
		call	KillPlayer
		pop	bc

destroyLongDelayKille:
		ld	hl, longDelayKillerSpriteBuf
		xor	a
		ld	(flag_LongDelayKiller), a
		call	Sprite16x16

		jp	add_AfterLifeObject
