; ---------------------------------------------------------------------------
; sub_1F413E	[jt 2472]
; ---------------------------------------------------------------------------
sub_1F413E:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F415E
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_1F4164
loc_1F415E:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
loc_1F4164:
	movea.l	d0,a3
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$30,d1
	and.w	d0,d1
	move.w	d1,d7
	lsr.w	#$4,d7
	tst.w	d7
	beq.s	loc_1F41A6
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	move.l	$94(a4),$BC(a4)
	andi.w	#$FFBF,$C0(a4)
	movea.l	(a4),a0
	move.l	$AA(a0),$5C(a4)
	bra.s	loc_1F41B8
loc_1F41A6:
	lea.l	$2B92(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	move.l	$9E(a0),$5C(a4)
loc_1F41B8:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
