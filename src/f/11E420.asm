; ---------------------------------------------------------------------------
; BioBullet_OutsideActiveWindow - BioBullet: is the active object out of range and due to deactivate (class slot 15, +$42)
; In:  8(a6) = this
; Out: d0.b = 1 to deactivate
; Evidence: method 15 of class descriptor $11E6EC (name string "BIOBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
BioBullet_OutsideActiveWindow:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	g_DeactWinRight(a5),d7
	ble.s	loc_11E446
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E446:
	cmp.w	g_DeactWinLeft(a5),d7
	bge.s	loc_11E450
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E450:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,d7
	sub.w	g_CameraY(a5),d7
	cmp.w	g_DeactWinBottom(a5),d7
	ble.s	loc_11E466
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E466:
	cmp.w	g_DeactWinTop(a5),d7
	slt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_11E476:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
