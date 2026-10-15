; ---------------------------------------------------------------------------
; Apocalypse_SelectBombPattern_part3 - part 3 of Apocalypse_SelectBombPattern: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_SelectBombPattern
; Out: continues in Apocalypse_SelectBombPattern
; Evidence: only reached by branches from Apocalypse_SelectBombPattern; ends with rts
; ---------------------------------------------------------------------------
Apocalypse_SelectBombPattern_part3:
	lea.l	$A3A(a5),a0
	movea.l	$2(a0),a4
	move.l	a4,$A8(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
