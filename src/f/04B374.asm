; ---------------------------------------------------------------------------
; Apocalypse_SelectBombPattern_part1 - part 1 of Apocalypse_SelectBombPattern: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_SelectBombPattern
; Out: continues in Apocalypse_SelectBombPattern
; Evidence: only reached by branches from Apocalypse_SelectBombPattern
; ---------------------------------------------------------------------------
Apocalypse_SelectBombPattern_part1:
	lea.l	$A3A(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
loc_04B37E:
	lea.l	$A42(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
loc_04B388:
	lea.l	$A4A(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
loc_04B392:
	lea.l	$A52(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
loc_04B39C:
	lea.l	$A5A(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4B3B8
