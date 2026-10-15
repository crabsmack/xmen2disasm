; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part2 - part 2 of Exodus_StateNextAttack: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part2:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast17(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02CF7A:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02CF90:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02CFA6:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02CFBC:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkSwoopA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02CFD2:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkSwoopB(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
