; ---------------------------------------------------------------------------
; CloneA5_SegHook17 - CloneA5 floor-segment hook for type $17 (the boss body): in mode 3, a player overlapping the segment takes damage
; In:  8(a6) = word mode, $C(a6) = segment, $10(a6) = object
; Out: d0 = 1 when the object's box misses the segment
; Evidence: stored at -$340E(a5) = g_SegTypeHooks[$17] by BroodBoss_StateWaitArrive (cleared by BroodBoss_Defeat); overlap with P1/P2 and +$6A = 0 -> slot +$26 TakeDamage(0, 5, 2, box centre); TAS 49566-49824
; Found: jt 643
; ---------------------------------------------------------------------------
CloneA5_SegHook17:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$10(a6),a4
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.w	loc_088106
	move.w	$4C(a4),d0
	cmp.w	$E(a3),d0
	bge.s	loc_0880A6
	move.w	$4E(a4),d0
	cmp.w	$C(a3),d0
	bge.s	loc_0880A6
	move.w	$52(a4),d0
	cmp.w	$8(a3),d0
	blt.s	loc_0880A6
	move.w	$50(a4),d0
	cmp.w	$A(a3),d0
	bgt.s	loc_0880AA
loc_0880A6:
	moveq	#$1,d0
	bra.s	loc_088108
loc_0880AA:
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_0880BA
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_088106
loc_0880BA:
	tst.w	$6A(a4)
	bne.s	loc_088106
	move.w	$4E(a4),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	asr.l	#$1,d6
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$5,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_088106:
	moveq	#$0,d0
loc_088108:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
