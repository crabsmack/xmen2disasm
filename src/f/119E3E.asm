; ---------------------------------------------------------------------------
; SyncActor_OutsideActiveWindow - always returns 0: a synchronized actor never deactivates on its own (class slot 15, +$42)
; In:  8(a6) = this
; Out: d0.b = 0
; Evidence: body = moveq #0,d0; method 15 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
