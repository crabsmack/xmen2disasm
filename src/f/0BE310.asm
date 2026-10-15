; ---------------------------------------------------------------------------
; Barbarian_StateAttack_Reset - Barbarian_StateAttack default case: reset the attack index, attack 0
; Evidence: switch target
; ---------------------------------------------------------------------------
Barbarian_StateAttack_Reset:
	clr.b	$BE(a4)
loc_0BE314:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Barbarian_StateAttack_Done
