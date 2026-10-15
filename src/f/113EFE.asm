; ---------------------------------------------------------------------------
; XNpc_EndHurt - leave the hurt state: clear flags $1000/$4000 (+6) and the hurt bit (+4 bit 2), restore the state saved in +$60 into +$5C, zero the +$6C delay (XNPC base of slot 28, +$76)
; In:  8(a6) = this
; Out: none
; Evidence: method 28 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_EndHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$EFFF,$6(a4)
	andi.w	#$BFFF,$6(a4)
	tst.l	$60(a4)
	beq.s	loc_113F26
	move.l	$60(a4),$5C(a4)
	moveq	#$0,d0
	move.l	d0,$60(a4)
loc_113F26:
	andi.w	#$FFFB,$4(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
