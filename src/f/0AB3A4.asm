; ---------------------------------------------------------------------------
; BubbleManager_SetWaveParams_Case1 - BubbleManager_SetWaveParams case 1: +$9A = 0, period $B4, count 1
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
BubbleManager_SetWaveParams_Case1:
	clr.w	$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$1,$9E(a4)
	bra.s	BubbleManager_SetWaveParams_Done
