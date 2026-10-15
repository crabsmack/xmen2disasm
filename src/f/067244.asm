; ---------------------------------------------------------------------------
; ScalingActor_OutsideActiveWindow - SCALINGACTOR vtable +$42 override: always 0, so a SCALINGACTOR never counts as outside the active window (ACTOR's version tests the screen bounds)
; In:  8(a6) = this (unused)
; Out: d0 = 0
; Evidence: class descriptor SCALINGACTOR slot +$42 (tools/classes.py); body moveq #0,d0; Actor_OutsideActiveWindow returns 1 when off-window; TAS 2346-49093
; ---------------------------------------------------------------------------
ScalingActor_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
