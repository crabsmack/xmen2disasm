; ---------------------------------------------------------------------------
; Hologram_WaitLowerLiftUp - Hologram: wait until the lower lift has stopped at the top
; In:  8(a6) = this
; Out: d0
; Evidence: +6 bit $4000 of the lift; TAS 9222-9399
; ---------------------------------------------------------------------------
Hologram_WaitLowerLiftUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9A(a4),a0
	move.w	#$4000,d0
	and.w	$6(a0),d0
	beq.s	loc_0E9FEA
	clr.w	$6C(a4)
	lea.l	Hologram_WaitUpperLiftBoarded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9FEA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
