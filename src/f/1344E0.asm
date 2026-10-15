; ---------------------------------------------------------------------------
; FlyBrood_ScriptB - FLYBROOD AI script thunks starting with FlyBrood_ActHoverUntilNear
; In:  jmp thunks
; Out: -
; Evidence: thunk table in the FLYBROOD module
; ---------------------------------------------------------------------------
FlyBrood_ScriptB:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344E4:
	jmp	$3792(a5)	; -> FlyBrood_StateWaitPlayerPassed
