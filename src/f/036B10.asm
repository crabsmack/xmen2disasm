; ---------------------------------------------------------------------------
; MagnetoBoss_EnterOutroState - MAGNETOBOSS: switch to the outro animation state and set +$9B bit 7
; In:  8(a6) = this
; Out: none
; Evidence: jt 246, caller sub_037F7E (THRONEPHONE code, which also calls Scene_EndAfter); state MagnetoBoss_StateOutro
; ---------------------------------------------------------------------------
MagnetoBoss_EnterOutroState:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateOutro(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	ori.b	#$80,$9B(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
