; ---------------------------------------------------------------------------
; BaniMazaA1_AnimateBlocks - step the three BaniMazaA1 block animations (8 frames, every 6 frames, direction per group)
; In:  none
; Out: none
; Evidence: timers g_BmA1BlockTimer0/g_BmA1BlockTimer1/g_BmA1BlockTimer2, frames g_BmA1BlockFrame0/g_BmA1BlockFrame1/g_BmA1BlockFrame2, reverse flags bytes g_DiscBandReverse/-$3C97/-$3C96; BaniMazaA1_UploadBlockTiles on slots g_SceneSprites, -$3546, -$34F6
; ---------------------------------------------------------------------------
BaniMazaA1_AnimateBlocks:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	g_DiscBandReverse(a5),a4
	tst.w	g_BmA1BlockTimer0(a5)
	bne.s	loc_03891E
	move.w	#$6,g_BmA1BlockTimer0(a5)
	tst.w	g_BmA1BlockFrame0(a5)
	bne.s	loc_0388F6
	move.w	#$8,g_BmA1BlockFrame0(a5)
loc_0388F6:
	subq.w	#$1,g_BmA1BlockFrame0(a5)
	tst.b	(a4)
	beq.s	loc_03890A
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame0(a5),d0
	moveq	#$7,d1
	sub.l	d0,d1
	bra.s	loc_038912
loc_03890A:
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame0(a5),d0
	move.l	d0,d1
loc_038912:
	move.l	d1,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	BaniMazaA1_UploadBlockTiles(pc)
	addq.w	#$8,a7
loc_03891E:
	subq.w	#$1,g_BmA1BlockTimer0(a5)
	tst.w	g_BmA1BlockTimer1(a5)
	bne.s	loc_038964
	move.w	#$6,g_BmA1BlockTimer1(a5)
	tst.w	g_BmA1BlockFrame1(a5)
	bne.s	loc_03893A
	move.w	#$8,g_BmA1BlockFrame1(a5)
loc_03893A:
	subq.w	#$1,g_BmA1BlockFrame1(a5)
	tst.b	$1(a4)
	beq.s	loc_038950
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame1(a5),d0
	moveq	#$7,d1
	sub.l	d0,d1
	bra.s	loc_038958
loc_038950:
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame1(a5),d0
	move.l	d0,d1
loc_038958:
	move.l	d1,-(a7)
	pea.l	g_SceneSprites+$50(a5)
	jsr	BaniMazaA1_UploadBlockTiles(pc)
	addq.w	#$8,a7
loc_038964:
	subq.w	#$1,g_BmA1BlockTimer1(a5)
	tst.w	g_BmA1BlockTimer2(a5)
	bne.s	loc_0389AA
	move.w	#$6,g_BmA1BlockTimer2(a5)
	tst.w	g_BmA1BlockFrame2(a5)
	bne.s	loc_038980
	move.w	#$8,g_BmA1BlockFrame2(a5)
loc_038980:
	subq.w	#$1,g_BmA1BlockFrame2(a5)
	tst.b	$2(a4)
	beq.s	loc_038996
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame2(a5),d0
	moveq	#$7,d1
	sub.l	d0,d1
	bra.s	loc_03899E
loc_038996:
	moveq	#$0,d0
	move.w	g_BmA1BlockFrame2(a5),d0
	move.l	d0,d1
loc_03899E:
	move.l	d1,-(a7)
	pea.l	g_SceneSprites+$A0(a5)
	jsr	BaniMazaA1_UploadBlockTiles(pc)
	addq.w	#$8,a7
loc_0389AA:
	subq.w	#$1,g_BmA1BlockTimer2(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
