;original code - Rafaelle Cecco (c) 1987
;disassembled by Sergey Erokhin aka ESL - Nov-Dec 2014
;eslexolon@gmail.com
;https://bitbucket.org/esl/exolon-zx/
;licensed under a Creative Commons Attribution Share-Alike 3.0 (CC-BY-SA 3.0)

CheckGameRestart7890:

		ld	a, 0EFh
		in	a, (0FEh)
		and	1111b		; 7890
		ret	nz
		jp	START
