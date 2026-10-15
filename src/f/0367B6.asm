; ---------------------------------------------------------------------------
; MagnetoBoss_Return0V6E - MAGNETOBOSS descriptor slot +$6E (its own virtual, class derives from ACTOR): always returns 0
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: tools/classes.py MAGNETOBOSS +$6E; jt 244
; ---------------------------------------------------------------------------
MagnetoBoss_Return0V6E:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
