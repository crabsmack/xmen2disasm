; ---------------------------------------------------------------------------
; Scaler_Resume - resume a scaling pass that yielded: reload the row budget, restore its registers and return into it
; In:  none
; Out: returns through the saved g_ScalerResumePC
; Evidence: g_ScalerBudget = g_ScalerParams+$1C, movem g_ScalerRegSave, push g_ScalerResumePC, rts
; ---------------------------------------------------------------------------
Scaler_Resume:
	movem.l	g_ScalerRegSave(a5),d0-d7/a0-a4
	move.w	g_ScalerParams+$1C(a5),g_ScalerBudget(a5)
	move.l	g_ScalerResumePC(a5),-(a7)
	rts
