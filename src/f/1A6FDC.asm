; ---------------------------------------------------------------------------
; sub_1A6FDC	[jt 2201]
; ---------------------------------------------------------------------------
sub_1A6FDC:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a3
	andi.l	#$FFFFFFFD,$90(a4)
	andi.l	#$FFFFFFFB,$90(a4)
	move.b	#$1,-$3892(a5)
	clr.l	$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$9D(a4)
	bne.s	loc_1A702E
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1A703C
loc_1A702E:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1A703C:
	pea.l	($81).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($81).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d1
	and.w	d0,d1
	subq.w	#$1,d1
	addq.w	#$8,a7
	beq.s	loc_1A706A
	subq.w	#$1,d1
	beq.s	loc_1A70AC
	subq.w	#$1,d1
	beq.w	loc_1A70F8
	bra.w	loc_1A7142
loc_1A706A:
	lea.l	$4472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	move.w	$E(a3),d0
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A7142
loc_1A70AC:
	ori.b	#$10,$2E(a4)
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ori.w	#$2000,$6(a4)
	move.w	$C(a3),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A7142
loc_1A70F8:
	andi.b	#$EF,$2E(a4)
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ori.w	#$2000,$6(a4)
	move.w	$8(a3),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A7142:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
