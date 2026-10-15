; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part3 - part 3 of Exodus_StateNextAttack: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part3:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
	bra.w	Exodus_StateNextAttack_part6
