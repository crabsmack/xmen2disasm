; ---------------------------------------------------------------------------
; Cam_EndLookUp - CAMERA slot +$2E: release look-up (the step function then eases back)
; In:  8(a6) = this
; Out: none
; Evidence: +$4A &= ~4
; ---------------------------------------------------------------------------
Cam_EndLookUp:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	andi.w	#$FFFB,$4A(a0)
	unlk	a6
	rts
