; ---------------------------------------------------------------------------
; sub_0946BA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0946BA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	cmp.w	-$3C3C(a5),d0
	bgt.s	loc_094714
	move.l	g_Camera(a5),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	jsr	$18EA(a5)	; -> sub_099016
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0946F6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_094726
loc_0946F6:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_094726
loc_094714:
	clr.w	$6C(a4)
	lea.l	sub_0946BA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_094726:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
