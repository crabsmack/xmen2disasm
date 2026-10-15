; ---------------------------------------------------------------------------
; sub_1F9E46	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F9E46:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	tst.l	-$38CA(a5)
	beq.w	loc_1F9F04
	move.w	-$38D0(a5),d0
	subq.w	#$1,-$38D0(a5)
	cmpi.w	#$1,d0
	bge.w	loc_1F9F04
	tst.l	-$38CE(a5)
	bne.s	loc_1F9E76
	move.l	-$38CA(a5),d0
	addq.l	#$4,d0
	move.l	d0,-$38CE(a5)
loc_1F9E76:
	movea.l	-$38CE(a5),a0
	moveq	#-$1,d0
	cmp.w	(a0),d0
	bne.s	loc_1F9E8A
	move.l	-$38CA(a5),d0
	addq.l	#$4,d0
	move.l	d0,-$38CE(a5)
loc_1F9E8A:
	movea.l	-$38CE(a5),a0
	moveq	#-$2,d0
	cmp.w	(a0),d0
	bne.s	loc_1F9E9C
	moveq	#$0,d0
	move.l	d0,-$38CA(a5)
	bra.s	loc_1F9F04
loc_1F9E9C:
	tst.b	g_PalFadeActive(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,g_PalBaseDirty(a5)
	movea.l	-$38CA(a5),a0
	move.b	$2(a0),d0
	ext.w	d0
	move.w	d0,d7
	bra.s	loc_1F9ECE
loc_1F9EB6:
	movea.l	-$38CE(a5),a0
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a1
	move.w	(a0),(a1,d0.w)
	addq.l	#$2,-$38CE(a5)
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F9ECE:
	movea.l	-$38CA(a5),a0
	move.b	$3(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	bge.s	loc_1F9EB6
	movea.l	-$38CE(a5),a0
	cmpi.w	#$1000,(a0)
	blt.s	loc_1F9EF6
	move.w	#$3FF,d0
	and.w	(a0),d0
	move.w	d0,-$38D0(a5)
	addq.l	#$2,-$38CE(a5)
	bra.s	loc_1F9F04
loc_1F9EF6:
	movea.l	-$38CA(a5),a0
	move.b	$1(a0),d0
	ext.w	d0
	move.w	d0,-$38D0(a5)
loc_1F9F04:
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
