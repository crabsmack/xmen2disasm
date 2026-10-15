; ---------------------------------------------------------------------------
; Exodus_TakeDamage_part2 - part 2 of Exodus_TakeDamage: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_TakeDamage
; Out: continues in Exodus_TakeDamage
; Evidence: only reached by branches from Exodus_TakeDamage
; ---------------------------------------------------------------------------
Exodus_TakeDamage_part2:
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> ExplodeFx_BurstMedium
	addq.w	#$4,a7
	bra.s	loc_02DBC6
loc_02DB7A:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> ExplodeFx_BurstSmall
	addq.w	#$4,a7
	bra.s	loc_02DBC6
