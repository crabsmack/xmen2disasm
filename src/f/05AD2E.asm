; ---------------------------------------------------------------------------
; Boulder_FindFloorBelow - BOULDER: find the nearest solid floor segment (type 3) below it and store its id in +$42
; In:  8(a6) = this
; Out: none
; Evidence: segment list for its map cell (Seg_GridCell -> index into the -$3478 table); segment records at -$33D2 + id*$14 (+0 flag $80, +1 type, +2 id, +6/+$A x range, +8 y)
; ---------------------------------------------------------------------------
Boulder_FindFloorBelow:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,d4
	move.w	#$2710,d5
	clr.b	$42(a3)
	addq.w	#$8,a7
	bra.w	loc_05ADF0
loc_05AD66:
	move.w	-$6(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_05AD90
	move.w	$8(a4),d0
	bra.s	loc_05AD94
loc_05AD90:
	move.w	$C(a4),d0
loc_05AD94:
	move.w	d0,-$4(a6)
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_05ADAC
	move.w	$8(a4),d0
	bra.s	loc_05ADB0
loc_05ADAC:
	move.w	$C(a4),d0
loc_05ADB0:
	move.w	d0,-$2(a6)
	move.w	$A(a4),d7
	sub.w	-$8(a6),d7
	tst.w	d7
	blt.s	loc_05ADEC
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_05ADEC
	cmp.w	-$4(a6),d6
	blt.s	loc_05ADEC
	cmp.w	-$2(a6),d6
	bgt.s	loc_05ADEC
	moveq	#$3,d0
	cmp.b	$1(a4),d0
	bne.s	loc_05ADEC
	cmp.w	d7,d5
	ble.s	loc_05ADEC
	move.b	$2(a4),$42(a3)
	move.w	d7,d5
loc_05ADEC:
	move.w	d4,d0
	addq.w	#$1,d4
loc_05ADF0:
	movea.l	-$3478(a5),a0
	moveq	#$0,d0
	move.b	(a0,d4.w),d0
	move.w	d0,-$6(a6)
	cmpi.w	#$FF,d0
	bne.w	loc_05AD66
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
