; ---------------------------------------------------------------------------
; ExodusBlast_StateFlyDown - EXODUSBLAST: fly until y > $301 px (the floor), then check which floor segment it broke and die
; In:  8(a6) = this
; Out: none
; Evidence: Exodus_CheckFloorHit; next ExodusBlast_StateDie
; ---------------------------------------------------------------------------
ExodusBlast_StateFlyDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$30100,$C(a4)
	ble.s	loc_02E2DE
	jsr	$672(a5)	; -> Exodus_CheckFloorHit
	clr.w	$6C(a4)
	lea.l	ExodusBlast_StateDie(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02E2DE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
