; ---------------------------------------------------------------------------
; BubbleManager_StateStart - BUBBLEMANAGER first state: burst mode in SavageB1, else cluster mode
; In:  8(a6) = this
; Out: d0
; Evidence: g_ScnSavageB1 == g_SceneIndex -> BubbleManager_StateBurst else BubbleManager_StateCluster; TAS 29718-31580
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	g_ScnSavageB1(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AB336
	clr.w	$6C(a4)
	lea.l	BubbleManager_StateBurst(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0AB348
loc_0AB336:
	clr.w	$6C(a4)
	lea.l	BubbleManager_StateCluster(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AB348:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
