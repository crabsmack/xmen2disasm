; ---------------------------------------------------------------------------
; sub_1968D2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1968D2:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,g_CamModeSwitched(a5)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	andi.w	#$DFFF,$6(a4)
	andi.l	#$FFF7FFFF,$90(a4)
	andi.l	#$FFEFFFFF,$90(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_196914
	move.w	$4E(a4),d7
	bra.s	loc_196918
loc_196914:
	move.w	$52(a4),d7
loc_196918:
	eori.b	#$10,$2E(a4)
	tst.b	$C2(a4)
	bne.s	loc_19693C
	move.b	#$1,$C2(a4)
	lea.l	$438A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_196950
loc_19693C:
	clr.b	$C2(a4)
	lea.l	$4392(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_196950:
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$E(a0),d0
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$4,a7
	beq.s	loc_196990
	move.w	$52(a4),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	lsl.l	#$8,d0
	sub.l	d0,$8(a4)
	move.w	#$FDF8,$16(a4)
	bra.s	loc_1969A6
loc_196990:
	move.w	$4E(a4),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	lsl.l	#$8,d0
	sub.l	d0,$8(a4)
	move.w	#$208,$16(a4)
loc_1969A6:
	clr.w	$6C(a4)
	lea.l	sub_196C82(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
