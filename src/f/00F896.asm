; ---------------------------------------------------------------------------
; sub_00F896	[link-after-rts]
; ---------------------------------------------------------------------------
sub_00F896:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	clr.w	-$3A26(a5)
	clr.w	-$3A28(a5)
	clr.w	-$3A2E(a5)
	clr.w	-$3A30(a5)
	moveq	#$78,d0
	cmp.w	-$3B32(a5),d0
	bgt.s	loc_00F8CA
	clr.w	-$3B32(a5)
	clr.w	-$3AC8(a5)
	lea.l	sub_00F942(pc),a0
	movea.l	-$35B6(a5),a1
	move.l	a0,$4(a1)
loc_00F8CA:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F8EE
	clr.w	-$173A(a5)
	clr.l	-$1742(a5)
	clr.w	-$1738(a5)
loc_00F8EE:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F912
	clr.w	-$182A(a5)
	clr.l	-$1832(a5)
	clr.w	-$1828(a5)
loc_00F912:
	move.w	-$348E(a5),d6
	tst.b	-$38DE(a5)
	beq.s	loc_00F920
	moveq	#$4,d0
	bra.s	loc_00F922
loc_00F920:
	moveq	#$2,d0
loc_00F922:
	ext.w	d0
	move.w	-$3490(a5),d7
	sub.w	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_00FC12(pc)
	addq.w	#$8,a7
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
