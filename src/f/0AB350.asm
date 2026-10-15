; ---------------------------------------------------------------------------
; BubbleManager_StateCluster - BUBBLEMANAGER state: release a cluster whenever the timer +$6E runs out
; In:  8(a6) = this
; Out: none
; Evidence: TAS 31012-31636
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_StateCluster:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB368
	move.l	a4,-(a7)
	jsr	BubbleManager_SpawnCluster(pc)
	addq.w	#$4,a7
loc_0AB368:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
