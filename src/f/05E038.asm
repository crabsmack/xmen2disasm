; ---------------------------------------------------------------------------
; Tuskette_Init_part6 - part 6 of Tuskette_Init: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tuskette_Init
; Out: continues in Tuskette_Init
; Evidence: only reached by branches from Tuskette_Init; ends with rts
; ---------------------------------------------------------------------------
Tuskette_Init_part6:
	lea.l	Tuskette_StateRestIdle(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
