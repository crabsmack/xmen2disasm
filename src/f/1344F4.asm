; ---------------------------------------------------------------------------
; FlyBrood_ScriptD - FLYBROOD AI script thunks starting with FlyBrood_ActHoverUntilNear
; In:  jmp thunks
; Out: -
; Evidence: thunk table in the FLYBROOD module
; ---------------------------------------------------------------------------
FlyBrood_ScriptD:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344F8:
	jmp	$37A2(a5)	; -> FlyBrood_StateWaitPlayerPassedSine
