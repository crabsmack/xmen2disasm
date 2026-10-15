; ---------------------------------------------------------------------------
; sub_112754	[link-after-rts]
; ---------------------------------------------------------------------------
sub_112754:
	link.w	a6,#$FFF8
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	moveq	#$50,d1
	sub.l	d1,d0
	move.w	-$3490(a5),d2
	ext.l	d2
	add.l	#$E0,d2
	cmp.l	d0,d2
	bge.s	loc_1127DA
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($F0).w
	jsr	$4F8A(a5)	; -> sub_1F944E
	movea.l	-$3BC4(a5),a0
	tst.b	$10(a0)
	lea.l	$C(a7),a7
	bne.s	loc_1127BA
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	movea.l	-$3BC4(a5),a0
	move.w	#$78,$8(a0)
	addq.w	#$4,a7
loc_1127BA:
	movea.l	-$3BC4(a5),a0
	move.w	#$78,$A(a0)
	clr.w	$6C(a4)
	lea.l	sub_11286E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_112864
loc_1127DA:
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	g_FrameCounter(a5),-(a7)
	pea.l	-$3940(a5)
	jsr	$4DAA(a5)	; -> Mem_Copy
	move.b	#$1,-$3A06(a5)
	moveq	#$2,d0
	and.l	g_FrameCounter(a5),d0
	lea.l	$C(a7),a7
	beq.s	loc_112850
	moveq	#$1,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_112850
	move.l	$8(a4),d0
	add.l	#$FFFFF300,d0
	move.l	d0,-$4(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$4(a6),d0
	move.l	d1,d6
	add.l	d0,d6
	move.l	$C(a4),d0
	add.l	#$FFFFE400,d0
	move.l	d0,-$8(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$8(a6),d0
	move.l	d1,d7
	add.l	d0,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	lea.l	$C(a7),a7
loc_112850:
	move.w	#$2,$6C(a4)
	lea.l	sub_112754(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112864:
	movem.l	-$14(a6),d6-d7/a4
	unlk	a6
	rts
