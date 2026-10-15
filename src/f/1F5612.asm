; ---------------------------------------------------------------------------
; sub_1F5612	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F5612:
	link.w	a6,#$EEFC
	movem.l	d4-d7/a3-a4,-(a7)
	lea.l	-$1004(a6),a3
	lea.l	-$1104(a6),a4
	movea.l	$C(a6),a0
	move.w	$6(a0),d5
	move.w	$8(a0),d6
	movea.l	$8(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	$4(a0),d1
	asr.w	#$2,d1
	muls.w	d0,d1
	move.l	d1,d4
	tst.b	$1F(a6)
	beq.s	loc_1F5668
	pea.l	($1FF).w
	move.l	d4,-(a7)
	move.l	$14(a6),-(a7)
	move.l	a4,-(a7)
	jsr	$415A(a5)	; -> sub_15FC9A
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$414A(a5)	; -> sub_15FC70
	lea.l	$18(a7),a7
	bra.s	loc_1F5680
loc_1F5668:
	clr.w	d7
	bra.s	loc_1F567C
loc_1F566C:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$414A(a5)	; -> sub_15FC70
	addq.w	#$8,a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F567C:
	cmp.w	d7,d6
	bgt.s	loc_1F566C
loc_1F5680:
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	$18(a6),-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F5594(pc)
	move.w	d0,d6
	move.w	d0,-$3AAC(a5)
	move.l	d4,-(a7)
	pea.l	($1FF).w
	move.l	a3,-(a7)
	move.l	$14(a6),-(a7)
	jsr	$4162(a5)	; -> sub_15FCD8
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$4,d0
	add.l	d0,d0
	add.l	$18(a6),d0
	move.l	d0,g_HeapTop(a5)
	ext.l	d6
	move.l	d6,d4
	lsl.l	#$4,d4
	tst.b	$1F(a6)
	lea.l	$28(a7),a7
	beq.s	loc_1F56F0
	pea.l	($7FF).w
	ext.l	d4
	move.l	d4,-(a7)
	move.l	$18(a6),-(a7)
	move.l	a4,-(a7)
	jsr	$415A(a5)	; -> sub_15FC9A
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$414A(a5)	; -> sub_15FC70
	lea.l	$18(a7),a7
	bra.s	loc_1F5708
loc_1F56F0:
	clr.w	d7
	bra.s	loc_1F5704
loc_1F56F4:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$414A(a5)	; -> sub_15FC70
	addq.w	#$8,a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F5704:
	cmp.w	d7,d5
	bgt.s	loc_1F56F4
loc_1F5708:
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F5594(pc)
	move.w	d0,d5
	ext.l	d4
	move.l	d4,-(a7)
	pea.l	($7FF).w
	move.l	a3,-(a7)
	move.l	$18(a6),-(a7)
	jsr	$4162(a5)	; -> sub_15FCD8
	move.l	$C(a6),d4
	movea.l	d4,a0
	move.w	$E(a0),d0
	ext.l	d0
	add.l	d4,d0
	move.l	d0,-$4(a6)
	addq.l	#$2,-$4(a6)
	movea.l	d0,a0
	move.w	(a0),d7
	move.l	a3,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$4112(a5)	; -> Nem_BuildCodeTable
	move.l	d0,-$4(a6)
	move.l	a4,-(a7)
	move.w	$12(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$410A(a5)	; -> Nem_Decode
	move.w	d5,d0
	lea.l	$48(a7),a7
	movem.l	-$111C(a6),d4-d7/a3-a4
	unlk	a6
	rts
