; ---------------------------------------------------------------------------
; SentinelDoor_Init - parent Init, then no vertical speed, state SentinelDoor_StateStart (+$5C/+$64), flags |= $408B, +$42 = 0, sprite def jt $25C2 (palette 0), a solid type-$13 segment over the doorway (Seg_Create x-16..x+16, y-$70..y) into +$94, switch +$90 = placement +6 (0-14) with flag word +$8C = &(g_SentinelsD1Flags)[switch], frame 0, Obj_UpdateBoxes (SENTINELDOOR override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry or null
; Out: none
; Evidence: slot +$12 of the SENTINELDOOR descriptor $0DE9A0; TAS frames 2715-7112 (20 frames active)
; ---------------------------------------------------------------------------
SentinelDoor_Init:
	link.w	a6,#$FFF0
	movem.l	d4-d7/a3-a4,-(a7)
	move.l	$10(a6),d4
	move.l	$C(a6),d5
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	d4,-(a7)
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	lea.l	$25BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	SentinelDoor_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	SentinelDoor_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$408B,$6(a4)
	clr.b	$42(a4)
	lea.l	$25C2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	moveq	#$70,d2
	sub.l	d2,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$13,d1
	move.l	d1,-(a7)
	jsr	$4F1A(a5)	; -> Seg_Create
	move.l	d0,$94(a4)
	move.l	a3,d0
	lea.l	$28(a7),a7
	bne.s	loc_0DE61E
	lea.l	-$10(a6),a3
	move.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	move.l	d4,d0
	asr.l	#$8,d0
	move.w	d0,$4(a3)
	clr.l	$6(a3)
	clr.l	$A(a3)
	clr.w	$E(a3)
loc_0DE61E:
	move.w	$6(a3),d4
	move.w	d4,d7
	move.w	d7,$90(a4)
	cmpi.w	#$F,d7
	bge.s	loc_0DE632
	tst.w	d7
	bge.s	loc_0DE638
loc_0DE632:
	clr.w	d7
	clr.w	$90(a4)
loc_0DE638:
	ext.l	d7
	movea.l	g_SentinelsD1Flags(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,$8C(a4)
	clr.w	$92(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	lea.l	$C(a7),a7
	movem.l	-$28(a6),d4-d7/a3-a4
	unlk	a6
	rts
