; ---------------------------------------------------------------------------
; SavageBigBio_TentacleHit - SAVAGEBIGBIO: if a live, non-flashing player's box touches a 16x16 tentacle segment at (x, y), flag that player and remember the hit point
; In:  8(a6) = player, $E(a6) = word player bit, $10(a6) = long *hit point, $16(a6) = word x, $1A(a6) = word y
; Out: none
; Evidence: -$3B06 |= bit; *hit = (x+8) | (y+8) << 16; called per segment by SavageBigBio_Draw for both players; TAS 33676-33915
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBigBio_TentacleHit:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$1A(a6),d6
	move.w	$16(a6),d7
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0BA85A
	tst.w	$6A(a4)
	bne.s	loc_0BA85A
	cmp.w	$5A(a4),d7
	bgt.s	loc_0BA85A
	ext.l	d7
	move.l	d7,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.w	$56(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	bgt.s	loc_0BA85A
	cmp.w	$58(a4),d6
	bgt.s	loc_0BA85A
	ext.l	d6
	move.l	d6,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.w	$54(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	bgt.s	loc_0BA85A
	move.w	$E(a6),d0
	or.w	d0,g_SceneVar3B06(a5)
	ext.l	d7
	move.l	d7,d0
	addq.l	#$8,d0
	ext.l	d6
	move.l	d6,d1
	addq.l	#$8,d1
	swap	d1
	clr.w	d1
	or.l	d0,d1
	movea.l	$10(a6),a0
	move.l	d1,(a0)
loc_0BA85A:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
