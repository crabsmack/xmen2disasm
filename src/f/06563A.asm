; ---------------------------------------------------------------------------
; loc_06563A	[runtime: executed in fuzz-01800-s1+fuzz-01800-s2+fuzz-03600-s1+fuzz-03600-s2+fuzz-05400-s1+fuzz-05400-s2+fuzz-07200-s1+fuzz-07200-s2+fuzz-09000-s1+fuzz-09000-s2+fuzz-10800-s1+fuzz-10800-s2+fuzz-12600-s1+fuzz-12600-s2+fuzz-14400-s1+fuzz-14400-s2+fuzz-16200-s1+fuzz-16200-s2+fuzz-18000-s1+fuzz-18000-s2+fuzz-19800-s1+fuzz-19800-s2+fuzz-21600-s1+fuzz-21600-s2+fuzz-23400-s1+fuzz-23400-s2+fuzz-25200-s1+fuzz-25200-s2+fuzz-27000-s1+fuzz-27000-s2+fuzz-28800-s1+fuzz-28800-s2+fuzz-30600-s1+fuzz-30600-s2+fuzz-32400-s1+fuzz-32400-s2+fuzz-34200-s1+fuzz-34200-s2+fuzz-36000-s1+fuzz-36000-s2+fuzz-37800-s1+fuzz-37800-s2+fuzz-39600-s1+fuzz-39600-s2+fuzz-41400-s1+fuzz-41400-s2+fuzz-43200-s1+fuzz-43200-s2+fuzz-45000-s1+fuzz-45000-s2+fuzz-46800-s1+fuzz-46800-s2+fuzz-48600-s1+fuzz-48600-s2+fuzz-50400-s1+fuzz-50400-s2+fuzz-52200-s1+fuzz-52200-s2+fuzz-54000-s1+fuzz-54000-s2+fuzz-55800-s1+fuzz-55800-s2+idle+scenario-char-beast+scenario-char-cyclops+scenario-char-gambit+scenario-char-magneto+scenario-char-nightcrawler+scenario-char-psylocke+scenario-char-wolverine+scenario-continue+scenario-game-over+scenario-options-menu+scenario-two-player+tas]
; ---------------------------------------------------------------------------
loc_06563A:
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	move.w	(a4)+,-$3A04(a5)
	move.w	#$3,-$3B02(a5)
	clr.b	-$3A06(a5)
	lea.l	$C(a7),a7
	bra.s	loc_06569A
