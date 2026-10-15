; ---------------------------------------------------------------------------
; Tusk_Defeated_part3 - part 3 of Tusk_Defeated: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_Defeated
; Out: continues in Tusk_Defeated
; Evidence: only reached by branches from Tusk_Defeated
; ---------------------------------------------------------------------------
Tusk_Defeated_part3:
	move.l	a4,-(a7)
	jsr	$3AE2(a5)	; -> ExplodeFx_Bounce
	addq.w	#$4,a7
	bra.s	Tusk_Defeated_part5
