; ---------------------------------------------------------------------------
; BubbleManager_ConfigBurst - BUBBLEMANAGER: burst setup for SavageB1 - bursts of +$A2 clusters (default 6) separated by +$A4 frames (default 100)
; In:  8(a6) = this, $C(a6) = placement record
; Out: none
; Evidence: used by BubbleManager_Init when g_ScnSavageB1 == g_SceneIndex; TAS 29716-30468
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_ConfigBurst:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	tst.w	$6(a4)
	beq.s	loc_0AB102
	move.w	$6(a4),d0
	bra.s	loc_0AB104
loc_0AB102:
	moveq	#$6,d0
loc_0AB104:
	move.w	d0,$A2(a3)
	move.w	d0,$A0(a3)
	tst.w	$E(a4)
	beq.s	loc_0AB118
	move.w	$E(a4),d0
	bra.s	loc_0AB11A
loc_0AB118:
	moveq	#$64,d0
loc_0AB11A:
	move.w	d0,$A4(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
