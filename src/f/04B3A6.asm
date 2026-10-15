; ---------------------------------------------------------------------------
; Apocalypse_SelectBombPattern_part2 - part 2 of Apocalypse_SelectBombPattern: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_SelectBombPattern
; Out: continues in Apocalypse_SelectBombPattern
; Evidence: only reached by branches from Apocalypse_SelectBombPattern
; ---------------------------------------------------------------------------
Apocalypse_SelectBombPattern_part2:
	lea.l	$A62(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
