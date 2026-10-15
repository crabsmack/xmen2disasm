; ---------------------------------------------------------------------------
; BroodBoss_StateWaitArrive - BROODBOSS state: wait until the boss x offset reaches $130, then enable its frame hook and start the AI script
; In:  8(a6) = this
; Out: d0
; Evidence: |(g_BroodBossOffsetX >> 8) - $130| < 5 -> g_SceneVar3B0C |= 1, -$340E := CloneA5_SegHook17, script step 0 (+$92/+$90); TAS 49418-49566
; ---------------------------------------------------------------------------
BroodBoss_StateWaitArrive:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	sub.l	#$130,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_086CF0
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	sub.l	#$130,d0
	bra.s	loc_086CFE
loc_086CF0:
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	sub.l	#$130,d0
	neg.l	d0
loc_086CFE:
	moveq	#$5,d1
	cmp.l	d0,d1
	ble.s	loc_086D42
	ori.w	#$1,g_SceneVar3B0C(a5)
	lea.l	CloneA5_SegHook17(pc),a0
	move.l	a0,g_SegTypeHooks+$5C(a5)
	tst.l	$92(a4)
	bne.s	loc_086D24
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_086D54
loc_086D24:
	clr.w	$90(a4)
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_086D54
loc_086D42:
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateWaitArrive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_086D54:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
