; ---------------------------------------------------------------------------
; sub_0AD486	[jt 892]
; ---------------------------------------------------------------------------
sub_0AD486:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	lea.l	$AD52E(pc),a3
	lea.l	$AD50C(pc),a4
	tst.w	-$3B34(a5)
	bne.s	loc_0AD4FE
	move.w	#$1,-$3B34(a5)
	tst.w	-$3B3C(a5)
	bne.s	loc_0AD4AE
	move.w	#$20,-$3B3C(a5)
loc_0AD4AE:
	subq.w	#$1,-$3B3C(a5)
	move.w	-$3B3C(a5),d0
	move.b	(a3,d0.w),d0
	ext.w	d0
	subq.w	#$1,d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> sub_1FAD44
	move.w	-$3B3C(a5),d0
	move.b	(a4,d0.w),d0
	ext.w	d0
	subq.w	#$1,d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$5062(a5)	; -> sub_1FAD44
	lea.l	$20(a7),a7
loc_0AD4FE:
	subq.w	#$1,-$3B34(a5)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
