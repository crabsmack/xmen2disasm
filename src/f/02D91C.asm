; ---------------------------------------------------------------------------
; sub_02D91C	[jt 197]
; ---------------------------------------------------------------------------
sub_02D91C:
	link.w	a6,#$FFE0
	movem.l	d6-d7/a3-a4,-(a7)
	lea.l	-$20(a6),a3
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.l	a4,-(a7)
	lea.l	$67A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$30(a6),d6-d7/a3-a4
	unlk	a6
	rts
