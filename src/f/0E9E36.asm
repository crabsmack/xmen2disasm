; ---------------------------------------------------------------------------
; Hologram_WaitLowerLiftDown - Hologram: wait until the lower lift has stopped (its +6 bit $4000), then wait for the players
; In:  8(a6) = this
; Out: d0
; Evidence: TAS 7644-7811
; ---------------------------------------------------------------------------
Hologram_WaitLowerLiftDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9A(a4),a0
	move.w	#$4000,d0
	and.w	$6(a0),d0
	beq.s	loc_0E9E60
	clr.w	$6C(a4)
	lea.l	Hologram_WaitPlayersInArena(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9E60:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
