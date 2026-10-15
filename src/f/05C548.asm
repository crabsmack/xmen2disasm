; ---------------------------------------------------------------------------
; Tusk_StateChooseAttack_part2 - part 2 of Tusk_StateChooseAttack: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_StateChooseAttack
; Out: continues in Tusk_StateChooseAttack
; Evidence: only reached by branches from Tusk_StateChooseAttack
; ---------------------------------------------------------------------------
Tusk_StateChooseAttack_part2:
	lea.l	Tusk_AtkThrowBoulder(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C554:
	lea.l	Tusk_AtkSpawnTuskette2(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$1E,$6C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C566:
	lea.l	Tusk_AtkThrowBoulder(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C572:
	lea.l	Tusk_AtkVulnerable(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C57E:
	lea.l	Tusk_AtkSpawnTuskette3(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$1E,$6C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C590:
	lea.l	Tusk_AtkThrowBoulder(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C59C:
	lea.l	Tusk_AtkSpawnTusketteBoth(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$1E,$6C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C5AE:
	lea.l	Tusk_AtkThrowBoulder(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
loc_05C5BA:
	lea.l	Tusk_AtkThrowBoulder(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
