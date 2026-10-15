; ---------------------------------------------------------------------------
; Tusk_StateVulnerableWait - TUSK: when the timer ends choose the next attack
; In:  8(a6) = this
; Out: none
; Evidence: next Tusk_StateChooseAttack
; ---------------------------------------------------------------------------
Tusk_StateVulnerableWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_05C61E
	lea.l	Tusk_StateChooseAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C61E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
