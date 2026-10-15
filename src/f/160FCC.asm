; ---------------------------------------------------------------------------
; Cam_UnlockAxes - CAMERA slot +$3A: clear the x/y lock flags so tracking moves the camera again
; In:  8(a6) = this
; Out: none
; Evidence: +$4A &= ~3; tracking fns skip x when bit 1 and y when bit 2
; ---------------------------------------------------------------------------
Cam_UnlockAxes:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	andi.w	#$FFFC,$4A(a0)
	unlk	a6
	rts
