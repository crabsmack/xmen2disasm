; ---------------------------------------------------------------------------
; BigAcBullet_StateFly - BIGACBULLET flying state: on the first frame snap to owner + offset, then move with collision; kill itself on impact
; In:  8(a6) = this
; Out: none
; Evidence: Tile_TestAt(this, old x, old y, ..., $7800, 1) collision move; slot $52 Kill when it reports a hit
; ---------------------------------------------------------------------------
BigAcBullet_StateFly:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	tst.l	$8E(a4)
	beq.s	loc_01018C
	movea.l	$8E(a4),a0
	move.l	$92(a4),d0
	add.l	$8(a0),d0
	move.l	d0,$8(a4)
	move.l	$96(a4),d0
	add.l	$C(a0),d0
	move.l	d0,$C(a4)
	moveq	#$0,d0
	move.l	d0,$8E(a4)
loc_01018C:
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	g_SolidMapIsBg(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_0101C4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0101C4:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
