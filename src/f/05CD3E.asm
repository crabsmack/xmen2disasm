; ---------------------------------------------------------------------------
; Tusk_Defeated_part5 - part 5 of Tusk_Defeated: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tusk_Defeated
; Out: continues in Tusk_Defeated
; Evidence: only reached by branches from Tusk_Defeated; ends with rts
; ---------------------------------------------------------------------------
Tusk_Defeated_part5:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
