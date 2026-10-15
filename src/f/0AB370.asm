; ---------------------------------------------------------------------------
; BubbleManager_SetWaveParams - BUBBLEMANAGER: set the cluster parameters (+$9A, period +$9C, count +$9E) for the current wave -$3C1C (1-6)
; In:  a4 = this
; Out: none
; Evidence: 6-case switch Sw_0AB370; caller BubbleManager_StateBurst
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_SetWaveParams:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	-$3C1C(a5),d0
	subq.w	#$1,d0
	bmi.w	BubbleManager_SetWaveParams_Done
	cmpi.w	#$5,d0
	bgt.w	BubbleManager_SetWaveParams_Done
	add.w	d0,d0
	move.w	Sw_0AB370(pc,d0.w),d0
	jmp	Sw_0AB370-2(pc,d0.w)
