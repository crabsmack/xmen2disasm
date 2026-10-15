; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Default - Deathbird_SetMoveMode out-of-range mode: movement kind 3
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: range check branch target
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Default:
	move.b	#$3,$AE(a4)
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
