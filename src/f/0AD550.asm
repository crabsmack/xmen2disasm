; ---------------------------------------------------------------------------
; SavageA2_CamUpdateFlood - SavageA2 camera update hook: after a delay raise the flood line -$38BC (fast, then slower), then the default camera update
; In:  8(a6) = camera
; Out: none
; Evidence: delay $78/$1E0 frames (counter -$33A2) by scene; level long -$3C32 -= $200/$400 then $80-$100 per frame; -$3C12/-$3C10 = level + 1; Cam_DefaultUpdate(camera); installed at camera +4; jt 893
; Found: jt 893
; ---------------------------------------------------------------------------
SavageA2_CamUpdateFlood:
	link.w	a6,#$0
	movem.l	d3/d6-d7,-(a7)
	moveq	#$0,d0
	move.b	g_ScnSavageA2(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AD594
	moveq	#$78,d0
	cmp.l	g_FrameCounter(a5),d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_0AD580
	moveq	#$6,d0
	and.l	g_FrameCounter(a5),d0
	moveq	#$6,d1
	cmp.l	d0,d1
	seq.b	d3
	neg.b	d3
	bra.s	loc_0AD582
loc_0AD580:
	moveq	#$0,d3
loc_0AD582:
	move.b	d3,d6
	cmpi.l	#$C8,g_FrameCounter(a5)
	scs.b	d3
	neg.b	d3
	move.b	d3,d7
	bra.s	loc_0AD5C4
loc_0AD594:
	cmpi.l	#$1E0,g_FrameCounter(a5)
	shi.b	d3
	neg.b	d3
	beq.s	loc_0AD5B2
	moveq	#$6,d0
	and.l	g_FrameCounter(a5),d0
	moveq	#$6,d1
	cmp.l	d0,d1
	seq.b	d3
	neg.b	d3
	bra.s	loc_0AD5B4
loc_0AD5B2:
	moveq	#$0,d3
loc_0AD5B4:
	move.b	d3,d6
	cmpi.l	#$230,g_FrameCounter(a5)
	scs.b	d3
	neg.b	d3
	move.b	d3,d7
loc_0AD5C4:
	tst.b	d6
	beq.w	loc_0AD660
	tst.w	-$38BC(a5)
	ble.w	loc_0AD660
	tst.b	d7
	beq.s	loc_0AD5FC
	tst.b	-$38DE(a5)
	beq.s	loc_0AD5E4
	move.l	#$400,d0
	bra.s	loc_0AD5EA
loc_0AD5E4:
	move.l	#$200,d0
loc_0AD5EA:
	ext.l	d0
	sub.l	d0,-$3C32(a5)
	move.l	-$3C32(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$38BC(a5)
	bra.s	loc_0AD652
loc_0AD5FC:
	moveq	#$0,d0
	move.b	g_ScnSavageA2(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AD62E
	tst.b	-$38DE(a5)
	beq.s	loc_0AD616
	move.l	#$100,d0
	bra.s	loc_0AD61C
loc_0AD616:
	move.l	#$80,d0
loc_0AD61C:
	ext.l	d0
	sub.l	d0,-$3C32(a5)
	move.l	-$3C32(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$38BC(a5)
	bra.s	loc_0AD652
loc_0AD62E:
	tst.b	-$38DE(a5)
	beq.s	loc_0AD63C
	move.l	#$200,d0
	bra.s	loc_0AD642
loc_0AD63C:
	move.l	#$100,d0
loc_0AD642:
	ext.l	d0
	sub.l	d0,-$3C32(a5)
	move.l	-$3C32(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$38BC(a5)
loc_0AD652:
	move.w	-$38BC(a5),d0
	addq.w	#$1,d0
	move.w	d0,-$3C12(a5)
	move.w	d0,-$3C10(a5)
loc_0AD660:
	move.l	$8(a6),-(a7)
	jsr	$4212(a5)	; -> Cam_DefaultUpdate
	addq.w	#$4,a7
	movem.l	-$C(a6),d3/d6-d7
	unlk	a6
	rts
