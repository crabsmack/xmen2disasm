; ---------------------------------------------------------------------------
; GaussBullet_GetSize - GaussBullet: return object size $20
; In:  none
; Out: d0 = $20
; Evidence: method 0 of class descriptor $118D32 ("GAUSSBULLET", 2 methods, no parent)
; ---------------------------------------------------------------------------
GaussBullet_GetSize:
	link.w	a6,#$0
	moveq	#$20,d0
	unlk	a6
	rts
