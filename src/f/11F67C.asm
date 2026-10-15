; ---------------------------------------------------------------------------
; sub_11F67C	[jt 1652]
; ---------------------------------------------------------------------------
sub_11F67C:
	link.w	a6,#$FFE6
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,-$10(a6)
	move.b	#$1,-$F(a6)
	clr.w	d6
	movea.l	$92(a4),a0
	move.w	(a0),-$16(a6)
	andi.w	#$FFFE,$98(a4)
loc_11F6A4:
	movea.l	$92(a4),a3
	addq.w	#$2,a3
	clr.w	d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	move.w	$AA(a4),d0
	asr.w	#$4,d0
	moveq	#$40,d1
	sub.w	d0,d1
	move.w	d1,d0
	move.w	d0,-$8(a6)
	asr.w	#$2,d0
	move.w	d0,-$A(a6)
	clr.w	d7
	bra.w	loc_11FA04
loc_11F6DC:
	tst.w	(a3)
	bge.s	loc_11F6E8
	tst.w	$2(a3)
	blt.w	loc_11FA14
loc_11F6E8:
	moveq	#$0,d0
	move.w	d7,d0
	tst.l	d0
	btst	#$0,d0
	beq.w	loc_11F83A
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-$1A(a6)
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$FF,d0
	cmpi.l	#$80,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F738
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_11F754
loc_11F738:
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	neg.l	d0
loc_11F754:
	move.l	-$1A(a6),d1
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	move.w	d0,-$6(a6)
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	moveq	#$40,d1
	add.l	d1,d0
	and.l	#$FF,d0
	cmpi.l	#$80,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F7A2
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	add.l	d1,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_11F7C2
loc_11F7A2:
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	moveq	#$40,d1
	add.l	d1,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	neg.l	d0
loc_11F7C2:
	move.l	-$1A(a6),d1
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	move.w	d0,-$4(a6)
	move.w	-$6(a6),d0
	ext.l	d0
	move.w	$4(a3),d1
	ext.l	d1
	lsl.l	#$1,d1
	and.l	#$FF,d1
	cmpi.l	#$80,d1
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F80C
	move.w	$4(a3),d1
	ext.l	d1
	lsl.l	#$1,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	bra.s	loc_11F826
loc_11F80C:
	move.w	$4(a3),d1
	ext.l	d1
	lsl.l	#$1,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	neg.l	d1
loc_11F826:
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	add.w	-$E(a6),d0
	move.w	d0,-$14(a6)
	bra.w	loc_11F96A
loc_11F83A:
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,-$1A(a6)
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$FF,d0
	cmpi.l	#$80,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F87C
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_11F898
loc_11F87C:
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	neg.l	d0
loc_11F898:
	move.l	-$1A(a6),d1
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	move.w	d0,-$6(a6)
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	moveq	#$40,d1
	add.l	d1,d0
	and.l	#$FF,d0
	cmpi.l	#$80,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F8E6
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	add.l	d1,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_11F906
loc_11F8E6:
	ext.l	d6
	move.w	$A8(a4),d0
	ext.l	d0
	add.l	d6,d0
	moveq	#$40,d1
	add.l	d1,d0
	and.l	#$7F,d0
	asl.w	#$2,d0
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d0.w),d0
	neg.l	d0
loc_11F906:
	move.l	-$1A(a6),d1
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	move.w	d0,-$4(a6)
	move.w	-$6(a6),d0
	ext.l	d0
	move.w	$4(a3),d1
	and.w	#$FF,d1
	moveq	#$0,d2
	move.w	d1,d2
	cmpi.w	#$80,d2
	scs.b	d3
	neg.b	d3
	beq.s	loc_11F946
	move.w	$4(a3),d1
	and.w	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	bra.s	loc_11F95A
loc_11F946:
	move.w	$4(a3),d1
	and.w	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	neg.l	d1
loc_11F95A:
	jsr	$3F9A(a5)	; -> Math_LMul
	swap	d0
	ext.l	d0
	add.w	-$E(a6),d0
	move.w	d0,-$14(a6)
loc_11F96A:
	move.w	$A6(a4),$4(a3)
	move.w	-$C(a6),d0
	sub.w	-$4(a6),d0
	move.w	d0,-$12(a6)
	move.w	#$100,d0
	and.w	$98(a4),d0
	beq.s	loc_11F9F0
	move.w	-$14(a6),d4
	sub.w	(a3),d4
	move.w	-$12(a6),d5
	sub.w	$2(a3),d5
	tst.w	d4
	bne.s	loc_11F99C
	tst.w	d5
	beq.s	loc_11F9FA
loc_11F99C:
	cmpi.w	#$FFFB,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F9AA
	moveq	#-$5,d0
	bra.s	loc_11F9AC
loc_11F9AA:
	move.w	d4,d0
loc_11F9AC:
	move.w	d0,d4
	cmpi.w	#$5,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F9BC
	move.w	d4,d0
	bra.s	loc_11F9BE
loc_11F9BC:
	moveq	#$5,d0
loc_11F9BE:
	move.w	d0,d4
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F9CE
	moveq	#-$5,d0
	bra.s	loc_11F9D0
loc_11F9CE:
	move.w	d5,d0
loc_11F9D0:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F9E0
	move.w	d5,d0
	bra.s	loc_11F9E2
loc_11F9E0:
	moveq	#$5,d0
loc_11F9E2:
	move.w	d0,d5
	add.w	d4,(a3)
	add.w	d5,$2(a3)
	clr.b	-$10(a6)
	bra.s	loc_11F9FA
loc_11F9F0:
	move.w	-$14(a6),(a3)
	move.w	-$12(a6),$2(a3)
loc_11F9FA:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a3
	addi.w	#$10,d6
loc_11FA04:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$16(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_11F6DC
loc_11FA14:
	tst.b	-$10(a6)
	beq.s	loc_11FA20
	andi.w	#$FEFF,$98(a4)
loc_11FA20:
	move.w	#$100,d0
	and.w	$98(a4),d0
	bne.s	loc_11FA84
	move.w	$AA(a4),-$2(a6)
	move.w	#$200,d0
	and.w	$98(a4),d0
	beq.s	loc_11FA54
	moveq	#$20,d0
	cmp.w	-$8(a6),d0
	bge.s	loc_11FA4E
	addq.w	#$8,$AA(a4)
	move.w	$AA(a4),-$2(a6)
	bra.s	loc_11FA54
loc_11FA4E:
	andi.w	#$FDFF,$98(a4)
loc_11FA54:
	move.w	-$2(a6),d0
	asr.w	#$4,d0
	add.w	d0,$A6(a4)
	cmpi.w	#$100,$A6(a4)
	ble.s	loc_11FA6C
	subi.w	#$100,$A6(a4)
loc_11FA6C:
	move.w	-$2(a6),d0
	asr.w	#$4,d0
	add.w	d0,$A8(a4)
	cmpi.w	#$100,$A8(a4)
	ble.s	loc_11FA84
	subi.w	#$100,$A8(a4)
loc_11FA84:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11F6A4
	move.b	-$F(a6),d0
	movem.l	-$36(a6),d3-d7/a3-a4
	unlk	a6
	rts
