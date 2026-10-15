; ---------------------------------------------------------------------------
; BeamScooter_StateDescend - BEAMSCOOTER: descend until y 156 px, then stop
; In:  8(a6) = this
; Out: d0
; Evidence: next BeamScooter_StatePickUp
; ---------------------------------------------------------------------------
BeamScooter_StateDescend:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$9C00,$C(a4)
	blt.s	loc_04EB70
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	BeamScooter_StatePickUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04EB82
loc_04EB70:
	clr.w	$6C(a4)
	lea.l	BeamScooter_StateDescend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04EB82:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
