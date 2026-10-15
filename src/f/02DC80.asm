; ---------------------------------------------------------------------------
; Exodus_StartPsiFlash - start Exodus' screen-wide psychic flash (14 steps) with sound $E1
; In:  none
; Out: none
; Evidence: -$3CBA = 14 (run by AvalonA3_PsiFlashStep); called when a horizontal blast reaches a wall (ExodusBlast_StateFlyRight/Left)
; ---------------------------------------------------------------------------
Exodus_StartPsiFlash:
	link.w	a6,#$0
	move.w	#$E,-$3CBA(a5)
	pea.l	($E1).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E1).w
	jsr	$521A(a5)	; -> Snd_Play
	unlk	a6
	rts
