; ---------------------------------------------------------------------------
; Tank_OnDeath - TANK slot +$72 (XNPC OnDeath): blow up into debris, become a wreck and drop anything riding on it
; In:  8(a6) = this
; Out: d0
; Evidence: ExplodeFx_ChainStart(new object, ... box centre, path jt $3F7A); health 0, +$6A = 10000; state Tank_StateWreck after 33 frames; Seg_ForEachOfObj(Actor_FreeSegCb) and Obj_Detach of objects standing on its segment +$7A; clears +6 $200
; ---------------------------------------------------------------------------
Tank_OnDeath:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,-$4(a6)
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,-$2(a6)
	clr.w	d4
	move.b	$42(a3),d4
	move.b	$43(a3),d5
	moveq	#$4,d6
	and.b	$2E(a3),d6
	moveq	#$8,d0
	and.w	$6(a3),d0
	beq.s	loc_141BC2
	moveq	#$1,d0
	bra.s	loc_141BC4
loc_141BC2:
	moveq	#$0,d0
loc_141BC4:
	move.b	d0,d7
	jsr	$4DCA(a5)	; -> sub_1F4A1A
	movea.l	d0,a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$3D7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	-$4(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.b	d7,d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.b	d6,d1
	move.l	d1,-(a7)
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d1
	move.b	d4,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$3AEA(a5)	; -> ExplodeFx_ChainStart
	clr.w	$68(a3)
	move.w	#$2710,$6A(a3)
	clr.w	$1E(a3)
	clr.w	$16(a3)
	andi.w	#$FFFB,$4(a3)
	lea.l	Tank_StateWreck(pc),a0
	move.l	a0,$5C(a3)
	move.w	#$21,$6C(a3)
	move.w	#$200,d0
	and.w	$6(a3),d0
	lea.l	$28(a7),a7
	beq.s	loc_141CB2
	pea.l	$40CA(a5)
	move.l	a3,-(a7)
	jsr	$4F2A(a5)	; -> Seg_ForEachOfObj
	moveq	#$0,d0
	move.b	$7A(a3),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$8(a6)
	clr.w	d7
	movea.l	g_ObjTable(a5),a0
	movea.l	(a0),a4
	addq.w	#$8,a7
	bra.s	loc_141CA6
loc_141C6C:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_141C96
	move.l	$76(a4),d0
	cmp.l	-$8(a6),d0
	bne.s	loc_141C96
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	addq.w	#$4,a7
loc_141C96:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_141CA6:
	cmp.w	g_ObjCount(a5),d7
	blt.s	loc_141C6C
	andi.w	#$FDFF,$6(a3)
loc_141CB2:
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
