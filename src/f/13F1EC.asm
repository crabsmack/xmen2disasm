; ---------------------------------------------------------------------------
; Pop_FxBurstSmall - POP state, type 3: become a small explosion burst
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_BurstSmall(this)
; ---------------------------------------------------------------------------
Pop_FxBurstSmall:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_BurstSmall(pc)
	unlk	a6
	rts
