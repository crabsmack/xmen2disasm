; ---------------------------------------------------------------------------
; sub_064C66	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064C66:
	link.w	a6,#$0
	move.l	d7,-(a7)
	clr.w	d7
	bra.s	loc_064C92
loc_064C70:
	movea.l	-$3B28(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C90
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C90
	move.w	d7,d0
	bra.s	loc_064C9A
loc_064C90:
	addq.w	#$1,d7
loc_064C92:
	cmp.w	-$3B0E(a5),d7
	blt.s	loc_064C70
	moveq	#-$1,d0
loc_064C9A:
	move.l	-$4(a6),d7
	unlk	a6
	rts
