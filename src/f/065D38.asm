; ---------------------------------------------------------------------------
; PlayerSelect_Run_P2Gambit - PlayerSelect_Run: P2 chose Gambit, Nightcrawler, Psylocke, Wolverine or Magneto
; In:  none
; Out: none
; Evidence: Sw_065CBC entries 2-6 (PlayerSelect_Run_P2Gambit..loc_065D68)
; ---------------------------------------------------------------------------
PlayerSelect_Run_P2Gambit:
	lea.l	$2BC2(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
loc_065D44:
	lea.l	$2BA2(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
loc_065D50:
	lea.l	$2BAA(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
loc_065D5C:
	lea.l	$2BB2(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
loc_065D68:
	lea.l	$2BBA(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
