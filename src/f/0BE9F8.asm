; ---------------------------------------------------------------------------
; sub_0BE9F8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE9F8:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0BEA68
	tst.w	$6A(a4)
	bne.s	loc_0BEA68
	cmp.w	$56(a4),d7
	blt.s	loc_0BEA68
	cmp.w	$5A(a4),d7
	bgt.s	loc_0BEA68
	cmp.w	$54(a4),d6
	blt.s	loc_0BEA68
	cmp.w	$58(a4),d6
	bgt.s	loc_0BEA68
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$14(a6),-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	lea.l	$18(a7),a7
	bra.s	loc_0BEA6A
loc_0BEA68:
	moveq	#$0,d0
loc_0BEA6A:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
