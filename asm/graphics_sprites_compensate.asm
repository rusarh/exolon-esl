;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

CompensateSprites8x8preshifted:

		ld	a, (Sprites8x8_OnScreen_count)
		cp	16
		ret	nc
		ld	b, a
		ld	a, 16
		sub	b
		ld	b, a
		ld	a, 6		; 6 - Boom5 - Empty?

loc_9E92:
		call	Sprite8x8_XOR_Preshifted
		djnz	loc_9E92
		ret

; ---------------------------------------------------------------------------
Sprites8x8_OnScreen_count:db 0

CompensateSprites16x16:

		ld	a, (Sprites16x16_OnScreen_count)
		cp	6
		ret	nc

		ld	b, a
		ld	a, 6
		sub	b
		ld	b, a
		if FIX_SPRITE16x16COM = 1
		ld 	hl, SPR_COMP
		else
 		ld	hl, byte_B101
		endif

		xor	a

		if FIX_SPRITE16x16COM = 1
		ld 	de,0
		endif
loc_9EA8:
		call	Sprite16x16	; A sprId (00..45)
					; D - Y	(0..192)?
					; E - X	(0..255)
					; HL - saveSpriteArea
					;
		djnz	loc_9EA8
		ret

; ---------------------------------------------------------------------------
Sprites16x16_OnScreen_count:db	0
