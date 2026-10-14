; ---------------------------------------------------------------------------
; sub_0179F8	[jt 97]
; ---------------------------------------------------------------------------
sub_0179F8:
	link.w	a6,#$FFFC
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$A4(a3),a4
	lea.l	$94(a3),a0
	move.l	a0,-$4(a6)
	moveq	#$10,d0
	and.b	$2E(a3),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_017A20
	moveq	#$3,d0
	bra.s	loc_017A22
loc_017A20:
	moveq	#-$3,d0
loc_017A22:
	lsl.l	#$8,d0
	add.l	$8(a3),d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	add.l	#$FFFFE000,d0
	move.l	d0,$4(a4)
	movea.l	-$4(a6),a0
	move.l	(a0),d0
	sub.l	(a4),d0
	asr.l	#$4,d0
	move.w	d0,$8(a4)
	movea.l	-$4(a6),a0
	move.l	$4(a0),d0
	sub.l	$4(a4),d0
	asr.l	#$4,d0
	move.w	d0,$A(a4)
	clr.w	$C(a4)
	move.w	#$4,$E(a4)
	ori.w	#$4,$92(a3)
	movem.l	-$10(a6),d3/a3-a4
	unlk	a6
	rts
