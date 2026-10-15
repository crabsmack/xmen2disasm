; ---------------------------------------------------------------------------
; AvalonA3_PsiFlashStep - one frame of Exodus' screen-wide psychic flash: hurt both players, rotate colours 0-13 of palette line 0 while counter g_PsiFlashTimer runs, restore the saved palettes when it ends
; In:  none
; Out: none
; Evidence: called from AvalonA3_FrameHook while g_PsiFlashTimer != 0; g_PsiFlashTimer = 14 set by Exodus_StartPsiFlash; Exodus_HurtPlayer on g_Player1/g_Player2 each step; restore from the buffers saved by AvalonA3_SavePalettes (g_SceneVar3B14, g_SceneVar3B18)
; ---------------------------------------------------------------------------
AvalonA3_PsiFlashStep:
	link.w	a6,#$0
	movem.l	d3/d5-d7,-(a7)
	move.w	g_PsiFlashTimer(a5),d0
	subq.w	#$1,g_PsiFlashTimer(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	tst.w	g_PsiFlashTimer(a5)
	beq.s	loc_02C968
	pea.l	g_Player1(a5)
	jsr	$61A(a5)	; -> Exodus_HurtPlayer
	pea.l	g_Player2(a5)
	jsr	$61A(a5)	; -> Exodus_HurtPlayer
	addq.w	#$8,a7
	move.w	g_PalBase(a5),d0
	ext.l	d0
	move.l	d0,d5
	moveq	#$0,d7
	moveq	#$C,d3
loc_02C944:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase+$2(a5),a0
	move.l	d7,d1
	add.w	d1,d1
	lea.l	g_PalBase(a5),a1
	move.w	(a0,d0.w),(a1,d1.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bge.s	loc_02C944
	move.w	d5,g_PalBase+$1A(a5)
	bra.s	loc_02C9A0
loc_02C968:
	moveq	#$0,d7
	moveq	#$D,d3
loc_02C96C:
	movea.l	g_SceneVar3B14(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.l	d7,d1
	add.w	d1,d1
	lea.l	g_PalBase(a5),a1
	move.w	(a0,d0.l),(a1,d1.w)
	movea.l	g_SceneVar3B18(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.l	d7,d1
	add.w	d1,d1
	lea.l	g_PalBase+$40(a5),a1
	move.w	(a0,d0.l),(a1,d1.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bge.s	loc_02C96C
loc_02C9A0:
	movem.l	-$10(a6),d3/d5-d7
	unlk	a6
	rts
