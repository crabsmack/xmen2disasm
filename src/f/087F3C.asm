; ---------------------------------------------------------------------------
; BroodBoss_StateRemoveParts - BROODBOSS death: when the boss offset drops below $69, kill the claw and arm and destroy the little leg
; In:  8(a6) = this
; Out: d0
; Evidence: claw/arm slot +$52 Kill, LITTLELEG slot +$16; +$6C = $3C; next BroodBoss_StateFinish; TAS 50752-51072
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateRemoveParts:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	moveq	#$68,d1
	cmp.l	d0,d1
	bge.s	loc_087F66
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRemoveParts(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_087FE2
loc_087F66:
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	movea.l	$96(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	tst.l	$9A(a4)
	addq.w	#$4,a7
	beq.s	loc_087FB2
	movea.l	$9A(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9A(a4)
	addq.w	#$4,a7
loc_087FB2:
	tst.l	$9E(a4)
	beq.s	loc_087FCE
	movea.l	$9E(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$16(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9E(a4)
	addq.w	#$4,a7
loc_087FCE:
	move.w	#$3C,$6C(a4)
	lea.l	BroodBoss_StateFinish(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_087FE2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
