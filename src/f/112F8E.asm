; ---------------------------------------------------------------------------
; Deathbird_StateHitSwitch - Deathbird: hit the elevator switch tile (7,11), reversing the lift, then fly off
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SpaceA1_SwitchTileHit(7, 11, this) (allowed for DEATHBIRD), SetMoveMode(4)
; ---------------------------------------------------------------------------
Deathbird_StateHitSwitch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$B,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	jsr	$2AA2(a5)	; -> SpaceA1_SwitchTileHit
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateFlyOff(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
