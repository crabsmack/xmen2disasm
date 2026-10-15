; ---------------------------------------------------------------------------
; Hornet_StatePickPattern_CaseDefault - case 0/default of Hornet_StatePickPattern: horizontal bounce (vx = $200, +$A0 bit 0, Hornet_MoveBounce)
; In:  a4 = this
; Out: none
; Evidence: switch table Sw_136D86 entry 0 and the out-of-range branch
; ---------------------------------------------------------------------------
Hornet_StatePickPattern_CaseDefault:
	move.w	#$200,$16(a4)
	ori.w	#$1,$A0(a4)
	lea.l	Hornet_MoveBounce(pc),a0
	move.l	a0,$94(a4)
	bra.s	Hornet_StatePickPattern_StartAttack
