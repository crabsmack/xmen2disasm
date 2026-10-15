; ---------------------------------------------------------------------------
; SavageA2_AnimLights - SavageA2: step the two light sprites through their 32-entry frame tables
; In:  none
; Out: none
; Evidence: counter -$3B3C counts down from $20; frames from Tbl_SavageA2LightFrames1/2 minus 1; Spr_SetFrame + Spr_UploadFrame; jt 892; TAS 30901-33097
; Found: jt 892
; ---------------------------------------------------------------------------
SavageA2_AnimLights:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	lea.l	Tbl_SavageA2LightFrames1(pc),a3
	lea.l	Tbl_SavageA2LightFrames2(pc),a4
	tst.w	g_SceneVar3B34(a5)
	bne.s	loc_0AD4FE
	move.w	#$1,g_SceneVar3B34(a5)
	tst.w	g_SceneVar3B3C(a5)
	bne.s	loc_0AD4AE
	move.w	#$20,g_SceneVar3B3C(a5)
loc_0AD4AE:
	subq.w	#$1,g_SceneVar3B3C(a5)
	move.w	g_SceneVar3B3C(a5),d0
	move.b	(a3,d0.w),d0
	ext.w	d0
	subq.w	#$1,d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	g_SceneVar3B3C(a5),d0
	move.b	(a4,d0.w),d0
	ext.w	d0
	subq.w	#$1,d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$20(a7),a7
loc_0AD4FE:
	subq.w	#$1,g_SceneVar3B34(a5)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
