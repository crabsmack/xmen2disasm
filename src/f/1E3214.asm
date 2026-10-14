; ---------------------------------------------------------------------------
; sub_1E3214	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1E3214:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1E2F24(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1E323E
	move.l	a4,-(a7)
	jsr	sub_1E2CBC(pc)
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	addq.w	#$4,a7
loc_1E323E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
