; ---------------------------------------------------------------------------
; sub_1F8B42	[jt 2535]
; ---------------------------------------------------------------------------
sub_1F8B42:
	link.w	a6,#$FF08
	movem.l	d3-d7/a2-a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$F0(a6)
	move.l	a4,-(a7)
	jsr	sub_1F85B6(pc)
	addq.w	#$8,a7
	clr.w	-$F8(a6)
	clr.b	-$1360(a5)
loc_1F8B62:
	moveq	#$0,d0
	move.w	d0,-$F6(a6)
	move.l	d0,d7
	move.l	d0,-$F4(a6)
	move.w	#$7D0,d0
	move.w	d0,d6
	move.w	d0,d5
	lea.l	-$F0(a6),a2
	addq.w	#$1,-$F8(a6)
	bra.w	loc_1F8CA6
loc_1F8B82:
	move.w	d3,d0
	andi.w	#$4,d0
	bne.w	loc_1F8CA4
	moveq	#$0,d0
	move.b	$2(a2),d0
	lea.l	-$33D2(a5),a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	move.l	a2,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1F87B2(pc)
	lea.l	$C(a7),a7
	cmpi.w	#$2,d0
	blt.w	loc_1F8CA4
	beq.s	loc_1F8BCE
	move.b	$2(a3),d0
	cmp.b	-$F6(a6),d0
	ble.w	loc_1F8CA4
	move.b	d0,-$F6(a6)
	bra.w	loc_1F8CA4
loc_1F8BCE:
	move.w	$4(a4),d0
	andi.w	#$1000,d0
	bne.s	loc_1F8BE2
	move.l	$76(a4),d1
	cmpa.l	d1,a3
	beq.w	loc_1F8CA4
loc_1F8BE2:
	moveq	#-$2,d0
	cmp.b	$12(a3),d0
	bne.s	loc_1F8BF0
	tst.b	$2(a3)
	beq.s	loc_1F8BFC
loc_1F8BF0:
	move.b	$2(a3),d0
	cmp.b	$42(a4),d0
	bne.w	loc_1F8CA4
loc_1F8BFC:
	tst.b	$4(a2)
	ble.s	loc_1F8C3C
	move.w	$4(a4),d0
	andi.w	#$1000,d0
	bne.s	loc_1F8C3C
	ori.w	#$4,(a2)
	ori.b	#$40,(a3)
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F8C3A
	tst.w	$6A(a4)
	bne.s	loc_1F8C34
	movea.l	-$135E(a5),a0
	move.l	d7,-(a7)
	pea.l	-$F0(a6)
	move.l	a4,-(a7)
	jsr	(a0)
	lea.l	$C(a7),a7
loc_1F8C34:
	move.b	#$1E,$3(a3)
loc_1F8C3A:
	bra.s	loc_1F8CA4
loc_1F8C3C:
	move.b	$3(a2),d0
	bpl.s	loc_1F8C44
	neg.b	d0
loc_1F8C44:
	ext.w	d0
	move.b	$4(a2),d4
	bpl.s	loc_1F8C4E
	neg.b	d4
loc_1F8C4E:
	ext.w	d4
	add.w	d0,d4
	move.w	d3,d0
	andi.w	#$10,d0
	beq.s	loc_1F8C70
	move.b	$5(a2),d0
	bpl.s	loc_1F8C62
	neg.b	d0
loc_1F8C62:
	ext.w	d0
	move.b	$6(a2),d4
	bpl.s	loc_1F8C6C
	neg.b	d4
loc_1F8C6C:
	ext.w	d4
	add.w	d0,d4
loc_1F8C70:
	tst.w	d3
	bpl.s	loc_1F8C80
	cmp.w	d5,d4
	bge.s	loc_1F8C7E
	move.l	a2,-$F4(a6)
	move.w	d4,d5
loc_1F8C7E:
	bra.s	loc_1F8CA4
loc_1F8C80:
	tst.l	d7
	beq.s	loc_1F8C9C
	move.b	$4(a2),d0
	bpl.s	loc_1F8C9C
	movea.l	d7,a0
	move.b	$4(a0),d1
	bpl.s	loc_1F8C9C
	cmp.b	d1,d0
	bge.s	loc_1F8C9A
	move.l	a2,d7
	move.w	d4,d6
loc_1F8C9A:
	bra.s	loc_1F8CA4
loc_1F8C9C:
	cmp.w	d6,d4
	bge.s	loc_1F8CA4
	move.l	a2,d7
	move.w	d4,d6
loc_1F8CA4:
	addq.w	#$8,a2
loc_1F8CA6:
	move.w	(a2),d3
	move.w	d3,d0
	andi.w	#$1,d0
	beq.w	loc_1F8B82
	tst.l	d7
	bne.s	loc_1F8CBA
	move.l	-$F4(a6),d7
