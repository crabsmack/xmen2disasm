; ---------------------------------------------------------------------------
; Tusk_StateChooseAttack_part3 - part 3 of Tusk_StateChooseAttack: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_StateChooseAttack
; Out: continues in Tusk_StateChooseAttack
; Evidence: only reached by branches from Tusk_StateChooseAttack; ends with rts
; ---------------------------------------------------------------------------
Tusk_StateChooseAttack_part3:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
