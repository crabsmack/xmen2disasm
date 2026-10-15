; ---------------------------------------------------------------------------
; FlyBrood_ScrStepsWaitPassedSine - FLYBROOD AI script thunks: hover until a player is near, then FlyBrood_StateWaitPlayerPassedSine
; In:  jmp thunks
; Out: -
; Evidence: jmp FlyBrood_ActHoverUntilNear, jmp FlyBrood_StateWaitPlayerPassedSine
; ---------------------------------------------------------------------------
FlyBrood_ScrStepsWaitPassedSine:
	jmp	$3782(a5)	; -> FlyBrood_ActHoverUntilNear
loc_1344F8:
	jmp	$37A2(a5)	; -> FlyBrood_StateWaitPlayerPassedSine
