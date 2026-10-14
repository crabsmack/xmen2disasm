; ---------------------------------------------------------------------------
; sub_19777E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_19777E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A6(a4)
	bgt.s	loc_1977CC
	movea.l	-$35B6(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	bne.s	loc_1977CC
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1977CC
	move.l	#$200000,d0
	and.l	$90(a4),d0
	bne.s	loc_1977CC
	ori.l	#$40000,$90(a4)
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$2A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1977CC:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_197830
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1977EA
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1977F2
loc_1977EA:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1977F2:
	beq.s	loc_197830
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197808
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_197810
loc_197808:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_197810:
	bne.s	loc_197830
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197826
	move.w	-$3BA8(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_19782E
loc_197826:
	move.w	-$3BA8(a5),d0
	and.w	-$3A30(a5),d0
loc_19782E:
	beq.s	loc_19784E
loc_197830:
	andi.l	#$FFDFFFFF,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_19799A
loc_19784E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197862
	move.w	-$3BA4(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_19786A
loc_197862:
	move.w	-$3BA4(a5),d0
	and.w	-$3A30(a5),d0
loc_19786A:
	beq.s	loc_1978E2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197880
	move.w	-$3B9C(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_197888
loc_197880:
	move.w	-$3B9C(a5),d0
	and.w	-$3A38(a5),d0
loc_197888:
	bne.s	loc_1978E2
	movea.l	$76(a4),a0
	tst.b	$2(a0)
	ble.s	loc_1978E2
	tst.b	$9D(a4)
	bne.s	loc_1978AA
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1978B8
loc_1978AA:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1978B8:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	andi.l	#$FFDFFFFF,$90(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_19799A
loc_1978E2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1978F6
	move.w	-$3B9A(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1978FE
loc_1978F6:
	move.w	-$3B9A(a5),d0
	and.w	-$3A30(a5),d0
loc_1978FE:
	beq.s	loc_19792C
	tst.b	$9D(a4)
	bne.s	loc_197916
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_197924
loc_197916:
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_197924:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_197974
loc_19792C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197940
	move.w	-$3B98(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_197948
loc_197940:
	move.w	-$3B98(a5),d0
	and.w	-$3A30(a5),d0
loc_197948:
	beq.s	loc_197974
	tst.b	$9D(a4)
	bne.s	loc_197960
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_19796E
loc_197960:
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_19796E:
	ori.b	#$10,$2E(a4)
loc_197974:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_19777E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_19799A:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
