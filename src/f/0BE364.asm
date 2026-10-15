; ---------------------------------------------------------------------------
; Barbarian_StateAttack_Case4 - Barbarian_StateAttack case 4
; Evidence: switch target
; Found: runtime: executed in 64 run(s) (fuzz-01800-s1...)
; ---------------------------------------------------------------------------
Barbarian_StateAttack_Case4:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
