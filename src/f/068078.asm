; ---------------------------------------------------------------------------
; sub_068078	[link-after-rts]
; ---------------------------------------------------------------------------
sub_068078:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.b	$3C(a4),d0
	ext.w	d0
	move.w	d0,d6
	cmpi.w	#$FFFF,d6
	beq.s	loc_0680B2
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_064BF0(pc)
	move.w	d0,d7
	cmp.w	d7,d6
	addq.w	#$4,a7
	beq.s	loc_068100
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068100
loc_0680B2:
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_0680E0
	tst.w	-$38A8(a5)
	beq.s	loc_068100
	jsr	sub_064C66(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068100
	subq.w	#$1,-$38A8(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068100
loc_0680E0:
	tst.w	-$38AA(a5)
	beq.s	loc_068100
	jsr	sub_064C66(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068100
	subq.w	#$1,-$38AA(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
loc_068100:
	tst.b	$33(a4)
	bne.s	loc_06810A
	clr.b	$34(a4)
loc_06810A:
	clr.w	$6C(a3)
	lea.l	sub_067E5E(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
