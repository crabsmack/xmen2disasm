; ---------------------------------------------------------------------------
; BubbleManager_StateBurst - BUBBLEMANAGER state: burst - on each timeout set the wave parameters and release a cluster; after +$A0 clusters pause
; In:  8(a6) = this
; Out: none
; Evidence: +$A0 counts down from +$A2; then +$6E = +$A4, state BubbleManager_StatePause; TAS 29719-30523
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_StateBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB464
	move.l	a4,-(a7)
	jsr	BubbleManager_SetWaveParams(pc)
	move.l	a4,-(a7)
	jsr	BubbleManager_SpawnCluster(pc)
	subq.w	#$1,$A0(a4)
	tst.w	$A0(a4)
	addq.w	#$8,a7
	bgt.s	loc_0AB464
	move.w	$A2(a4),$A0(a4)
	move.w	$A4(a4),$6E(a4)
	clr.w	$6C(a4)
	lea.l	BubbleManager_StatePause(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AB464:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
