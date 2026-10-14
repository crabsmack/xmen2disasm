; ---------------------------------------------------------------------------
; sub_15AD8A	[jt 2015]
; ---------------------------------------------------------------------------
sub_15AD8A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$10(a6),a4
	tst.w	$A(a6)
	bne.s	loc_15ADE2
	movea.l	$14(a6),a0
	andi.w	#$FFF7,(a0)
	ori.w	#$100,$4(a4)
	lea.l	-$1758(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15ADB8
	lea.l	-$1848(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_15ADDE
loc_15ADB8:
	tst.w	$6A(a4)
	bne.s	loc_15ADDE
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_15ADDE:
	moveq	#$0,d0
	bra.s	loc_15ADE4
loc_15ADE2:
	moveq	#$0,d0
loc_15ADE4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
