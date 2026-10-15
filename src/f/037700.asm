; ---------------------------------------------------------------------------
; MagnetoBoss_StateBreakWall - MAGNETOBOSS: past x $720 break the wall at column $39 rows 5-7 at once with rubble
; In:  8(a6) = this
; Out: d0
; Evidence: MagnetoBoss_CrackWall($39, 5, 7, 1); MagnetoBoss_SpawnRubble; next MagnetoBoss_StateFlyToFinal
; ---------------------------------------------------------------------------
MagnetoBoss_StateBreakWall:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	cmpi.l	#$720,d0
	ble.s	loc_03776A
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	moveq	#$5,d0
	move.l	d0,-(a7)
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	MagnetoBoss_CrackWall(pc)
	moveq	#$11,d0
	move.l	d0,-(a7)
	pea.l	($180).w
	moveq	#$0,d1
	move.l	d1,-(a7)
	moveq	#$8,d0
	move.l	d0,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	moveq	#$5,d0
	move.l	d0,-(a7)
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	MagnetoBoss_SpawnRubble(pc)
	lea.l	MagnetoBoss_StateFlyToFinal(pc),a0
	move.l	a0,$90(a4)
	lea.l	$2C(a7),a7
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateFlyToFinal(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_03776A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
