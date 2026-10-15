; ---------------------------------------------------------------------------
; BubbleManager_SetWaveParams_Case2 - BubbleManager_SetWaveParams case 2: +$9A = 0, period $B4, count 2 (cases 3-6 follow)
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
BubbleManager_SetWaveParams_Case2:
	clr.w	$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$2,$9E(a4)
	bra.s	BubbleManager_SetWaveParams_Done
loc_0AB3C8:
	move.w	#$1,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$2,$9E(a4)
	bra.s	BubbleManager_SetWaveParams_Done
loc_0AB3DC:
	move.w	#$2,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$3,$9E(a4)
	bra.s	BubbleManager_SetWaveParams_Done
loc_0AB3F0:
	move.w	#$3,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$4,$9E(a4)
	bra.s	BubbleManager_SetWaveParams_Done
loc_0AB404:
	move.w	#$4,$9A(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$4,$9E(a4)
