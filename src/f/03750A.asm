; ---------------------------------------------------------------------------
; MagnetoBoss_StateResumeShoot - MAGNETOBOSS: restore the zone-4 approach as resume state and shoot
; In:  8(a6) = this
; Out: d0
; Evidence: +$90 = MagnetoBoss_StateZone4Approach; MagnetoBoss_StateAimShoot
; ---------------------------------------------------------------------------
MagnetoBoss_StateResumeShoot:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateZone4Approach(pc),a0
	move.l	a0,$90(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_03753A
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	MagnetoBoss_StateAimShoot(pc)
	addq.w	#$4,a7
	bra.s	loc_037552
loc_03753A:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_037552:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
