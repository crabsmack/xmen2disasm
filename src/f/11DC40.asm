; ---------------------------------------------------------------------------
; WallCrawlBio_ActStopFrame0 - WALLCRAWLBIO script action: stop, frame 0, next entry after +$BE
; In:  8(a6) = this
; Out: none
; Evidence: vtable +$56 SetFrame(0)
; ---------------------------------------------------------------------------
WallCrawlBio_ActStopFrame0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_11DC80
	move.l	$64(a4),$5C(a4)
	move.w	$BE(a4),$6C(a4)
	bra.s	loc_11DCAE
loc_11DC80:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11DC94
	clr.w	$96(a4)
loc_11DC94:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	$BE(a4),$6C(a4)
loc_11DCAE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
