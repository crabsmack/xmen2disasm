; ---------------------------------------------------------------------------
; Exodus_TakeDamage_part3 - part 3 of Exodus_TakeDamage: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_TakeDamage
; Out: continues in Exodus_TakeDamage
; Evidence: only reached by branches from Exodus_TakeDamage
; ---------------------------------------------------------------------------
Exodus_TakeDamage_part3:
	move.l	a4,-(a7)
	jsr	$3AE2(a5)	; -> sub_13E808
	addq.w	#$4,a7
	bra.s	loc_02DBC6
