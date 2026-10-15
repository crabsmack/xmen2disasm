; ---------------------------------------------------------------------------
; sub_0E99EC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E99EC:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	g_SpawnRecs(a5),a0
	lea.l	(a0),a4
	tst.b	$B(a6)
	beq.s	loc_0E9A2A
	moveq	#$0,d7
	bra.s	loc_0E9A1E
loc_0E9A04:
	lea.l	$2D9A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0E9A16
	ori.b	#$1,$4(a4)
loc_0E9A16:
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$E(a4),a4
loc_0E9A1E:
	move.w	g_SpawnRecCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_0E9A04
	bra.s	loc_0E9A52
loc_0E9A2A:
	moveq	#$0,d7
	bra.s	loc_0E9A48
loc_0E9A2E:
	lea.l	$2D9A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0E9A40
	andi.b	#$FE,$4(a4)
loc_0E9A40:
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$E(a4),a4
loc_0E9A48:
	move.w	g_SpawnRecCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_0E9A2E
loc_0E9A52:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
