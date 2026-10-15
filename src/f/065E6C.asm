; ---------------------------------------------------------------------------
; sub_065E6C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_065E6C:
	link.w	a6,#$FE10
	movem.l	d3-d7/a3-a4,-(a7)
	lea.l	-$1A6(a6),a3
	move.w	-$3598(a5),-$16(a6)
	move.w	#$1,-$3B02(a5)
	move.w	#$2710,-$3B0C(a5)
	lea.l	$65DB6(pc),a0
	move.l	a0,-$3A18(a5)
	jsr	$50A2(a5)	; -> sub_1FC2E8
	pea.l	$66B24(pc)
	pea.l	($2A56).w
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$C9A(a5)
	pea.l	$66B22(pc)
	pea.l	($1560).w
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$C9E(a5)
	clr.w	d7
	lea.l	-$3960(a5),a4
	lea.l	$10(a7),a7
	bra.s	loc_065ECA
loc_065EC2:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065ECA:
	cmpi.w	#$30,d7
	blt.s	loc_065EC2
	moveq	#$2,d0
	and.w	-$3C5E(a5),d0
	bne.w	loc_06612E
	move.w	-$3598(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$E8A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> sub_1FD72C
	move.w	#$4000,d5
	or.w	-$3598(a5),d5
	moveq	#$30,d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$E82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_065F1E
loc_065F16:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065F1E:
	cmp.w	d7,d4
	bgt.s	loc_065F16
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$C,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($51C).w
	jsr	$413A(a5)	; -> sub_15FA2C
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$4142(a5)	; -> sub_15FA7A
	jsr	sub_065494(pc)
	clr.w	d7
	lea.l	-$3960(a5),a4
	lea.l	$1C(a7),a7
	bra.s	loc_065F5C
loc_065F54:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065F5C:
	cmpi.w	#$30,d7
	blt.s	loc_065F54
	move.b	#$1,-$3A06(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	-$3598(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$E02(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> sub_1FD72C
	move.w	#$4000,d5
	or.w	-$3598(a5),d5
	move.w	#$C0,d4
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DFA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_065FB4
loc_065FAC:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065FB4:
	cmp.w	d7,d4
	bgt.s	loc_065FAC
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($318).w
	jsr	$413A(a5)	; -> sub_15FA2C
	move.w	#$B4,d6
	lea.l	$F7A(a5),a0
	movea.l	$2(a0),a4
	lea.l	$14(a7),a7
	bra.s	loc_066034
loc_065FE0:
	clr.b	-$3A08(a5)
	ext.l	d6
	move.l	#$B4,d0
	sub.l	d6,d0
	move.l	d0,d7
	asr.l	#$2,d7
	move.w	d6,d5
	asr.w	#$2,d5
	cmp.w	d7,d5
	sgt.b	d3
	neg.b	d3
	beq.s	loc_066002
	move.w	d7,d0
	bra.s	loc_066004
loc_066002:
	move.w	d5,d0
loc_066004:
	move.w	d0,d7
	cmpi.w	#$7,d7
	ble.s	loc_06600E
	moveq	#$7,d7
loc_06600E:
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a4,d0.l),-$3924(a5)
	ext.l	d7
	move.l	d7,d0
	addq.l	#$8,d0
	add.l	d0,d0
	move.w	(a4,d0.l),-$3926(a5)
	move.b	#$1,-$3A06(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066034:
	tst.w	d6
	bne.s	loc_065FE0
	lea.l	$FBA(a5),a0
	move.l	$2(a0),-$1F0(a6)
	jsr	sub_065494(pc)
	jsr	sub_065400(pc)
	move.w	#$CC,-$3902(a5)
	move.w	#$AA,-$3904(a5)
	move.b	#$1,-$3A06(a5)
	move.w	-$3C56(a5),-$3B04(a5)
	move.w	-$3C58(a5),d0
	addq.w	#$4,d0
	move.w	d0,-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$3,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	sub_064F70(pc)
	move.w	#$B4,d6
	lea.l	$30(a7),a7
	bra.s	loc_066100
loc_0660FA:
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066100:
	tst.w	d6
	bne.s	loc_0660FA
	move.w	#$B4,d6
	bra.s	loc_066126
