; ---------------------------------------------------------------------------
; MagnetoBoss_StateIntroShake3 - MAGNETOBOSS intro: shake (jt $35B0E) and crack again; once the wall is broken throw rubble and burst in
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: MagnetoBoss_CrackWall result; MagnetoBoss_SpawnRubble(0, 6, 8, 8, 0, $180, $11); next MagnetoBoss_StateBurstIn or MagnetoBoss_StateIntroWait3
; ---------------------------------------------------------------------------
MagnetoBoss_StateIntroShake3:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d7
	lea.l	$762(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	MagnetoBoss_CrackWall(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_036DA8
	moveq	#$11,d0
	move.l	d0,-(a7)
	pea.l	($180).w
	moveq	#$0,d1
	move.b	d7,d1
	move.l	d1,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	MagnetoBoss_SpawnRubble(pc)
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateBurstIn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_036DBA
loc_036DA8:
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_StateIntroWait3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036DBA:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
