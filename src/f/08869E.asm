; ---------------------------------------------------------------------------
; sub_08869E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_08869E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	pea.l	sub_08867C(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,-$35B6(a5)
	movea.l	d0,a4
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.s	loc_088722
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_088722
	clr.w	-$3C4E(a5)
	move.w	#$7D8,-$3AC2(a5)
	move.w	#$7F0,$30(a4)
	move.w	#$598,$32(a4)
	move.l	a4,-(a7)
	movea.l	$C(a4),a0
	jsr	(a0)
	move.w	$32(a4),$34(a4)
	move.w	$30(a4),$36(a4)
	addq.w	#$4,a7
loc_088722:
	ori.w	#$1,-$3C4E(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
