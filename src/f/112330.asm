; ---------------------------------------------------------------------------
; Deathbird_Move_Done - Deathbird_Move common exit (kinds without movement)
; In:  inside Deathbird_Move
; Out: -
; Evidence: 2 branch sources; TAS 37300-45095
; ---------------------------------------------------------------------------
Deathbird_Move_Done:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
