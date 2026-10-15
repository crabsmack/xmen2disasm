; ---------------------------------------------------------------------------
; FlyBrood_ScriptC - FLYBROOD AI script thunks starting with FlyBrood_ActHoverUntilNear
; In:  jmp thunks
; Out: -
; Evidence: thunk table in the FLYBROOD module
; ---------------------------------------------------------------------------
FlyBrood_ScriptC:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344EE:
	jmp	$379A(a5)	; -> FlyBrood_StateWaitPlayerPassedLow
