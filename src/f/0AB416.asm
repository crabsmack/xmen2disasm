; ---------------------------------------------------------------------------
; BubbleManager_SetWaveParams_Done - BubbleManager_SetWaveParams common exit
; Evidence: switch exit
; ---------------------------------------------------------------------------
BubbleManager_SetWaveParams_Done:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
