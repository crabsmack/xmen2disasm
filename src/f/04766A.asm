; ---------------------------------------------------------------------------
; unk_BaniMazaA2_04766A - BaniMazaA2 after the 12th destroyed bomb: spawn a root ACTOR at ($100,$100) with ExplodeFx_ChainRepeat, freeze the background sprite and set a fixed palette line 0
; In:  none
; Out: none
; Evidence: called by ApocBomb_Explode when the count -$3B0C reaches 12; ACTOR +$0E New; ExplodeFx_ChainRepeat(obj, jt $D62, 0, -16, -16, 3); 14 colours from jt $47284; -$3B0E = 1 stops BaniMazaA2_AnimSprite and the colour cycle. Visible effect not confirmed
; ---------------------------------------------------------------------------
unk_BaniMazaA2_04766A:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($100).w
	pea.l	($100).w
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0476C2
	lea.l	$B62(a5),a0
	movea.l	$2(a0),a4
	moveq	#$3,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	lea.l	$18(a7),a7
loc_0476C2:
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$992(a5),a0
	movea.l	$2(a0),a4
	moveq	#$0,d7
	moveq	#$E,d3
	lea.l	$10(a7),a7
loc_0476EA:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	move.w	(a4)+,(a0,d0.w)
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0476EA
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	#$1,-$3B0E(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
