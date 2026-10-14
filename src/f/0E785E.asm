; ---------------------------------------------------------------------------
; sub_0E785E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E785E:
	link.w	a6,#$0
	move.l	d7,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_0E786E
	moveq	#$2,d0
	bra.s	loc_0E7870
loc_0E786E:
	moveq	#$1,d0
loc_0E7870:
	move.l	d0,d7
loc_0E7872:
	addq.l	#$1,-$35A2(a5)
	tst.l	-$3B18(a5)
	ble.s	loc_0E7880
	subq.l	#$1,-$3B18(a5)
loc_0E7880:
	tst.b	-$3A02(a5)
	bne.s	loc_0E788A
	jsr	sub_0E7306(pc)
loc_0E788A:
	jsr	sub_0E76DA(pc)
	subq.l	#$1,d7
	bne.s	loc_0E7872
	move.l	-$4(a6),d7
	unlk	a6
	rts
