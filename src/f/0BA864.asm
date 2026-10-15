; ---------------------------------------------------------------------------
; SavageBigBio_Update - vtable +$4A: parent update, then damage the players the tentacle touched this frame (TakeDamage(0, 8, 1, hit point))
; Evidence: g_SceneVar3B06 bits 1/2 with hit points g_SceneVar3B18/g_SceneVar3B1C (SavageBigBio_TentacleHit); TAS 33665-34355
; ---------------------------------------------------------------------------
SavageBigBio_Update:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	move.w	g_SceneVar3B06(a5),d0
	btst	#$0,d0
	addq.w	#$4,a7
	beq.s	loc_0BA8BE
	move.l	g_SceneVar3B18(a5),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	#$FFFF,d0
	and.l	g_SceneVar3B18(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0BA8BE:
	moveq	#$2,d0
	and.w	g_SceneVar3B06(a5),d0
	beq.s	loc_0BA8F6
	move.l	g_SceneVar3B1C(a5),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	#$FFFF,d0
	and.l	g_SceneVar3B1C(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
loc_0BA8F6:
	unlk	a6
	rts
