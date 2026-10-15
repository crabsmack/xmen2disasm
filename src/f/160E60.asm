; ---------------------------------------------------------------------------
; Cam_EndLookDown - CAMERA slot +$32: release look-down (the step function then eases back)
; In:  8(a6) = this
; Out: none
; Evidence: +$4A &= ~8
; ---------------------------------------------------------------------------
Cam_EndLookDown:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	andi.w	#$FFF7,$4A(a0)
	unlk	a6
	rts
