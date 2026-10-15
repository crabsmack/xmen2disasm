; ---------------------------------------------------------------------------
; BBoard_GetSize - BBoard (switch/trigger flag board): return the header size 8
; In:  none
; Out: d0 = 8
; Evidence: method 0 of class descriptor $1197CA ("BBOARD")
; ---------------------------------------------------------------------------
BBoard_GetSize:
	link.w	a6,#$0
	moveq	#$8,d0
	unlk	a6
	rts
