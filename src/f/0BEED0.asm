; ---------------------------------------------------------------------------
; sub_0BEED0
; ---------------------------------------------------------------------------
sub_0BEED0:
	link.w	a6,#$0
	move.w	-$3C24(a5),d0
	subq.w	#$1,-$3C24(a5)
	tst.w	-$3C24(a5)
	ble.s	loc_0BEF0E
	moveq	#$26,d0
	move.l	d0,-(a7)
	move.w	-$3C24(a5),d1
	ext.l	d1
	movea.l	-$3C28(a5),a0
	move.l	d1,d2
	mulu.w	#$26,d1
	swap	d2
	mulu.w	#$26,d2
	swap	d2
	clr.w	d2
	add.l	d2,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> sub_1F48AA
loc_0BEF0E:
	unlk	a6
	rts
