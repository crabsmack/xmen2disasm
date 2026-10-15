; ---------------------------------------------------------------------------
; sub_0DC2CE	[jt 1146]
; ---------------------------------------------------------------------------
sub_0DC2CE:
	link.w	a6,#$0
	tst.w	-$3B32(a5)
	bne.s	loc_0DC30E
	move.w	#$5,-$3B32(a5)
	tst.w	-$3B3A(a5)
	bne.s	loc_0DC2EA
	move.w	#$4,-$3B3A(a5)
loc_0DC2EA:
	subq.w	#$1,-$3B3A(a5)
	move.w	-$3B3A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> sub_1FAD44
	lea.l	$10(a7),a7
loc_0DC30E:
	subq.w	#$1,-$3B32(a5)
	unlk	a6
	rts
