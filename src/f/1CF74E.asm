; ---------------------------------------------------------------------------
; loc_1CF74E	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_1CF74E:
	clr.w	d4
	bra.s	loc_1CF760
loc_1CF752:
	move.w	#$1000,d4
	bra.s	loc_1CF760
loc_1CF758:
	clr.w	d4
	bra.s	loc_1CF760
loc_1CF75C:
	move.w	#$1800,d4
loc_1CF760:
	ext.l	d6
	move.w	-$3490(a5),d0
	ext.l	d0
	add.l	d6,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.w	-$348E(a5),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1CF36E(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	bne.s	loc_1CF7F0
	lea.l	g_SpriteTable(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d6,d0
	sub.w	#$FF84,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	move.w	#$2000,d0
	or.w	-$E(a6),d0
	ext.l	d0
	move.l	#$8000,d1
	or.l	d0,d1
	ext.l	d4
	move.l	d4,d0
	or.l	d1,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	move.w	d5,d0
	sub.w	#$FF84,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
