; ---------------------------------------------------------------------------
; XNpc_Query7A - XNpc: XNPC hook (class slot 29, +$7A): base writes 2 to *arg3 and returns 0; meaning unknown
; In:  8(a6) = this  $C(a6) = ?  $10(a6) = byte* out
; Out: d0
; Evidence: method 29 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_Query7A:
	link.w	a6,#$0
	movea.l	$10(a6),a0
	move.b	#$2,(a0)
	moveq	#$0,d0
	unlk	a6
	rts
