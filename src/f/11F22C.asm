; ---------------------------------------------------------------------------
; BioBalls_UpdateBox - BIOBALLS: set the collision box to the bounding box of all balls (+16 px)
; In:  8(a6) = this
; Out: none
; Evidence: box +$4C-$52; ball list from +$92 or $FFE768
; ---------------------------------------------------------------------------
BioBalls_UpdateBox:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$8(a3),d7
	asr.l	#$8,d7
	move.l	$C(a3),d6
	asr.l	#$8,d6
	tst.l	$92(a3)
	bne.s	loc_11F258
	tst.l	g_BioBallsList(a5)
	beq.w	loc_11F2E8
	move.l	g_BioBallsList(a5),$92(a3)
loc_11F258:
	move.w	d7,$4E(a3)
	move.w	d7,$52(a3)
	move.w	d6,$4C(a3)
	move.w	d6,$50(a3)
	movea.l	$92(a3),a0
	move.w	(a0),d6
	movea.l	a0,a4
	addq.w	#$2,a4
	clr.w	d7
	bra.s	loc_11F2DE
loc_11F276:
	tst.w	(a4)
	bge.s	loc_11F280
	tst.w	$2(a4)
	blt.s	loc_11F2E8
loc_11F280:
	move.w	(a4),d0
	cmp.w	$4E(a3),d0
	bge.s	loc_11F28C
	move.w	(a4),$4E(a3)
loc_11F28C:
	move.w	(a4),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	move.w	$52(a3),d2
	ext.l	d2
	cmp.l	d0,d2
	bge.s	loc_11F2A8
	move.w	(a4),d0
	add.w	#$10,d0
	move.w	d0,$52(a3)
loc_11F2A8:
	move.w	$2(a4),d0
	cmp.w	$4C(a3),d0
	bge.s	loc_11F2B8
	move.w	$2(a4),$4C(a3)
loc_11F2B8:
	move.w	$2(a4),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	move.w	$50(a3),d2
	ext.l	d2
	cmp.l	d0,d2
	bge.s	loc_11F2D8
	move.w	$2(a4),d0
	add.w	#$10,d0
	move.w	d0,$50(a3)
loc_11F2D8:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
loc_11F2DE:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	bgt.s	loc_11F276
loc_11F2E8:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
