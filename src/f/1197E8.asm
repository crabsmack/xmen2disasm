; ---------------------------------------------------------------------------
; Synchronizer_GetSize - Synchronizer: return object size $3A
; In:  none
; Out: d0 = $3A
; Evidence: method 0 of class descriptor $119CFE ("SYNCHRONIZER")
; ---------------------------------------------------------------------------
Synchronizer_GetSize:
	link.w	a6,#$0
	moveq	#$3A,d0
	unlk	a6
	rts
