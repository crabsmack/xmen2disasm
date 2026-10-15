; ---------------------------------------------------------------------------
; BoxInputActor_Move - no movement: just zero the velocity and acceleration (BOXINPUTACTOR override of slot +$4E Move)
; In:  8(a6) = this (BOXINPUTACTOR object)
; Out: none
; Evidence: class descriptor BOXINPUTACTOR slot +$4E (tools/classes.py); TAS frames 2348-49093 (332 active)
; ---------------------------------------------------------------------------
BoxInputActor_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
