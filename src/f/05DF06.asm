; ---------------------------------------------------------------------------
; Tuskette_Init_part1 - part 1 of Tuskette_Init: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tuskette_Init
; Out: continues in Tuskette_Init
; Evidence: only reached by branches from Tuskette_Init
; ---------------------------------------------------------------------------
Tuskette_Init_part1:
	lea.l	Tuskette_StatePatrolStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
