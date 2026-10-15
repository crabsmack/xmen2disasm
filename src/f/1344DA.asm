; ---------------------------------------------------------------------------
; FlyBrood_ScriptA - FLYBROOD AI script thunk (hover forever)
; In:  jmp thunk
; Out: -
; Evidence: jmp FlyBrood_ActHoverForever
; ---------------------------------------------------------------------------
FlyBrood_ScriptA:
	jmp	$378A(a5)	; -> FlyBrood_ActHoverForever