loc_1F8CBA:
	movea.l	d7,a2
	moveq	#$1E,d0
	cmp.w	-$F8(a6),d0
	bge.s	loc_1F8D10
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F8D0E
	tst.b	-$1360(a5)
	bne.s	loc_1F8CF8
	st.b	-$1360(a5)
	move.w	#$19,-$F8(a6)
	move.l	-$1364(a5),$8(a4)
	move.l	-$1368(a5),$C(a4)
	clr.l	$16(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	addq.w	#$4,a7
	bra.w	loc_1F8E7A
loc_1F8CF8:
	movea.l	-$135E(a5),a0
	move.l	d7,-(a7)
	pea.l	-$F0(a6)
	move.l	a4,-(a7)
	jsr	(a0)
	lea.l	$C(a7),a7
	suba.l	a2,a2
	bra.s	loc_1F8D10
loc_1F8D0E:
	suba.l	a2,a2
loc_1F8D10:
	move.l	a2,d0
	beq.w	loc_1F8E7A
	moveq	#$0,d0
	move.b	$2(a2),d0
	lea.l	-$33D2(a5),a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	moveq	#$0,d0
	move.b	$1(a3),d0
	add.w	d0,d0
	add.w	d0,d0
	lea.l	-$346A(a5),a0
	move.l	(a0,d0.w),d0
	beq.s	loc_1F8D50
	movea.l	d0,a0
	move.l	a2,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	clr.l	-(a7)
	jsr	(a0)
	lea.l	$10(a7),a7
loc_1F8D50:
	moveq	#$0,d3
	move.b	d0,d3
	cmpi.w	#$1,d3
	bcs.s	loc_1F8D6A
	bgt.s	loc_1F8D8E
	andi.w	#$7,(a2)
	ori.w	#$4,(a2)
	ori.b	#$40,(a3)
	bra.s	loc_1F8D8E
loc_1F8D6A:
	movea.l	-$3488(a5),a0
	move.l	a2,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	(a0)
	lea.l	$C(a7),a7
	tst.b	$3(a2)
	beq.s	loc_1F8D84
	ori.w	#$2,(a2)
loc_1F8D84:
	tst.b	$4(a2)
	beq.s	loc_1F8D8E
	ori.w	#$40,(a2)
loc_1F8D8E:
	move.w	(a2),d0
	andi.w	#$8,d0
	beq.w	loc_1F8E1E
	move.w	$6(a4),d0
	andi.w	#$2000,d0
	bne.s	loc_1F8E1E
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.w	#$4,a7
	moveq	#-$2,d0
	cmp.b	$12(a3),d0
	beq.s	loc_1F8DDA
	moveq	#$0,d0
	move.b	$12(a3),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1F8DCE
	add.w	d0,d0
	add.w	d0,d0
	movea.l	-$34A6(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_1F8DD0
loc_1F8DCE:
	moveq	#$0,d0
loc_1F8DD0:
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	jsr	$4E72(a5)	; -> sub_1F64B4
	addq.w	#$8,a7
loc_1F8DDA:
	move.w	$4(a4),d0
	andi.w	#$EFFF,d0
	ori.w	#$80,d0
	move.w	d0,$4(a4)
	move.l	a3,$76(a4)
	cmpi.b	#$F,$1(a3)
	beq.s	loc_1F8DFC
	move.b	$2(a3),$42(a4)
loc_1F8DFC:
	move.l	a4,-(a7)
	move.l	a4,-(a7)
	jsr	Obj_InheritLayer(pc)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1F6FF4(pc)
	move.l	a4,-(a7)
	jsr	sub_1F6D76(pc)
	lea.l	$14(a7),a7
	ori.w	#$4,(a2)
	ori.b	#$40,(a3)
loc_1F8E1E:
	tst.w	(a2)
	bpl.s	loc_1F8E72
	tst.b	$7(a2)
	beq.s	loc_1F8E70
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F8E5E
	cmpi.b	#$4,$7(a2)
	bne.s	loc_1F8E4E
	pea.l	($0).w
	pea.l	($2).w
	pea.l	($0).w
	jsr	$501A(a5)	; -> Sys_Nop1FA8C4
	lea.l	$C(a7),a7
	bra.s	loc_1F8E70
loc_1F8E4E:
	pea.l	($63).w
	pea.l	($FFFFFFFF).w
	jsr	$5022(a5)	; -> Sys_Nop1FA8CC
	addq.w	#$8,a7
	bra.s	loc_1F8E70
loc_1F8E5E:
	pea.l	($0).w
	pea.l	($63).w
	move.l	a4,-(a7)
	jsr	$502A(a5)	; -> Sys_Nop1FA8D4
	lea.l	$C(a7),a7
loc_1F8E70:
	suba.l	a2,a2
loc_1F8E72:
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	addq.w	#$4,a7
loc_1F8E7A:
	move.l	a2,d7
	bne.w	loc_1F8B62
	lea.l	-$F0(a6),a2
loc_1F8E84:
	move.w	(a2),d1
	move.w	d1,d0
	andi.w	#$1,d0
	bne.s	loc_1F8EB2
	andi.w	#$4,d1
	beq.s	loc_1F8EAE
	moveq	#$0,d0
	move.b	$2(a2),d0
	lea.l	-$33D2(a5),a0
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a0
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a0
	andi.b	#$BF,(a0)
loc_1F8EAE:
	addq.w	#$8,a2
	bra.s	loc_1F8E84
loc_1F8EB2:
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F8EC6
	move.l	$8(a4),-$1364(a5)
	move.l	$C(a4),-$1368(a5)
loc_1F8EC6:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F8EEC
	move.b	-$F6(a6),$42(a4)
	move.b	$7A(a4),d0
	cmpi.b	#$FF,d0
	beq.s	loc_1F8EEC
	pea.l	Seg_SetLayerFromObj(pc)
	move.l	a4,-(a7)
	jsr	Seg_ForEachOfObj(pc)
	addq.w	#$8,a7
loc_1F8EEC:
	movem.l	-$118(a6),d3-d7/a2-a4
	unlk	a6
	rts
