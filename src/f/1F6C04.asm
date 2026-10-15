; ---------------------------------------------------------------------------
; Seg_LoadList - create floor segments from a ROM segment list (FG list or appended BG list)
; In:  8(a6) = segment list   $C(a6) = byte: 0 = first list, 1 = append (link indexes offset, flag 4)
; Out: none
; Evidence: records until a 0 byte: {byte type (bits 0-5) | $40 no-links, byte extra, words x1 y1 x2 y2, word, then if linked byte prev, byte next} = 12 bytes, 10 without links; each initialised by Seg_Setup into -$33D2 records; updates -$3470/-$3472/-$3474; then sub_1F84BE builds the lookup grid (data reader of the level segment lists)
; ---------------------------------------------------------------------------
Seg_LoadList:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.b	$F(a6),d7
	lea.l	g_Segs(a5),a0
	move.w	g_SegFirstFree(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	movea.l	d0,a3
	adda.l	a0,a3
	move.w	g_SegFirstFree(a5),d5
	move.w	d5,d6
	movea.l	$8(a6),a4
	bra.w	loc_1F6D30
loc_1F6C34:
	move.w	$8(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$2(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$3F,d0
	and.b	(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	jsr	Seg_Setup(pc)
	moveq	#$40,d0
	and.b	(a4),d0
	lea.l	$1C(a7),a7
	beq.s	loc_1F6C92
	move.b	#$FF,$10(a3)
	move.b	#$FF,$11(a3)
	lea.l	$C(a4),a4
	move.l	a4,d0
	subq.l	#$2,d0
	movea.l	d0,a4
	bra.w	loc_1F6D20
loc_1F6C92:
	tst.b	d7
	bne.s	loc_1F6CD8
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CAA
	moveq	#-$1,d0
	bra.s	loc_1F6CB2
loc_1F6CAA:
	moveq	#$0,d0
	move.b	$A(a4),d0
	tst.l	d0
loc_1F6CB2:
	move.b	d0,$10(a3)
	moveq	#$0,d0
	move.b	$B(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CCA
	moveq	#-$1,d0
	bra.s	loc_1F6CD2
loc_1F6CCA:
	moveq	#$0,d0
	move.b	$B(a4),d0
	tst.l	d0
loc_1F6CD2:
	move.b	d0,$11(a3)
	bra.s	loc_1F6D1C
loc_1F6CD8:
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CEC
	moveq	#-$1,d0
	bra.s	loc_1F6CF6
loc_1F6CEC:
	moveq	#$0,d0
	move.b	$A(a4),d0
	ext.l	d6
	add.l	d6,d0
loc_1F6CF6:
	move.b	d0,$10(a3)
	moveq	#$0,d0
	move.b	$B(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6D0E
	moveq	#-$1,d0
	bra.s	loc_1F6D18
loc_1F6D0E:
	moveq	#$0,d0
	move.b	$B(a4),d0
	ext.l	d6
	add.l	d6,d0
loc_1F6D18:
	move.b	d0,$11(a3)
loc_1F6D1C:
	lea.l	$C(a4),a4
loc_1F6D20:
	tst.b	d7
	beq.s	loc_1F6D28
	ori.b	#$4,(a3)
loc_1F6D28:
	lea.l	$14(a3),a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1F6D30:
	tst.b	(a4)
	bne.w	loc_1F6C34
	tst.b	d7
	bne.s	loc_1F6D3E
	move.w	d5,g_SegLevelCount(a5)
loc_1F6D3E:
	move.w	d5,g_SegFirstFree(a5)
	move.w	d5,d0
	subq.w	#$1,d0
	move.w	d0,g_SegHighWater(a5)
	movea.l	g_HeapTop(a5),a3
	pea.l	Str_Empty_1F6D74(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	jsr	sub_1F84BE(pc)
	move.l	g_HeapTop(a5),(a3)
	move.l	g_HeapTop(a5),-$33D6(a5)
	addq.w	#$8,a7
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
