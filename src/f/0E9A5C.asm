; ---------------------------------------------------------------------------
; sub_0E9A5C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9A5C:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	cmpi.w	#$1B,d7
	bne.s	loc_0E9A7E
	moveq	#$1B,d0
	cmp.l	-$3B14(a5),d0
	beq.s	loc_0E9A7E
	move.b	#$1,-$3BE0(a5)
	clr.b	-$3BDD(a5)
loc_0E9A7E:
	ext.l	d7
	move.l	d7,-$3B14(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
