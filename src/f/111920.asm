; ---------------------------------------------------------------------------
; loc_111920	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_111920:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.b	$AE(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_111964
	andi.b	#$EF,$2E(a4)
	move.w	-$348E(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	-$3490(a5),d0
	ext.l	d0
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$200,$16(a4)
	bra.s	loc_111992
loc_111964:
	ori.b	#$10,$2E(a4)
	move.w	-$348E(a5),d0
	ext.l	d0
	add.l	#$1A4,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	-$3490(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$FE00,$16(a4)
loc_111992:
	move.w	#$200,$18(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	bra.w	$111BA0
loc_1119B2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	add.l	d1,d0
	move.w	-$348E(a5),d2
	ext.l	d2
	cmp.l	d0,d2
	ble.s	loc_1119DA
	move.b	#$1,$AE(a4)
	bra.s	loc_1119E0
loc_1119DA:
	move.b	#$2,$AE(a4)
loc_1119E0:
	move.w	#$A,$6E(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	$111BA0
