; ---------------------------------------------------------------------------
; Wolverine_StateWallClimb - one climbing step on a wall; at the top/bottom either cling or move onto a ceiling
; In:  8(a6) = player
; Out: d0
; Evidence: anim done -> stop, frame $1B/$20, sound 99, delay 14, Wolverine_StateWallCling; blocked (+$90 $3C000) -> flip claw phase, cling; touched a segment classified 1 (ceiling) -> Wolverine_WallToCeiling
; ---------------------------------------------------------------------------
Wolverine_StateWallClimb:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.w	loc_196866
	move.l	#$3C000,d0
	and.l	$90(a4),d0
	beq.s	loc_1967A6
	tst.b	$9D(a4)
	bne.s	loc_19676C
	moveq	#-$4,d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_196776
loc_19676C:
	moveq	#-$4,d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_196776:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$C2(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_19678A
	moveq	#$1,d1
	bra.s	loc_19678C
loc_19678A:
	moveq	#$0,d1
loc_19678C:
	move.b	d1,$C2(a4)
	clr.w	$6C(a4)
	lea.l	Wolverine_StateWallCling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1968C8
loc_1967A6:
	move.w	#$80,d0
	and.w	$4(a4),d0
	bne.s	loc_1967BE
	move.l	#$30000,d0
	and.l	$90(a4),d0
	beq.w	loc_196852
loc_1967BE:
	moveq	#$0,d0
	move.b	$7B(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$F2(a0),a1
	jsr	(a1)
	move.w	d0,d7
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_1967F8
	moveq	#-$4,d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_196802
loc_1967F8:
	moveq	#-$4,d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_196802:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$C2(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196816
	moveq	#$1,d1
	bra.s	loc_196818
loc_196816:
	moveq	#$0,d1
loc_196818:
	move.b	d1,$C2(a4)
	cmpi.w	#$1,d7
	bne.s	loc_196836
	lea.l	Wolverine_WallToCeiling(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Wolverine_WallToCeiling(pc)
	addq.w	#$4,a7
	bra.w	loc_1968C8
loc_196836:
	clr.w	$18(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	Wolverine_StateWallCling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1968C8
loc_196852:
	clr.w	$6C(a4)
	lea.l	Wolverine_StateWallClimb(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1968C8
loc_196866:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.b	$C2(a4)
	bne.s	loc_19688A
	moveq	#$1B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_19689A
loc_19688A:
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_19689A:
	andi.l	#$FFFFFFDF,$90(a4)
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	move.w	#$E,$6C(a4)
	lea.l	Wolverine_StateWallCling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1968C8:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
