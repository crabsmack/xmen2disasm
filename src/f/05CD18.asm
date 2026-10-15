; ---------------------------------------------------------------------------
; Tusk_Defeated_part2 - part 2 of Tusk_Defeated: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_Defeated
; Out: continues in Tusk_Defeated
; Evidence: only reached by branches from Tusk_Defeated
; ---------------------------------------------------------------------------
Tusk_Defeated_part2:
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	addq.w	#$4,a7
	bra.s	Tusk_Defeated_part5
loc_05CD22:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	addq.w	#$4,a7
	bra.s	Tusk_Defeated_part5
