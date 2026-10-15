; ---------------------------------------------------------------------------
; Synchronizer_Free - Synchronizer: mark the pool slot unused (+$38 = 0)
; In:  8(a6) = this
; Out: none
; Evidence: method 7 of SYNCHRONIZER; Synchronizer_New tests +$38 bit 0
; ---------------------------------------------------------------------------
Synchronizer_Free:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	clr.b	$38(a0)
	unlk	a6
	rts
