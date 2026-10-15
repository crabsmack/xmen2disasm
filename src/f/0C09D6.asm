; ---------------------------------------------------------------------------
; SwampFly_StatePickPath_Default - SwampFly_StatePickPath default case: path $0C00D6
; Evidence: switch target
; ---------------------------------------------------------------------------
SwampFly_StatePickPath_Default:
	lea.l	$228A(a5),a0
	move.l	$2(a0),$A4(a4)
	bra.s	SwampFly_StatePickPath_Start
