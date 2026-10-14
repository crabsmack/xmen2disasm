; ---------------------------------------------------------------------------
; sub_13FDA2	[jt 1904]
; ---------------------------------------------------------------------------
sub_13FDA2:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$8B(a4)
	bne.s	loc_13FE1C
	lea.l	$3BC2(a5),a0
	movea.l	$2(a0),a3
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a3,d0
	movea.l	d0,a0
	cmpi.w	#$100,(a0)
	blt.s	loc_13FDD2
	clr.w	$9A(a4)
loc_13FDD2:
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	adda.l	d0,a3
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$92(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$96(a4)
	move.w	(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$92(a4),d0
	move.l	d0,$8(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$96(a4),d0
	move.l	d0,$C(a4)
	moveq	#$1,d0
	and.l	-$35A2(a5),d0
	beq.s	loc_13FE2C
	addq.w	#$1,$9A(a4)
	bra.s	loc_13FE2C
loc_13FE1C:
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$3ECA(a5)	; -> sub_15A19C
	addq.w	#$8,a7
loc_13FE2C:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
