; ---------------------------------------------------------------------------
; MagnetoBoss_StateFlyToSmash2 - MAGNETOBOSS: once past x $490 smash the floor at column $25
; In:  8(a6) = this
; Out: d0
; Evidence: MagnetoBoss_SmashSegmentStaggered(this, $25); next MagnetoBoss_StateSmash2b after 5 frames
; ---------------------------------------------------------------------------
MagnetoBoss_StateFlyToSmash2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	cmpi.l	#$490,d0
	ble.s	loc_0373F6
	moveq	#$25,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	MagnetoBoss_SmashSegmentStaggered(pc)
	addq.w	#$8,a7
	move.w	#$5,$6C(a4)
	lea.l	MagnetoBoss_StateSmash2b(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0373F6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
