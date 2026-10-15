; ---------------------------------------------------------------------------
; sub_1FC6F6
; ---------------------------------------------------------------------------
sub_1FC6F6:
	movem.l	g_ScalerRegSave(a5),d0-d7/a0-a4
	move.w	g_ScalerParams+$1C(a5),g_ScalerBudget(a5)
	move.l	g_ScalerResumePC(a5),-(a7)
	rts
