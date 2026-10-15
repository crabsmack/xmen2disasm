; ---------------------------------------------------------------------------
; CloneA5_AnimShockSprites - CloneA5: animate the two shockwave sprites while the boss shockwave is on
; In:  none
; Out: d0
; Evidence: only when -$3B0C bit 2 (BroodBoss_StateShockOn); alternates frames 1/2 by the counter -$33A2; Spr_SetFrame + Spr_UploadFrame on $FFCC6A/$FFCC7E
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_AnimShockSprites:
	link.w	a6,#$0
	movem.l	d3/d6-d7,-(a7)
	moveq	#$2,d0
	and.w	g_SceneVar3B0C(a5),d0
	beq.w	loc_0884C8
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_088470
	moveq	#$3,d0
	and.l	g_FrameCounter(a5),d0
	moveq	#$2,d1
	cmp.l	d0,d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_08844E
	moveq	#$1,d0
	bra.s	loc_088450
loc_08844E:
	moveq	#$2,d0
loc_088450:
	ext.w	d0
	move.w	d0,d6
	moveq	#$3,d0
	and.l	g_FrameCounter(a5),d0
	moveq	#$2,d1
	cmp.l	d0,d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_088468
	moveq	#$2,d0
	bra.s	loc_08846A
loc_088468:
	moveq	#$1,d0
loc_08846A:
	ext.w	d0
	move.w	d0,d7
	bra.s	loc_088494
loc_088470:
	moveq	#$1,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_08847C
	moveq	#$1,d0
	bra.s	loc_08847E
loc_08847C:
	moveq	#$2,d0
loc_08847E:
	ext.w	d0
	move.w	d0,d6
	moveq	#$1,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_08848E
	moveq	#$2,d0
	bra.s	loc_088490
loc_08848E:
	moveq	#$1,d0
loc_088490:
	ext.w	d0
	move.w	d0,d7
loc_088494:
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$20(a7),a7
loc_0884C8:
	movem.l	-$C(a6),d3/d6-d7
	unlk	a6
	rts
