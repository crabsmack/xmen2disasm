; ---------------------------------------------------------------------------
; sub_04C526	[jt 347]
; ---------------------------------------------------------------------------
sub_04C526:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	jsr	sub_04C4F0(pc)
	lea.l	$3E72(a5),a0
	movea.l	$2(a0),a3
	lea.l	-$3920(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_04C542:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_04C542
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$9BA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C74(a5)
	pea.l	$4C582(pc)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$3B1C(a5)
	clr.w	-$3B08(a5)
	lea.l	$10(a7),a7
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
