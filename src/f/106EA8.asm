; ---------------------------------------------------------------------------
; sub_106EA8	[jt 1342]
; ---------------------------------------------------------------------------
sub_106EA8:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$76(a0),a4
	move.w	$8(a4),d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d4
	sub.l	d1,d4
	move.w	$A(a4),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$C(a4),d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$E(a4),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	d4,d6
	bge.s	loc_106F06
	move.w	d4,-$2(a6)
	move.w	d6,d4
	move.w	-$2(a6),d6
loc_106F06:
	cmp.w	d5,d7
	bge.s	loc_106F14
	move.w	d5,-$2(a6)
	move.w	d7,d5
	move.w	-$2(a6),d7
loc_106F14:
	moveq	#$0,d3
	cmp.w	-$35C2(a5),d4
	bgt.s	loc_106F30
	cmp.w	-$35C0(a5),d6
	blt.s	loc_106F30
	cmp.w	-$35C6(a5),d5
	bgt.s	loc_106F30
	cmp.w	-$35C4(a5),d7
	blt.s	loc_106F30
	moveq	#$1,d3
loc_106F30:
	tst.b	d3
	seq.b	d3
	neg.b	d3
	move.b	d3,d0
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
