; ---------------------------------------------------------------------------
; sub_0C122A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C122A:
	link.w	a6,#$0
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_0C1244
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
loc_0C1244:
	moveq	#$1F,d0
	and.l	-$35A2(a5),d0
	beq.s	loc_0C1250
	jsr	sub_0C1412(pc)
loc_0C1250:
	jsr	$21FA(a5)	; -> sub_0BF8DC
	unlk	a6
	rts
