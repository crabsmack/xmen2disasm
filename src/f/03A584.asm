; ---------------------------------------------------------------------------
; loc_03A584	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_03A584:
	move.l	a4,-(a7)
	jsr	sub_03A2F4(pc)
	addq.w	#$4,a7
	bra.s	loc_03A5B4
loc_03A58E:
	move.l	a4,-(a7)
	jsr	sub_03A2F4(pc)
	addq.w	#$4,a7
	bra.s	loc_03A5B4
loc_03A598:
	move.w	$9C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$90(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8C(a4),-(a7)
	jsr	sub_039E94(pc)
	lea.l	$C(a7),a7
