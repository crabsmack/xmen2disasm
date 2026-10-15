; ---------------------------------------------------------------------------
; SwampFly_StatePickPath_Case1 - SwampFly_StatePickPath case 1: path $0C0312
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SwampFly_StatePickPath_Case1:
	lea.l	$2292(a5),a0
	move.l	$2(a0),$A4(a4)
	bra.s	SwampFly_StatePickPath_Start
loc_0C09EE:
	lea.l	$229A(a5),a0
	move.l	$2(a0),$A4(a4)
	bra.s	SwampFly_StatePickPath_Start
loc_0C09FA:
	lea.l	$22A2(a5),a0
	move.l	$2(a0),$A4(a4)
	bra.s	SwampFly_StatePickPath_Start
loc_0C0A06:
	lea.l	$22AA(a5),a0
	move.l	$2(a0),$A4(a4)
	bra.s	SwampFly_StatePickPath_Start
