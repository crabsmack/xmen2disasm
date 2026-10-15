; ---------------------------------------------------------------------------
; loc_02D0B8	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_02D0B8:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D0CA
	subq.b	#$1,d0
	beq.s	loc_02D0DE
	bra.s	loc_02D0F2
loc_02D0CA:
	clr.w	$6C(a4)
	lea.l	sub_02D21C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02D13E
loc_02D0DE:
	clr.w	$6C(a4)
	lea.l	sub_02D27A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02D13E
loc_02D0F2:
	move.l	a4,-(a7)
	jsr	sub_02CE52(pc)
	addq.w	#$4,a7
	bra.s	loc_02D13E
loc_02D0FC:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D10E
	subq.b	#$1,d0
	beq.s	loc_02D122
	bra.s	loc_02D136
loc_02D10E:
	clr.w	$6C(a4)
	lea.l	sub_02D2D8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02D13E
loc_02D122:
	clr.w	$6C(a4)
	lea.l	sub_02D1A6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02D13E
loc_02D136:
	move.l	a4,-(a7)
	jsr	sub_02CE52(pc)
	addq.w	#$4,a7
