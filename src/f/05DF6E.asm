; ---------------------------------------------------------------------------
; Tuskette_Init_part4 - part 4 of Tuskette_Init: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tuskette_Init
; Out: continues in Tuskette_Init
; Evidence: only reached by branches from Tuskette_Init
; ---------------------------------------------------------------------------
Tuskette_Init_part4:
	ori.w	#$4000,$6(a4)
	lea.l	Tuskette_StateRestIdle(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
