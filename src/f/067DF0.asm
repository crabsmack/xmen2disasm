; ---------------------------------------------------------------------------
; BoxInputActor_OutsideActiveWindow - vtable +$42: a BOXINPUTACTOR is outside the active window
; In:  8(a6) = this (BOXINPUTACTOR object)
; Out: none
; Evidence: class descriptor BOXINPUTACTOR slot +$42 (tools/classes.py); TAS frames 2348-49093 (330 active)
; ---------------------------------------------------------------------------
BoxInputActor_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
