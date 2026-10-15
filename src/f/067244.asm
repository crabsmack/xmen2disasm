; ---------------------------------------------------------------------------
; ScalingActor_OutsideActiveWindow - vtable +$42: a SCALINGACTOR is outside the active window
; In:  8(a6) = this (SCALINGACTOR object)
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$42 (tools/classes.py); TAS frames 2346-49093 (394 active)
; ---------------------------------------------------------------------------
ScalingActor_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
