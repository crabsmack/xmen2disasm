; ---------------------------------------------------------------------------
; ScalingActor_Move - vtable +$4E: per-frame movement of a SCALINGACTOR
; In:  8(a6) = this (SCALINGACTOR object)
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$4E (tools/classes.py); TAS frames 2346-49093 (397 active)
; ---------------------------------------------------------------------------
ScalingActor_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
