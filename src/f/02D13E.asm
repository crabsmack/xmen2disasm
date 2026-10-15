; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part6 - part 6 of Exodus_StateNextAttack: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack; ends with rts
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
