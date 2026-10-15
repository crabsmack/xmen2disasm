; ---------------------------------------------------------------------------
; FlyBrood_ScrStepsWaitPassedLow - FLYBROOD AI script thunks: hover until a player is near, then FlyBrood_StateWaitPlayerPassedLow
; In:  jmp thunks
; Out: -
; Evidence: jmp FlyBrood_ActHoverUntilNear, jmp FlyBrood_StateWaitPlayerPassedLow
; ---------------------------------------------------------------------------
FlyBrood_ScrStepsWaitPassedLow:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344EE:
	jmp	$379A(a5)	; -> FlyBrood_StateWaitPlayerPassedLow
