; ---------------------------------------------------------------------------
; sub_1974EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1974EE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_197538
	tst.b	$9D(a4)
	bne.s	loc_197514
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_197522
loc_197514:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_197522:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1975DE
loc_197538:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1975D0
	cmpi.w	#$701,$68(a4)
	blt.s	loc_19755C
	lea.l	$43AA(a5),a0
	move.l	$2(a0),$44(a4)
	addq.w	#$2,$48(a4)
	bra.s	loc_19756A
loc_19755C:
	lea.l	$43A2(a5),a0
	move.l	$2(a0),$44(a4)
	addq.w	#$2,$48(a4)
loc_19756A:
	moveq	#$5,d0
	cmp.w	$48(a4),d0
	ble.s	loc_1975BC
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	#$FD00,$18(a4)
	move.w	#$3F,$20(a4)
	move.w	#$396,$22(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_19759A
	move.l	#$FFFFFC6A,d0
	bra.s	loc_1975A0
loc_19759A:
	move.l	#$396,d0
loc_1975A0:
	move.w	d0,$16(a4)
	addq.w	#$4,a7
	move.w	#$14,$6C(a4)
	lea.l	sub_19767C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1975DE
loc_1975BC:
	clr.w	$6C(a4)
	lea.l	sub_197498(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1975DE
loc_1975D0:
	cmpi.w	#$FD00,$18(a4)
	bge.s	loc_1975DE
	addi.w	#$100,$18(a4)
loc_1975DE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
