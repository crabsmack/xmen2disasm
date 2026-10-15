; ---------------------------------------------------------------------------
; Tusk_Defeated_part4 - part 4 of Tusk_Defeated: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_Defeated
; Out: continues in Tusk_Defeated
; Evidence: only reached by branches from Tusk_Defeated
; ---------------------------------------------------------------------------
Tusk_Defeated_part4:
	move.l	a4,-(a7)
	jsr	$3ADA(a5)	; -> ExplodeFx_TrailArc
	addq.w	#$4,a7
