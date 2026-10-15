; ---------------------------------------------------------------------------
; Hologram_WaitLowerLiftBoarded2 - Hologram after the fight: when every player is on the lower lift, send it up
; In:  8(a6) = this
; Out: d0
; Evidence: CoreElevator_CarriesAllPlayers(+$9A), CoreElevator_SendUp; TAS 9204-9221
; ---------------------------------------------------------------------------
Hologram_WaitLowerLiftBoarded2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9A(a4),-(a7)
	jsr	$28C2(a5)	; -> CoreElevator_CarriesAllPlayers
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0E9FB8
	move.l	$9A(a4),-(a7)
	jsr	$28D2(a5)	; -> CoreElevator_SendUp
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Hologram_WaitLowerLiftUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9FB8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
