; ---------------------------------------------------------------------------
; sub_1E3322	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1E3322:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3342
	move.w	-$3B9E(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E334A
loc_1E3342:
	move.w	-$3B9E(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E334A:
	beq.w	loc_1E33D8
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3362
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E336A
loc_1E3362:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E336A:
	beq.s	loc_1E33A2
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A52(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1E31BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E31BA(pc)
	lea.l	$18(a7),a7
	bra.w	loc_1E34B0
loc_1E33A2:
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1E31BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E31BA(pc)
	lea.l	$18(a7),a7
	bra.w	loc_1E34B0
loc_1E33D8:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E33EC
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E33F4
loc_1E33EC:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E33F4:
	beq.w	loc_1E347E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E340C
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E3414
loc_1E340C:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E3414:
	beq.s	loc_1E344A
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A4A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A3A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1E31BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E31BA(pc)
	lea.l	$18(a7),a7
	bra.s	loc_1E34B0
loc_1E344A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A32(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1E31BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E31BA(pc)
	lea.l	$18(a7),a7
	bra.s	loc_1E34B0
loc_1E347E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A22(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1E31BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E31BA(pc)
	lea.l	$18(a7),a7
loc_1E34B0:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
