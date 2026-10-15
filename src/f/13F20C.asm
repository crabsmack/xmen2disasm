; ---------------------------------------------------------------------------
; Pop_FxTrailArc - POP state, type 2: become an explosion trail
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_TrailArc(this)
; ---------------------------------------------------------------------------
Pop_FxTrailArc:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_TrailArc(pc)
	unlk	a6
	rts
