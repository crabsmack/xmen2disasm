; ---------------------------------------------------------------------------
; sub_087748	[jt 640]
; ---------------------------------------------------------------------------
sub_087748:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.w	$6(a4),d0
	beq.s	loc_087786
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$10,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
loc_087786:
	movea.l	$96(a4),a0
	move.w	#$200,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	tst.l	$9E(a4)
	beq.s	loc_0877B8
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	sub_085BE8(pc)
	addq.w	#$8,a7
loc_0877B8:
	clr.w	$6C(a4)
	lea.l	sub_0877D2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
