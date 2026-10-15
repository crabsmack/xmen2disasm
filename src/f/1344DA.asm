; ---------------------------------------------------------------------------
; FlyBrood_ScrStepHoverForever - FLYBROOD AI script thunk: jmp FlyBrood_ActHoverForever
; In:  jmp thunk
; Out: -
; Evidence: only entry of its script
; ---------------------------------------------------------------------------
FlyBrood_ScrStepHoverForever:
	jmp	$378A(a5)	; -> FlyBrood_ActHoverForever
