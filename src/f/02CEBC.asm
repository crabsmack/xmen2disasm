; ---------------------------------------------------------------------------
; loc_02CEBC	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
loc_02CEBC:
	tst.w	$A(a4)
	beq.s	loc_02CEC8
	move.w	$A(a4),d0
	bra.s	loc_02CECA
loc_02CEC8:
	moveq	#$4,d0
loc_02CECA:
	move.b	d0,$A8(a3)
	bra.s	loc_02CEF6
loc_02CED0:
	tst.w	$C(a4)
	beq.s	loc_02CEDC
	move.w	$C(a4),d0
	bra.s	loc_02CEDE
loc_02CEDC:
	moveq	#$5,d0
loc_02CEDE:
	move.b	d0,$A8(a3)
	bra.s	loc_02CEF6
loc_02CEE4:
	tst.w	$E(a4)
	beq.s	loc_02CEF0
	move.w	$E(a4),d0
	bra.s	loc_02CEF2
loc_02CEF0:
	moveq	#$1,d0
loc_02CEF2:
	move.b	d0,$A8(a3)
