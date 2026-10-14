; ---------------------------------------------------------------------------
; sub_022A1C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_022A1C:
	link.w	a6,#$0
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_022A32
	jsr	sub_0228DC(pc)
loc_022A32:
	tst.b	-$38DE(a5)
	beq.s	loc_022A4A
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_022A4A
	jsr	sub_0228DC(pc)
loc_022A4A:
	unlk	a6
	rts
