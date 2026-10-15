; ---------------------------------------------------------------------------
; Tusk_Defeated_part1 - part 1 of Tusk_Defeated: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_Defeated
; Out: continues in Tusk_Defeated
; Evidence: only reached by branches from Tusk_Defeated
; ---------------------------------------------------------------------------
Tusk_Defeated_part1:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	Tusk_Defeated_part5
