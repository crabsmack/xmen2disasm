; ---------------------------------------------------------------------------
; sub_013A86	[link-after-rts]
; ---------------------------------------------------------------------------
sub_013A86:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_013AA2
	move.l	#$8000,d0
	bra.s	loc_013AA4
loc_013AA2:
	moveq	#$0,d0
loc_013AA4:
	move.l	d0,d6
	lea.l	$292(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_013ABA
	moveq	#$1E,d7
	moveq	#-$32,d5
	bra.s	loc_013AD2
loc_013ABA:
	lea.l	$29A(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_013AD2
	moveq	#$12,d7
	moveq	#-$22,d5
	ori.l	#$1,d6
loc_013AD2:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	$8(a4),d0
	move.l	d0,-$4(a6)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,d4
	add.l	$C(a4),d4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_013B02
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	ori.l	#$800,d6
loc_013B02:
	ori.l	#$2,d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> sub_119190
	tst.w	$AE(a4)
	lea.l	$18(a7),a7
	ble.s	loc_013B2C
	subq.w	#$1,$AE(a4)
loc_013B2C:
	tst.w	$AE(a4)
	ble.s	loc_013B62
	moveq	#-$1,d0
	cmp.w	$AC(a4),d0
	bne.s	loc_013B4C
	lea.l	sub_013A86(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_013A86(pc)
	addq.w	#$4,a7
	bra.s	loc_013BA4
loc_013B4C:
	move.w	$AC(a4),$6C(a4)
	lea.l	sub_013A86(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_013BA4
loc_013B62:
	tst.l	$98(a4)
	bne.s	loc_013B76
	move.l	$64(a4),$5C(a4)
	move.w	#$1A,$6C(a4)
	bra.s	loc_013BA4
loc_013B76:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_013B8A
	clr.w	$96(a4)
loc_013B8A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1A,$6C(a4)
loc_013BA4:
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
