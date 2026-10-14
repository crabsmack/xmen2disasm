; ---------------------------------------------------------------------------
; sub_09907A
; ---------------------------------------------------------------------------
sub_09907A:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1000,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0990AC
	ori.l	#$200000,-$16C8(a5)
loc_0990AC:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0990CC
	ori.l	#$200000,-$17B8(a5)
loc_0990CC:
	tst.l	-$3B30(a5)
	bne.s	loc_0990D6
	move.l	a4,-$3B30(a5)
loc_0990D6:
	move.w	-$3A90(a5),d0
	cmp.w	-$3B2C(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0990EA
	move.w	-$3A90(a5),d0
	bra.s	loc_0990EE
loc_0990EA:
	move.w	-$3B2C(a5),d0
loc_0990EE:
	move.w	d0,d4
	move.w	$A4(a4),d0
	ext.l	d0
	moveq	#$20,d1
	sub.l	d1,d0
	move.w	-$3A94(a5),d2
	ext.l	d2
	cmp.l	d2,d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_099110
	move.w	-$3A94(a5),d0
	ext.l	d0
	bra.s	loc_099118
loc_099110:
	move.w	$A4(a4),d0
	sub.w	#$20,d0
loc_099118:
	move.w	d0,d5
	move.w	-$3B2A(a5),d0
	ext.l	d0
	sub.l	#$140,d0
	move.w	-$3A8E(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_09913C
	move.w	-$3A8E(a5),d0
	ext.l	d0
	bra.s	loc_099144
loc_09913C:
	move.w	-$3B2A(a5),d0
	sub.w	#$140,d0
loc_099144:
	move.w	d0,d6
	move.w	$A6(a4),d0
	ext.l	d0
	add.l	#$FFFFFF40,d0
	move.w	-$3A92(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_099168
	move.w	-$3A92(a5),d0
	ext.l	d0
	bra.s	loc_099170
loc_099168:
	move.w	$A6(a4),d0
	add.w	#$FF40,d0
loc_099170:
	move.w	d0,d7
	move.w	d4,-$3B0A(a5)
	move.w	d5,-$3B0C(a5)
	move.w	d6,-$3B0E(a5)
	move.w	d7,-$3B10(a5)
	lea.l	sub_099BBE(pc),a0
	movea.l	-$35B6(a5),a1
	move.l	a0,$1C(a1)
	move.b	#$1,-$3892(a5)
	jsr	$5242(a5)	; -> sub_1FE5F2
	move.l	a4,-(a7)
	jsr	sub_098CC8(pc)
	subq.w	#$1,d0
	addq.w	#$4,a7
	bmi.s	loc_0991DC
	cmpi.w	#$6,d0
	bgt.s	loc_0991DC
	add.w	d0,d0
	move.w	$991B4(pc,d0.w),d0
	jmp	$991B2(pc,d0.w)
