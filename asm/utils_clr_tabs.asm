;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

clr_no_walk_tab:
		ld	hl, no_walk_tab
		ld	de,  no_walk_tab+1
		ld	bc, 703
		ld	(hl), 0
		ldir
		ret

clr_over_player_tab:
		ld	hl, over_player_tab
		ld	de,  over_player_tab+1
		ld	bc, 703
		ld	(hl), 0FFh
		ldir
		ret

_save_attr_table:
		ld	de, ATTR_TABLE_COPY
		ld	hl, ATTR_TABLE
		ld	bc, 768
		ldir
		ret
