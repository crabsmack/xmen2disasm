; ---------------------------------------------------------------------------
; Pop_FxBounce - POP state, type 1: become bouncing explosion puffs
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_Bounce(this)
; ---------------------------------------------------------------------------
Pop_FxBounce:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	ExplodeFx_Bounce(pc)
	unlk	a6
	rts