loc_06610A:
	clr.b	-$3A08(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	-$7A6(a5),d0
	or.w	-$7A8(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066126
	clr.w	d6
loc_066126:
	tst.w	d6
	bne.s	loc_06610A
	jsr	sub_065400(pc)
loc_06612E:
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	sub_065494(pc)
	clr.w	d7
	lea.l	-$3960(a5),a4
	addq.w	#$8,a7
	bra.s	loc_066154
loc_06614C:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_066154:
	cmpi.w	#$30,d7
	blt.s	loc_06614C
	move.b	#$1,-$3A06(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	-$3598(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$DF2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> sub_1FD72C
	move.w	#$4000,d5
	or.w	-$3598(a5),d5
	move.w	#$9A,d4
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DEA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_0661AC
loc_0661A4:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_0661AC:
	cmp.w	d7,d4
	bgt.s	loc_0661A4
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$E,d1
	move.l	d1,-(a7)
	moveq	#$B,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($1AC).w
	jsr	$413A(a5)	; -> sub_15FA2C
	addi.w	#$C0,-$3598(a5)
	move.l	-$CA2(a5),-$1E8(a6)
	move.w	#$AB,-$1E0(a6)
	move.w	-$3598(a5),-$1DE(a6)
	move.w	#$1,-$1DC(a6)
	addi.w	#$AB,-$3598(a5)
	lea.l	$F72(a5),a0
	movea.l	$2(a0),a4
	lea.l	-$3960(a5),a3
	moveq	#$0,d5
	lea.l	$14(a7),a7
loc_0661FC:
	move.w	(a4)+,(a3)+
	move.l	d5,d0
	addq.l	#$1,d5
	moveq	#$10,d0
	cmp.l	d5,d0
	bgt.s	loc_0661FC
	move.w	#$A0,-$3902(a5)
	move.w	#$80,-$3904(a5)
	move.w	#$660,-$3906(a5)
	move.w	#$862,-$3908(a5)
	move.w	#$A0,-$390A(a5)
	move.w	#$80,-$390C(a5)
	move.w	#$A,-$390E(a5)
	move.w	#$8,-$3910(a5)
	clr.w	-$391E(a5)
	move.b	#$1,-$3A06(a5)
	move.l	-$C9A(a5),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50AA(a5)	; -> sub_1FC35C
	move.l	-$C9A(a5),-(a7)
	pea.l	-$1E8(a6)
	jsr	sub_064588(pc)
	move.w	#$3C,-$20(a6)
	move.w	#$40,-$1E(a6)
	move.w	#$A0,-$26(a6)
	move.w	#$70,-$24(a6)
	clr.w	-$22(a6)
	clr.w	d7
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$1C(a6)
	move.w	$2(a0),-$1A(a6)
	moveq	#$C,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	move.w	#$112,-$3B0C(a5)
	lea.l	$14(a7),a7
	bra.w	loc_06644C
loc_066348:
	moveq	#$0,d0
	move.l	d0,-$3A10(a5)
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
	clr.b	-$3A08(a5)
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	sub_0644D4(pc)
	pea.l	-$1E8(a6)
	jsr	sub_06451E(pc)
	subq.w	#$1,d6
	tst.w	d6
	addq.w	#$8,a7
	bne.s	loc_066436
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$145,$6(a0)
	bra.s	loc_066436
loc_066432:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066436:
	moveq	#$3,d0
	cmp.l	-$3A10(a5),d0
	bgt.s	loc_066432
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_06644C:
	tst.w	d6
	bne.w	loc_066348
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$1DE(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	lea.l	$DE2(a5),a0
	movea.l	$2(a0),a3
	move.l	a3,-$1EC(a6)
	lea.l	$24(a3),a3
	move.b	(a3),d0
	ext.w	d0
	neg.w	d0
	move.w	d0,-$18(a6)
	move.b	$1(a3),d0
	ext.w	d0
	neg.w	d0
	move.w	d0,d5
	move.l	-$CA2(a5),-$1E8(a6)
	move.w	#$2C,-$1E0(a6)
	move.w	-$3598(a5),-$1DE(a6)
	move.w	#$2,-$1DC(a6)
	addi.w	#$2C,-$3598(a5)
	moveq	#$5A,d6
	lea.l	$1C(a7),a7
	bra.s	loc_0664CA
loc_0664C0:
	clr.b	-$3A08(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0664CA:
	tst.w	d6
	bne.s	loc_0664C0
	move.l	-$C9A(a5),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50AA(a5)	; -> sub_1FC35C
	move.l	-$C9A(a5),-(a7)
	pea.l	-$1E8(a6)
	jsr	sub_064588(pc)
	move.w	#$48,-$20(a6)
	move.w	#$95,-$1E(a6)
	move.w	#$A0,-$26(a6)
	move.w	#$95,-$24(a6)
	clr.w	-$22(a6)
	moveq	#$2,d7
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$1C(a6)
	move.w	#$2,-$1A(a6)
	moveq	#$8,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	lea.l	$F62(a5),a0
	movea.l	$2(a0),a3
	lea.l	-$3940(a5),a4
	moveq	#$0,d4
	lea.l	$14(a7),a7
loc_0665D8:
	move.w	(a3)+,(a4)+
	move.l	d4,d0
	addq.l	#$1,d4
	moveq	#$10,d0
	cmp.l	d4,d0
	bgt.s	loc_0665D8
	move.b	#$1,-$3A06(a5)
	bra.w	loc_0666BE
loc_0665EE:
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$145,$6(a0)
	clr.b	-$3A08(a5)
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	sub_0644D4(pc)
	pea.l	-$1E8(a6)
	jsr	sub_06451E(pc)
	subq.w	#$1,d6
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	lea.l	$14(a7),a7
loc_0666BE:
	tst.w	d6
	bne.w	loc_0665EE
	move.w	#$48,-$20(a6)
	move.w	#$8F,-$1E(a6)
	move.w	#$48,-$26(a6)
	move.w	#$95,-$24(a6)
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$22(a6)
	moveq	#$2,d7
	move.w	(a0),-$1C(a6)
	move.w	$2(a0),-$1A(a6)
	moveq	#$8,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	bra.w	loc_066870
loc_0667A0:
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$145,$6(a0)
	clr.b	-$3A08(a5)
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> sub_1FB346
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	sub_0644D4(pc)
	pea.l	-$1E8(a6)
	jsr	sub_06451E(pc)
	subq.w	#$1,d6
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	lea.l	$14(a7),a7
loc_066870:
	tst.w	d6
	bne.w	loc_0667A0
	move.w	#$CC,-$3902(a5)
	move.w	#$AA,-$3904(a5)
	move.b	#$1,-$3A06(a5)
	move.w	-$3C56(a5),d0
	addq.w	#$1,d0
	move.w	d0,-$3B04(a5)
	move.w	-$3C5C(a5),d0
	subq.w	#$1,d0
	move.w	d0,-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$66B04(pc)
	jsr	sub_064F70(pc)
	moveq	#$78,d6
	addq.w	#$8,a7
	bra.s	loc_0668B4
loc_0668AE:
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0668B4:
	tst.w	d6
	bne.s	loc_0668AE
	moveq	#$0,d0
	move.b	-$3B8A(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.w	loc_066A52
	bra.s	loc_0668D0
loc_0668C8:
	clr.b	-$3A08(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0668D0:
	moveq	#$40,d0
	cmp.w	-$390C(a5),d0
	bne.s	loc_0668C8
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$145,$6(a0)
	lea.l	$66AFE(pc),a3
	moveq	#$4A,d4
	move.w	#$C6,-$1EE(a6)
	bra.s	loc_066984
loc_066930:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	-$1EE(a6),d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	ext.w	d7
	move.w	d7,d0
	sub.w	#$99E0,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
	addq.w	#$1,a3
	addq.w	#$8,d4
loc_066984:
	move.b	(a3),d7
	bne.s	loc_066930
	lea.l	$66AF8(pc),a3
	move.w	#$D2,d4
	move.w	#$C6,-$1EE(a6)
	bra.s	loc_0669EC
loc_066998:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	-$1EE(a6),d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	ext.w	d7
	move.w	d7,d0
	sub.w	#$99E0,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
	addq.w	#$1,a3
	addq.w	#$8,d4
loc_0669EC:
	move.b	(a3),d7
	bne.s	loc_066998
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> sub_1FB346
	pea.l	-$1E8(a6)
	jsr	sub_06451E(pc)
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	move.w	#$258,d6
	lea.l	$10(a7),a7
	bra.s	loc_066A4C
loc_066A2A:
	clr.b	-$3A08(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	-$7A6(a5),d0
	or.w	-$7A8(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066A4C
	ori.w	#$2,-$3C5E(a5)
	clr.w	d6
loc_066A4C:
	tst.w	d6
	bne.s	loc_066A2A
	bra.s	loc_066A78
loc_066A52:
	move.w	#$258,d6
	bra.s	loc_066A74
loc_066A58:
	clr.b	-$3A08(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	-$7A6(a5),d0
	or.w	-$7A8(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066A74
	clr.w	d6
loc_066A74:
	tst.w	d6
	bne.s	loc_066A58
loc_066A78:
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
	clr.b	-$3A08(a5)
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.w	-$16(a6),-$3598(a5)
	moveq	#$0,d0
	move.l	d0,-$3A18(a5)
	move.l	-$C9E(a5),-(a7)
	jsr	$503A(a5)	; -> sub_1FA924
	move.l	-$C9A(a5),-(a7)
	jsr	$503A(a5)	; -> sub_1FA924
	clr.w	-$3A26(a5)
	clr.w	-$3A28(a5)
	clr.w	-$3A2E(a5)
	clr.w	-$3A30(a5)
	addq.w	#$8,a7
	movem.l	-$20C(a6),d3-d7/a3-a4
	unlk	a6
	rts
