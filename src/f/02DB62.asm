; ---------------------------------------------------------------------------
; Exodus_TakeDamage_part1 - part 1 of Exodus_TakeDamage: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_TakeDamage
; Out: continues in Exodus_TakeDamage
; Evidence: only reached by branches from Exodus_TakeDamage
; ---------------------------------------------------------------------------
Exodus_TakeDamage_part1:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_02DBC6
