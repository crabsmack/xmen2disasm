; ---------------------------------------------------------------------------
; Barbarian_StateAttack_Case1 - Barbarian_StateAttack case 1
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
Barbarian_StateAttack_Case1:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Barbarian_StateAttack_Done
loc_0BE33C:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Barbarian_StateAttack_Done
loc_0BE350:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Barbarian_StateAttack_Done
