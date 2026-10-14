; ---------------------------------------------------------------------------
; sub_0061D0	[jt 4]
; ---------------------------------------------------------------------------
sub_0061D0:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d7
	move.l	a4,d0
	beq.s	loc_006236
	lea.l	$2B9A(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_0061EE
	clr.w	d7
loc_0061EE:
	lea.l	$2BCA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_0061FA
	moveq	#$1,d7
loc_0061FA:
	lea.l	$2BC2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006206
	moveq	#$2,d7
loc_006206:
	lea.l	$2BA2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006212
	moveq	#$3,d7
loc_006212:
	lea.l	$2BAA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_00621E
	moveq	#$4,d7
loc_00621E:
	lea.l	$2BB2(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_00622A
	moveq	#$5,d7
loc_00622A:
	lea.l	$2BBA(a5),a0
	cmpa.l	$2(a0),a4
	bne.s	loc_006236
	moveq	#$6,d7
loc_006236:
	move.w	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
