; ---------------------------------------------------------------------------
; sub_08594C	[jt 608]
; ---------------------------------------------------------------------------
sub_08594C:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$8(a6),a3
	movea.l	$14(a6),a4
	move.l	a4,d0
	bne.s	loc_08597C
	lea.l	-$10(a6),a4
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a4)
loc_08597C:
	move.l	a4,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	lea.l	$14E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a4),$10(a3)
	move.w	$4(a4),$12(a3)
	clr.l	$8C(a3)
	movem.l	-$20(a6),d6-d7/a3-a4
	unlk	a6
	rts
