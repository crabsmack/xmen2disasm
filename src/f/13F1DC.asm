; ---------------------------------------------------------------------------
; Pop_FxBurstMedium - POP state, type 0: become a medium explosion burst
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_BurstMedium(this)
; ---------------------------------------------------------------------------
Pop_FxBurstMedium:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_BurstMedium(pc)
	unlk	a6
	rts
