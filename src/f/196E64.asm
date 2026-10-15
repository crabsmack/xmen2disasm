; ---------------------------------------------------------------------------
; sub_196E64	[link-after-rts]
; ---------------------------------------------------------------------------
sub_196E64:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d7
	move.b	#$1,g_CamModeSwitched(a5)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.w	#$2000,$6(a4)
	tst.b	$C2(a4)
	bne.s	loc_196EA4
	lea.l	$437A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_196EB4
loc_196EA4:
	lea.l	$4382(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_196EB4:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$2,d1
	cmp.l	d0,d1
	bne.s	loc_196F0C
	ori.b	#$10,$2E(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$C(a0),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	ext.l	d7
	move.l	$C(a4),d0
	asr.l	#$8,d0
	add.l	d7,d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#$A,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.w	#$4,a7
	bra.s	loc_196F4E
loc_196F0C:
	andi.b	#$EF,$2E(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$8(a0),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	ext.l	d7
	move.l	$C(a4),d0
	asr.l	#$8,d0
	add.l	d7,d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#$A,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.w	#$4,a7
loc_196F4E:
	move.w	#$2DA,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_19673A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
