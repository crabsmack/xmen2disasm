; ---------------------------------------------------------------------------
; sub_10B98A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_10B98A:
	link.w	a6,#$0
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	movea.l	-$3BC4(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	tst.b	-$38DE(a5)
	addq.w	#$4,a7
	beq.s	loc_10B9C4
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	movea.l	-$3BC4(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_10B9C4:
	unlk	a6
	rts
