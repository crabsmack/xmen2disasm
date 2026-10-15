; ---------------------------------------------------------------------------
; sub_1FA99C	[jt 2565]
; ---------------------------------------------------------------------------
sub_1FA99C:
	link.w	a6,#$0
	moveq	#$51,d0
	cmp.w	-$1FDE(a5),d0
	beq.s	loc_1FA9BC
	move.b	-$1FDD(a5),d0
	addq.b	#$1,d0
	move.w	-$1FDE(a5),d1
	asl.w	#$3,d1
	lea.l	g_SpriteTable(a5),a0
	move.b	d0,$3(a0,d1.w)
loc_1FA9BC:
	move.w	#$51,-$1FE2(a5)
	lea.l	g_SpriteTable(a5),a0
	lea.l	$288(a0),a0
	move.l	a0,-$1FE6(a5)
	unlk	a6
	rts
