; ---------------------------------------------------------------------------
; sub_0477B4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0477B4:
	link.w	a6,#$0
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_0477CE
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
loc_0477CE:
	movea.l	-$3B14(a5),a0
	tst.w	$84(a0)
	beq.s	loc_0477DC
	jsr	sub_0473D4(pc)
loc_0477DC:
	jsr	sub_04744E(pc)
	unlk	a6
	rts
