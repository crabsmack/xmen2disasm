; ---------------------------------------------------------------------------
; Hologram_StateSetup - Hologram: find the lifts and the gate segment, disable XPower spawns, then wait for the lower lift
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Hologram_FindLifts, Hologram_FindGateSeg, Hologram_SetXPowerSpawns(0); TAS frame 7592
; ---------------------------------------------------------------------------
Hologram_StateSetup:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Hologram_FindLifts(pc)
	move.l	a4,-(a7)
	jsr	Hologram_FindGateSeg(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetXPowerSpawns(pc)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	Hologram_WaitLowerLiftBoarded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
