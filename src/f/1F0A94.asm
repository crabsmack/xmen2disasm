; ---------------------------------------------------------------------------
; sub_1F0A94	[jt 2421]
; ---------------------------------------------------------------------------
sub_1F0A94:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$76(a4),a3
	move.w	$4(a3),d7
	move.b	$1(a3),d7
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F0ACE
	move.l	#$200,d0
	and.l	$90(a4),d0
	beq.s	loc_1F0ACE
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F0ACE:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$96(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F0AF4
	movea.l	(a4),a0
	move.l	$AA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$AA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0AF4:
	tst.w	-$3AFA(a5)
	beq.s	loc_1F0B18
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F0B18
	lea.l	sub_1F26F2(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1F26F2(pc)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0B18:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.w	loc_1F0BE4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0B38
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F0B40
loc_1F0B38:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1F0B40:
	beq.w	loc_1F0BE4
	andi.l	#$FFFFFFDF,$90(a4)
	movea.l	$8C(a4),a0
	move.b	(a0),$70(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0B68
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0B70
loc_1F0B68:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0B70:
	beq.s	loc_1F0B8E
	move.b	#$C,$71(a4)
	movea.l	(a4),a0
	move.l	$BA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$BA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0B8E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0BA2
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0BAA
loc_1F0BA2:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0BAA:
	beq.s	loc_1F0BC8
	move.b	#$B,$71(a4)
	movea.l	(a4),a0
	move.l	$BE(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$BE(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0BC8:
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$C2(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$C2(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0BE4:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.w	loc_1F0CEC
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F0C16
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0C0C
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1F0C32
loc_1F0C0C:
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
	bra.s	loc_1F0C32
loc_1F0C16:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0C2A
	move.w	-$3BA8(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F0C32
loc_1F0C2A:
	move.w	-$3BA8(a5),d0
	and.w	-$3A30(a5),d0
loc_1F0C32:
	beq.w	loc_1F0CEC
	andi.l	#$FFFFFFDF,$90(a4)
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1F0C52
	movea.l	$8C(a4),a0
	move.b	$3(a0),$70(a4)
	bra.s	loc_1F0C5C
loc_1F0C52:
	movea.l	$8C(a4),a0
	move.b	$1(a0),$70(a4)
loc_1F0C5C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0C70
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0C78
loc_1F0C70:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0C78:
	beq.s	loc_1F0C96
	move.b	#$C,$71(a4)
	movea.l	(a4),a0
	move.l	$CA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$CA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0C96:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0CAA
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0CB2
loc_1F0CAA:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0CB2:
	beq.s	loc_1F0CD0
	move.b	#$B,$71(a4)
	movea.l	(a4),a0
	move.l	$CE(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$CE(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0CD0:
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$C6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$C6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0CEC:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F0D80
	move.l	#$200,d0
	and.l	$90(a4),d0
	bne.s	loc_1F0D80
	andi.l	#$FFFFFFF7,$90(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F0D22
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F0D30
loc_1F0D22:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F0D30:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$9A(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F0D80
	cmpi.w	#$44C,$1C(a4)
	blt.s	loc_1F0D5E
	movea.l	(a4),a0
	move.l	$EA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$EA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0D5E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1F1368
loc_1F0D80:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F0DDA
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0D9E
	move.w	-$3BA4(a5),d0
	and.w	-$3A26(a5),d0
	bra.s	loc_1F0DA6
loc_1F0D9E:
	move.w	-$3BA4(a5),d0
	and.w	-$3A28(a5),d0
loc_1F0DA6:
	beq.s	loc_1F0DCE
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$92(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F0DCE
	movea.l	(a4),a0
	move.l	$B6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$B6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0DCE:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F0DDA:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F0EF2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0DFA
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F0E02
loc_1F0DFA:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1F0E02:
	beq.w	loc_1F0EF2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0E1A
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0E22
loc_1F0E1A:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0E22:
	beq.s	loc_1F0E2C
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1F0E50
loc_1F0E2C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0E40
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0E48
loc_1F0E40:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0E48:
	beq.s	loc_1F0E50
	ori.b	#$10,$2E(a4)
loc_1F0E50:
	andi.l	#$FFFFFFDF,$90(a4)
	movea.l	$8C(a4),a0
	move.b	$4(a0),$70(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0E76
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0E7E
loc_1F0E76:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0E7E:
	beq.s	loc_1F0E9C
	move.b	#$C,$71(a4)
	movea.l	(a4),a0
	move.l	$D6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$D6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0E9C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0EB0
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0EB8
loc_1F0EB0:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0EB8:
	beq.s	loc_1F0ED6
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$DA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$DA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0ED6:
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$D2(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$D2(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0EF2:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F1044
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F0F24
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0F1A
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1F0F40
loc_1F0F1A:
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
	bra.s	loc_1F0F40
loc_1F0F24:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0F38
	move.w	-$3BA8(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F0F40
loc_1F0F38:
	move.w	-$3BA8(a5),d0
	and.w	-$3A30(a5),d0
loc_1F0F40:
	beq.w	loc_1F1044
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0F58
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0F60
loc_1F0F58:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0F60:
	beq.s	loc_1F0F6A
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1F0F8E
loc_1F0F6A:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0F7E
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0F86
loc_1F0F7E:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0F86:
	beq.s	loc_1F0F8E
	ori.b	#$10,$2E(a4)
loc_1F0F8E:
	andi.l	#$FFFFFFDF,$90(a4)
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1F0FAA
	movea.l	$8C(a4),a0
	move.b	$7(a0),$70(a4)
	bra.s	loc_1F0FB4
loc_1F0FAA:
	movea.l	$8C(a4),a0
	move.b	$5(a0),$70(a4)
loc_1F0FB4:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0FC8
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F0FD0
loc_1F0FC8:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1F0FD0:
	beq.s	loc_1F0FEE
	move.b	#$C,$71(a4)
	movea.l	(a4),a0
	move.l	$E6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$E6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F0FEE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F1002
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F100A
loc_1F1002:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F100A:
	beq.s	loc_1F1028
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$E2(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$E2(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F1028:
	move.b	#$9,$71(a4)
	movea.l	(a4),a0
	move.l	$DE(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$DE(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F1368
loc_1F1044:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F10FE
	cmpi.b	#$3,d7
	beq.s	loc_1F1086
	cmpi.b	#$13,d7
	beq.s	loc_1F1086
	cmpi.b	#$14,d7
	beq.s	loc_1F1086
	cmpi.b	#$15,d7
	beq.s	loc_1F1086
	cmpi.b	#$16,d7
	beq.s	loc_1F1086
	cmpi.b	#$17,d7
	beq.s	loc_1F1086
	cmpi.b	#$1C,d7
	beq.s	loc_1F1086
	cmpi.b	#$5,d7
	blt.s	loc_1F10FE
	cmpi.b	#$D,d7
	bgt.s	loc_1F10FE
loc_1F1086:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F109A
	move.w	-$3BA4(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F10A2
loc_1F109A:
	move.w	-$3BA4(a5),d0
	and.w	-$3A30(a5),d0
loc_1F10A2:
	beq.s	loc_1F10FE
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F10B8
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F10C0
loc_1F10B8:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F10C0:
	bne.s	loc_1F10FE
	move.l	#$10000,d0
	and.l	$90(a4),d0
	bne.s	loc_1F10FE
	tst.b	$9D(a4)
	bne.s	loc_1F10E4
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F10F2
loc_1F10E4:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F10F2:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F10FE:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F119A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F111E
	move.w	-$3BA4(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F1126
loc_1F111E:
	move.w	-$3BA4(a5),d0
	and.w	-$3A30(a5),d0
loc_1F1126:
	beq.s	loc_1F119A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F113C
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F1144
loc_1F113C:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F1144:
	beq.s	loc_1F119A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F115A
	move.w	-$3B9C(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F1162
loc_1F115A:
	move.w	-$3B9C(a5),d0
	and.w	-$3A38(a5),d0
loc_1F1162:
	bne.s	loc_1F119A
	tst.b	$2(a3)
	ble.s	loc_1F119A
	tst.b	$9D(a4)
	bne.s	loc_1F1180
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F118E
loc_1F1180:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F118E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F119A:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F1280
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F11BA
	move.w	-$3B9C(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F11C2
loc_1F11BA:
	move.w	-$3B9C(a5),d0
	and.w	-$3A30(a5),d0
loc_1F11C2:
	beq.w	loc_1F1280
	cmpi.b	#$3,d7
	beq.s	loc_1F1200
	cmpi.b	#$13,d7
	beq.s	loc_1F1200
	cmpi.b	#$14,d7
	beq.s	loc_1F1200
	cmpi.b	#$15,d7
	beq.s	loc_1F1200
	cmpi.b	#$16,d7
	beq.s	loc_1F1200
	cmpi.b	#$17,d7
	beq.s	loc_1F1200
	cmpi.b	#$1C,d7
	beq.s	loc_1F1200
	cmpi.b	#$5,d7
	blt.w	loc_1F1280
	cmpi.b	#$D,d7
	bgt.w	loc_1F1280
loc_1F1200:
	move.w	#$100,d0
	and.w	$4(a4),d0
	bne.s	loc_1F1216
	move.l	a4,-(a7)
	jsr	sub_1F049E(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F126A
loc_1F1216:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F1244
	tst.b	$9D(a4)
	bne.s	loc_1F1234
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F1280
loc_1F1234:
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
	bra.s	loc_1F1280
loc_1F1244:
	tst.b	$9D(a4)
	bne.s	loc_1F125A
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F1280
loc_1F125A:
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
	bra.s	loc_1F1280
loc_1F126A:
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$AE(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1F1368
loc_1F1280:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F12BE
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F129E
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F12A6
loc_1F129E:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F12A6:
	beq.s	loc_1F12BE
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$B2(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1F1368
loc_1F12BE:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F1356
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F12DE
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F12E6
loc_1F12DE:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F12E6:
	bne.s	loc_1F1356
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F12FC
	move.w	-$3B9C(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F1304
loc_1F12FC:
	move.w	-$3B9C(a5),d0
	and.w	-$3A30(a5),d0
loc_1F1304:
	bne.s	loc_1F1356
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F131A
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F1322
loc_1F131A:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1F1322:
	bne.s	loc_1F1356
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F1338
	move.w	-$3BA4(a5),d0
	and.w	-$3A26(a5),d0
	bra.s	loc_1F1340
loc_1F1338:
	move.w	-$3BA4(a5),d0
	and.w	-$3A28(a5),d0
loc_1F1340:
	bne.s	loc_1F1356
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$EE(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1F1368
loc_1F1356:
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F1368:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
