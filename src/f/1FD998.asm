; ---------------------------------------------------------------------------
; sub_1FD998	[jt 2586]
; ---------------------------------------------------------------------------
sub_1FD998:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	clr.w	-$7C4(a5)
	move.w	#$4,-$3A04(a5)
	move.w	d7,-$7BC(a5)
	move.b	#$1,-$7BA(a5)
	tst.w	d7
	beq.s	loc_1FD9BE
	clr.b	-$7BA(a5)
loc_1FD9BE:
	move.w	$E(a6),-$7BE(a5)
	move.l	$10(a6),-$7C2(a5)
	move.l	-$7C2(a5),-(a7)
	move.w	-$7BC(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	sub_1FD77E(pc)
	move.b	#$1,-$3A02(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
