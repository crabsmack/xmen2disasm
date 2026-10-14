; ---------------------------------------------------------------------------
; sub_1077BA	[jt 1346]
; ---------------------------------------------------------------------------
sub_1077BA:
	link.w	a6,#$0
	tst.l	-$1CA6(a5)
	bne.s	loc_1077E4
	moveq	#$64,d0
	move.l	d0,-(a7)
	lea.l	$2EC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2EC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,-$1CA6(a5)
	addq.w	#$8,a7
loc_1077E4:
	pea.l	$1077FE(pc)
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$3BCE(a5)
	clr.b	-$3BCA(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
