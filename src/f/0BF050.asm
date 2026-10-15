; ---------------------------------------------------------------------------
; sub_0BF050	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BF050:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	-$3C28(a5),a4
	move.w	-$3C22(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	move.w	$6(a0,d0.w),d0
	ext.l	d0
	move.l	#$8000,d4
	or.l	d0,d4
	tst.w	$E(a4)
	beq.s	loc_0BF086
	addi.w	#$C,d4
loc_0BF086:
	ori.w	#$6000,d4
	clr.w	d7
	bra.s	loc_0BF0EE
loc_0BF08E:
	move.w	$4(a4),d5
	sub.w	g_CameraX(a5),d5
	move.w	$6(a4),d6
	sub.w	g_CameraY(a5),d6
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
	add.w	#$68,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$E,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	d4,$4(a0)
	move.w	d5,d0
	add.w	#$70,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$26(a4),a4
loc_0BF0EE:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$3C24(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_0BF08E
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
