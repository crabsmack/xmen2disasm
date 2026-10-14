; ---------------------------------------------------------------------------
; sub_13891A	[jt 1821]
; ---------------------------------------------------------------------------
sub_13891A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$8C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	pea.l	($3E9).w
	jsr	sub_138766(pc)
	move.l	a4,-(a7)
	lea.l	$391A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
