;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

;NOT USED

; 		ld	hl, 8000h
; 		ld	(hl), 81h ; 'Å'
; 		ld	de, 8001h
; 		ld	bc, 101h
; 		ldir
; 		im	2
; 		ld	a, 80h ; 'Ä'
; 		ld	i, a
; 		ret


InitScrAddrTables:
		ld	b, 192
		ld	ix, Y2SCR_HI
		ld	iy, Y2SCR_LO
		ld	hl, SCRLINE000

mk_y2scr:
		ld	(ix+0),	h
		ld	(iy+0),	l
		inc	ix
		inc	iy
		call	NextScrLineAddr
		djnz	mk_y2scr
;
;table used in scroll highscore
;+8 - 8row on screen
		ld	b, 192
		ld	hl,  SCRLINE000+8
		ld	ix, scr_addr_8

loc_7C14:
		ld	(ix+0),	l
		ld	(ix+1),	h
		inc	ix
		inc	ix
		call	NextScrLineAddr
		djnz	loc_7C14

		ret
