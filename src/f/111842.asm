; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case2	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+tas]
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_111878
	move.w	#$350,$8C(a4)
	clr.w	$8E(a4)
	move.l	#$13100,-$3B20(a5)
	move.l	#$500,-$3B24(a5)
	moveq	#$0,d0
	move.l	d0,-$3B28(a5)
	bra.s	loc_111898
loc_111878:
	move.w	#$350,$8C(a4)
	clr.w	$8E(a4)
	move.l	#$EB00,-$3B20(a5)
	move.l	#$FFFFFB00,-$3B24(a5)
	moveq	#$0,d0
	move.l	d0,-$3B28(a5)
loc_111898:
	move.b	#$4,$AE(a4)
	lea.l	$2AD2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
loc_1118B2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
