; ---------------------------------------------------------------------------
; FlyBrood_ScrStepsWaitPassed - FLYBROOD AI script thunks: hover until a player is near, then FlyBrood_StateWaitPlayerPassed
; In:  jmp thunks
; Out: -
; Evidence: jmp FlyBrood_ActHoverUntilNear, jmp FlyBrood_StateWaitPlayerPassed
; ---------------------------------------------------------------------------
FlyBrood_ScrStepsWaitPassed:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344E4:
	jmp	$3792(a5)	; -> FlyBrood_StateWaitPlayerPassed
