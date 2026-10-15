; ---------------------------------------------------------------------------
; loc_1E16D4	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_1E16D4:
	moveq	#$A,d0
	moveq	#-$A,d1
	moveq	#$A,d2
	bra.s	loc_1E16E2
loc_1E16DC:
	moveq	#$A,d0
	moveq	#$A,d1
	moveq	#$A,d2
loc_1E16E2:
	tst.b	-$19(a6)
	beq.s	loc_1E16EA
	neg.w	d0
loc_1E16EA:
	move.w	d0,-$12(a6)
	move.w	d1,-$14(a6)
	move.w	-$6(a6),d7
	move.w	-$8(a6),d6
	add.w	-$348E(a5),d7
	add.w	-$3490(a5),d6
	moveq	#$0,d3
	move.b	-$35CA(a5),d3
	seq.b	d3
	moveq	#$0,d5
	moveq	#$0,d4
	move.b	$D(a4),d5
loc_1E1712:
	pea.l	($1).w
	pea.l	($7800).w
	move.l	d3,-(a7)
	move.w	d6,d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	lea.l	$18(a7),a7
	tst.b	d0
	bne.s	loc_1E174A
	add.w	-$12(a6),d7
	add.w	-$14(a6),d6
	add.w	d2,d4
	cmp.w	d4,d5
	bge.s	loc_1E1712
	moveq	#-$1,d7
	moveq	#-$1,d6
	bra.s	loc_1E1772
loc_1E174A:
	moveq	#$20,d0
	or.l	d0,$90(a3)
	moveq	#$0,d0
	move.b	$C(a4),d0
	add.w	d0,d0
	lea.l	$1E190C(pc),a0
	adda.w	(a0,d0.w),a0
	jmp	(a0)
loc_1E1762:
	move.w	d4,d7
	moveq	#-$1,d6
	bra.s	loc_1E1772
