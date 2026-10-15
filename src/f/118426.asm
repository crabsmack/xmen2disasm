; ---------------------------------------------------------------------------
; ICandy_GetSize - ICandy (non-actor eye-candy sprite): return object size $42
; In:  none
; Out: d0 = $42
; Evidence: method 0 of class descriptor $1188AC ("ICANDY", no parent)
; ---------------------------------------------------------------------------
ICandy_GetSize:
	link.w	a6,#$0
	moveq	#$42,d0
	unlk	a6
	rts
