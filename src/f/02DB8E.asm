; ---------------------------------------------------------------------------
; Exodus_TakeDamage_part4 - part 4 of Exodus_TakeDamage: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_TakeDamage
; Out: continues in Exodus_TakeDamage
; Evidence: only reached by branches from Exodus_TakeDamage
; ---------------------------------------------------------------------------
Exodus_TakeDamage_part4:
	move.l	a4,-(a7)
	jsr	$3ADA(a5)	; -> sub_13E30E
	addq.w	#$4,a7
	bra.s	loc_02DBC6
