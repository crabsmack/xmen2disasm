; ---------------------------------------------------------------------------
; BroodBossWall_Draw - BROODBOSSWALL Draw (ICANDY slot +$16): write +$42 stacked 32-px sprites straight into the sprite table
; In:  8(a6) = this
; Out: none
; Evidence: links entries in g_SpriteTable ($FFE226, link cursor $FFE21A), size byte $0F, tile from +$22 + frame*16, from y-$C0 down
; Found: jt 619
; ---------------------------------------------------------------------------
BroodBossWall_Draw:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d4
	moveq	#$10,d0
	sub.l	d0,d4
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d1
	move.l	d1,d6
	moveq	#$20,d1
	sub.l	d1,d6
	moveq	#$0,d2
	move.b	$1D(a4),d2
	lsl.l	#$4,d2
	move.w	d2,d5
	add.w	$22(a4),d5
	moveq	#$3,d2
	and.b	$1C(a4),d2
	moveq	#$0,d3
	move.b	d2,d3
	moveq	#$D,d2
	lsl.l	d2,d3
	or.w	d3,d5
	subi.w	#$A0,d6
	clr.w	d7
	bra.s	loc_0861E0
loc_086190:
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$F,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	d5,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
	addi.w	#$20,d6
	move.w	d7,d0
	addq.w	#$1,d7
loc_0861E0:
	move.b	$42(a4),d0
	ext.w	d0
	cmp.w	d7,d0
	bgt.s	loc_086190
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
