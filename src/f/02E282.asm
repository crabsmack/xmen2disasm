; ---------------------------------------------------------------------------
; ExodusBlast_StateFlyLeft - EXODUSBLAST: fly until x < $21 px, then start the psychic flash and die
; In:  8(a6) = this
; Out: none
; Evidence: Exodus_StartPsiFlash; next ExodusBlast_StateDie
; ---------------------------------------------------------------------------
ExodusBlast_StateFlyLeft:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$2100,$8(a4)
	bge.s	loc_02E2AC
	jsr	$66A(a5)	; -> Exodus_StartPsiFlash
	clr.w	$6C(a4)
	lea.l	ExodusBlast_StateDie(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02E2AC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
