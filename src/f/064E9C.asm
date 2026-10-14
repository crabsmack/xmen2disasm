; ---------------------------------------------------------------------------
; sub_064E9C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064E9C:
	link.w	a6,#$0
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_064EB6
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
loc_064EB6:
	jsr	$50FA(a5)	; -> sub_1FDA56
	moveq	#$2,d0
	cmp.w	-$3B02(a5),d0
	bne.s	loc_064ED6
	move.w	-$3A28(a5),d0
	or.w	-$3A26(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_064ED6
	clr.w	-$3B02(a5)
loc_064ED6:
	jsr	sub_064CA2(pc)
	unlk	a6
	rts
