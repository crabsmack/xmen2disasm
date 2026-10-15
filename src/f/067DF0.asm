; ---------------------------------------------------------------------------
; BoxInputActor_OutsideActiveWindow - vtable +$42 override: always 0, a BOXINPUTACTOR never counts as outside the active window
; In:  8(a6) = this (BOXINPUTACTOR object)
; Out: d0 = 0
; Evidence: body is moveq #0,d0 only; ACTOR's version (Actor_OutsideActiveWindow) returns 1 when off-window; class descriptor BOXINPUTACTOR slot +$42 (tools/classes.py); TAS frames 2348-49093
; ---------------------------------------------------------------------------
BoxInputActor_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
