; ---------------------------------------------------------------------------
; Tusk_StateChooseAttack_part1 - part 1 of Tusk_StateChooseAttack: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_StateChooseAttack
; Out: continues in Tusk_StateChooseAttack
; Evidence: only reached by branches from Tusk_StateChooseAttack
; ---------------------------------------------------------------------------
Tusk_StateChooseAttack_part1:
	clr.b	$98(a4)
loc_05C53C:
	lea.l	Tusk_AtkVulnerable(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	Tusk_StateChooseAttack_part3
