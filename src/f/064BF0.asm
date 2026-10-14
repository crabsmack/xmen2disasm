; ---------------------------------------------------------------------------
; sub_064BF0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064BF0:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	$A(a6),d6
	cmpi.w	#$FFFF,d6
	beq.s	loc_064C5A
	move.w	d6,d7
	addq.w	#$1,d7
	bra.s	loc_064C2A
loc_064C08:
	movea.l	-$3B28(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C28
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C28
	move.w	d7,d0
	bra.s	loc_064C5C
loc_064C28:
	addq.w	#$1,d7
loc_064C2A:
	cmp.w	-$3B0E(a5),d7
	blt.s	loc_064C08
	clr.w	d7
	bra.s	loc_064C56
loc_064C34:
	movea.l	-$3B28(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C54
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064C54
	move.w	d7,d0
	bra.s	loc_064C5C
loc_064C54:
	addq.w	#$1,d7
loc_064C56:
	cmp.w	d7,d6
	bgt.s	loc_064C34
loc_064C5A:
	move.w	d6,d0
loc_064C5C:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
