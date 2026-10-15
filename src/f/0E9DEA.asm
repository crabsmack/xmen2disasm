; ---------------------------------------------------------------------------
; Hologram_WaitLowerLiftBoarded - Hologram: when every player stands on the lower lift, send it down
; In:  8(a6) = this
; Out: d0
; Evidence: CoreElevator_CarriesAllPlayers(+$9A) then CoreElevator_SendDown; TAS 7592-7633
; ---------------------------------------------------------------------------
Hologram_WaitLowerLiftBoarded:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9A(a4),-(a7)
	jsr	$28C2(a5)	; -> CoreElevator_CarriesAllPlayers
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0E9E2E
	move.l	$9A(a4),-(a7)
	jsr	$28CA(a5)	; -> CoreElevator_SendDown
	moveq	#$1B,d0
	move.l	d0,-$3B14(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetPose(pc)
	addq.w	#$8,a7
	move.w	#$A,$6C(a4)
	lea.l	Hologram_WaitLowerLiftDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9E2E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
