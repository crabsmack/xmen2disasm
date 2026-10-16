; ---------------------------------------------------------------------------
; BigAcolyte_IntroScript - BIGACOLYTE intro AI script: 6 jmp thunks (WaitPlayers, Appear, MoveToWall, Grow, Wait60, StartFight)
; In:  a4 = this (entered through +$5C)
; Out: none
; Evidence: preceded by Tbl_BigAcolyteIntroScript (6); jt[57] points at the script
; ---------------------------------------------------------------------------
BigAcolyte_IntroScript:
	jmp	$15A(a5)	; -> BigAcolyte_ActWaitPlayers
loc_0119EA:
	jmp	$152(a5)	; -> BigAcolyte_ActAppear
loc_0119EE:
	jmp	$162(a5)	; -> BigAcolyte_ActMoveToWall
loc_0119F2:
	jmp	$16A(a5)	; -> BigAcolyte_ActGrow
loc_0119F6:
	jmp	$1BA(a5)	; -> BigAcolyte_ActWait60
loc_0119FA:
	jmp	$172(a5)	; -> BigAcolyte_ActStartFight
