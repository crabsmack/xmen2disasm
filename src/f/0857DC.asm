; ---------------------------------------------------------------------------
; sub_0857DC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0857DC:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d7
loc_0857EA:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0857FA
	lea.l	-$1758(a5),a4
	move.l	a4,d0
	bra.s	loc_085800
loc_0857FA:
	lea.l	-$1848(a5),a4
	move.l	a4,d0
loc_085800:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_085826
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
loc_085826:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_0857EA
	tst.w	$6E(a3)
	bne.s	loc_085846
	clr.w	$6C(a3)
	lea.l	sub_085850(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_085846:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
