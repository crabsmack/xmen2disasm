; ---------------------------------------------------------------------------
; sub_0137EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0137EE:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.b	#$8,d0
	bcc.s	loc_013880
	moveq	#$0,d0
	move.b	$90(a4),d0
	tst.l	d0
	bls.s	loc_013840
	tst.w	$16(a4)
	ble.s	loc_01381C
	tst.w	$1E(a4)
	bgt.s	loc_013840
loc_01381C:
	tst.w	$16(a4)
	bge.s	loc_013828
	tst.w	$1E(a4)
	blt.s	loc_013840
loc_013828:
	tst.w	$18(a4)
	ble.s	loc_013834
	tst.w	$20(a4)
	bgt.s	loc_013840
loc_013834:
	tst.w	$18(a4)
	bge.s	loc_013880
	tst.w	$20(a4)
	bge.s	loc_013880
loc_013840:
	tst.w	$68(a4)
	bgt.s	loc_013862
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	lea.l	$C(a7),a7
	bra.s	loc_0138CA
loc_013862:
	clr.l	$1E(a4)
	andi.w	#$FFFB,$4(a4)
	clr.w	$6C(a4)
	lea.l	sub_0138D4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0138CA
loc_013880:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.b	#$1,d0
	shi.b	d3
	neg.b	d3
	beq.s	loc_01389E
	tst.b	-$38DE(a5)
	beq.s	loc_01389A
	moveq	#$2,d0
	bra.s	loc_0138B4
loc_01389A:
	moveq	#$1,d0
	bra.s	loc_0138B4
loc_01389E:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.w	#$1,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0138B2
	moveq	#$1,d0
	bra.s	loc_0138B4
loc_0138B2:
	moveq	#$0,d0
loc_0138B4:
	sub.b	d0,$90(a4)
	clr.w	$6C(a4)
	lea.l	sub_0137EE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0138CA:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
