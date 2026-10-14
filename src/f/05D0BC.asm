; ---------------------------------------------------------------------------
; sub_05D0BC	[jt 429]
; ---------------------------------------------------------------------------
sub_05D0BC:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a4,-(a7)
	move.l	$C(a6),d6
	move.l	$8(a6),d7
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	move.w	$12(a6),-$A(a6)
	clr.l	-$4(a6)
	clr.l	-$8(a6)
	pea.l	-$10(a6)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	lea.l	$DBA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	move.l	a4,d0
	movem.l	-$1C(a6),d6-d7/a4
	unlk	a6
	rts
