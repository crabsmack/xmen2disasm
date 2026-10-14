; ---------------------------------------------------------------------------
; sub_117B44	[jt 1448]
; ---------------------------------------------------------------------------
sub_117B44:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$C(a6),a4
	move.w	$68(a4),d6
	move.w	#$300,d7
	move.l	a4,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2DB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	cmp.w	d6,d7
	bge.s	loc_117B78
	move.w	d7,$68(a4)
loc_117B78:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
