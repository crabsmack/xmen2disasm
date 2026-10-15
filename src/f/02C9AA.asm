; ---------------------------------------------------------------------------
; AvalonA3_FrameHook - AvalonA3 per-frame hook: frame counter, cycle four 3-frame sprite slots every 5 frames, run the palette effect
; In:  none
; Out: none
; Evidence: installed in -$388E by AvalonA3_InstallHooks; Spr_SetFrame/Spr_UploadFrame on slots -$3582,-$356E,-$355A,-$3546 (frames 2-4 / 6-8); AvalonA3_PsiFlashStep unless g_PalFadeActive
; ---------------------------------------------------------------------------
AvalonA3_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B06(a5),d0
	subq.w	#$1,-$3B06(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_02C9D4
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B06(a5),d0
	subq.w	#$1,-$3B06(a5)
loc_02C9D4:
	tst.w	-$3CBC(a5)
	bne.s	loc_02CA12
	move.w	#$5,-$3CBC(a5)
	tst.w	-$3CBE(a5)
	bne.s	loc_02C9EC
	move.w	#$3,-$3CBE(a5)
loc_02C9EC:
	subq.w	#$1,-$3CBE(a5)
	move.w	-$3CBE(a5),d0
	ext.l	d0
	addq.l	#$2,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_02CA12:
	subq.w	#$1,-$3CBC(a5)
	tst.w	-$3CC0(a5)
	bne.s	loc_02CA54
	move.w	#$5,-$3CC0(a5)
	tst.w	-$3CC2(a5)
	bne.s	loc_02CA2E
	move.w	#$3,-$3CC2(a5)
loc_02CA2E:
	subq.w	#$1,-$3CC2(a5)
	move.w	-$3CC2(a5),d0
	ext.l	d0
	addq.l	#$6,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$28(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$28(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_02CA54:
	subq.w	#$1,-$3CC0(a5)
	tst.w	-$3CC4(a5)
	bne.s	loc_02CA96
	move.w	#$5,-$3CC4(a5)
	tst.w	-$3CC6(a5)
	bne.s	loc_02CA70
	move.w	#$3,-$3CC6(a5)
loc_02CA70:
	subq.w	#$1,-$3CC6(a5)
	move.w	-$3CC6(a5),d0
	ext.l	d0
	addq.l	#$2,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$3C(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$3C(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_02CA96:
	subq.w	#$1,-$3CC4(a5)
	tst.w	-$3CC8(a5)
	bne.s	loc_02CAD8
	move.w	#$5,-$3CC8(a5)
	tst.w	-$3CCA(a5)
	bne.s	loc_02CAB2
	move.w	#$3,-$3CCA(a5)
loc_02CAB2:
	subq.w	#$1,-$3CCA(a5)
	move.w	-$3CCA(a5),d0
	ext.l	d0
	addq.l	#$6,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$50(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$50(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_02CAD8:
	subq.w	#$1,-$3CC8(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_02CAEC
	tst.w	-$3CBA(a5)
	beq.s	loc_02CAEC
	jsr	AvalonA3_PsiFlashStep(pc)
loc_02CAEC:
	unlk	a6
	rts
