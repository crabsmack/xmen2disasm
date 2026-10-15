; ---------------------------------------------------------------------------
; BigAcolyte_OutsideActiveWindow - vtable +$42: a BIGACOLYTE is outside the active window
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$42 (tools/classes.py); TAS frames 13008-13659 (617 active)
; ---------------------------------------------------------------------------
BigAcolyte_OutsideActiveWindow:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_0103D6
	tst.w	$68(a4)
	ble.s	loc_0103D6
	moveq	#$0,d0
	bra.s	loc_0103E6
loc_0103D6:
	lea.l	sub_010B00(pc),a0
	cmpa.l	$5C(a4),a0
	seq.b	d3
	neg.b	d3
	seq.b	d0
	neg.b	d0
loc_0103E6:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
