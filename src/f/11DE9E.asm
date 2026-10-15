; ---------------------------------------------------------------------------
; sub_11DE9E	[jt 1613]
; ---------------------------------------------------------------------------
sub_11DE9E:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	g_PlacementList(a5),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a3
	move.w	$A(a3),d0
	subq.w	#$1,d0
	beq.s	loc_11DED2
	subq.w	#$1,d0
	beq.s	loc_11DEDC
	subq.w	#$1,d0
	beq.s	loc_11DEE6
	bra.s	loc_11DEDC
loc_11DED2:
	lea.l	$2F8A(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_11DEEE
loc_11DEDC:
	lea.l	$2F92(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_11DEEE
loc_11DEE6:
	lea.l	$2F9A(a5),a0
	movea.l	$2(a0),a3
loc_11DEEE:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	cmp.w	$AC(a4),d7
	addq.w	#$8,a7
	bne.s	loc_11DF14
	andi.b	#$EF,$2E(a4)
	addi.l	#$100,$9C(a4)
	move.w	#$80,$16(a4)
	bra.s	loc_11DF28
loc_11DF14:
	ori.b	#$10,$2E(a4)
	subi.l	#$100,$9C(a4)
	move.w	#$FF80,$16(a4)
loc_11DF28:
	clr.w	$6C(a4)
	lea.l	sub_11DE38(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
