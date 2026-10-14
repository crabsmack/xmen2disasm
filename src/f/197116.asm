; ---------------------------------------------------------------------------
; sub_197116	[jt 2169]
; ---------------------------------------------------------------------------
sub_197116:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a3
	andi.l	#$FFFFFFFD,$90(a4)
	ori.w	#$2000,$6(a4)
	tst.b	$9D(a4)
	bne.s	loc_19714A
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_197158
loc_19714A:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_197158:
	andi.l	#$FFFFFFFB,$90(a4)
	andi.l	#$FFFFFFDF,$90(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.b	#$1,-$3892(a5)
	clr.l	$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d1
	move.w	$C0(a4),d1
	moveq	#$3,d2
	and.w	d1,d2
	subq.w	#$1,d2
	lea.l	$C(a7),a7
	beq.s	loc_1971C4
	subq.w	#$1,d2
	beq.s	loc_19721C
	subq.w	#$1,d2
	beq.w	loc_197266
	bra.w	loc_1972AE
loc_1971C4:
	moveq	#$30,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.b	#$1,$C2(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	andi.l	#$FFF7FFFF,$90(a4)
	andi.l	#$FFEFFFFF,$90(a4)
	move.w	$E(a3),d0
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_196F70(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1972AE
loc_19721C:
	ori.b	#$10,$2E(a4)
	moveq	#$1B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.b	$C2(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	move.w	$C(a3),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1969C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1972AE
loc_197266:
	andi.b	#$EF,$2E(a4)
	moveq	#$1B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.b	$C2(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	move.w	$8(a3),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1969C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1972AE:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
