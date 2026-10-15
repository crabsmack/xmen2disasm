; ---------------------------------------------------------------------------
; Seg_AlignObjVelocity - turn a walker's velocity into motion along its segment (slope applied, vertical segments rotate it), then re-place it with Seg_ApplyObjPos
; In:  8(a6) = object (+$76 segment, +$16/+$18 velocity)
; Out: d0
; Evidence: type hook message 2 first; vertical types 1/2: new vy = +vx / -vx, new vx = slope * vy >> 8; sloped types: vy = slope * vx >> 8; flat $13-$1C: vy = 0; type $22 reversed; types 5-$D untouched; then Seg_ApplyObjPos
; ---------------------------------------------------------------------------
Seg_AlignObjVelocity:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$76(a4),a3
	move.l	a3,d0
	beq.w	loc_1F6FEA
	move.b	$1(a3),d0
	ext.w	d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),g_SegHookTmp(a5)
	beq.s	loc_1F6F08
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	movea.l	g_SegHookTmp(a5),a0
	jsr	(a0)
	tst.w	d0
	lea.l	$10(a7),a7
	bra.s	loc_1F6F0A
loc_1F6F08:
	moveq	#$0,d0
loc_1F6F0A:
	beq.s	loc_1F6F18
	move.l	a4,-(a7)
	jsr	Seg_ApplyObjPos(pc)
	addq.w	#$4,a7
	bra.w	loc_1F6FEA
loc_1F6F18:
	clr.w	d7
	clr.w	d6
	move.b	$1(a3),d0
	subq.b	#$1,d0
	bmi.w	Seg_AlignObjVelocity_Store
	cmpi.b	#$21,d0
	bgt.w	Seg_AlignObjVelocity_Store
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F6EC4(pc,d1.w),d1
	jmp	Sw_1F6EC4-2(pc,d1.w)
