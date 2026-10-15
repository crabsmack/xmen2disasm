; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Default
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Default:
	move.b	#$3,$AE(a4)
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
