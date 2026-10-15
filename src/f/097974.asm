; ---------------------------------------------------------------------------
; sub_097974	[jt 759]
; ---------------------------------------------------------------------------
sub_097974:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d4
	asr.l	#$8,d4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d5
	asr.l	#$1,d5
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	asr.l	#$1,d0
	add.w	d0,d5
	cmp.w	d6,d4
	addq.w	#$4,a7
	ble.s	loc_0979C4
	move.w	d4,d7
	sub.w	d5,d7
	bra.s	loc_0979C8
loc_0979C4:
	move.w	d4,d7
	add.w	d5,d7
loc_0979C8:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0979E0
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_0979EA
loc_0979E0:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_0979EA:
	moveq	#$A,d1
	cmp.l	d0,d1
	bgt.s	loc_097A36
	cmp.w	d6,d7
	bge.s	loc_097A04
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_097A04
	ori.b	#$10,$2E(a4)
	bra.s	loc_097A16
loc_097A04:
	cmp.w	d6,d7
	ble.s	loc_097A16
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_097A16
	andi.b	#$EF,$2E(a4)
loc_097A16:
	move.l	a4,-(a7)
	jsr	sub_097904(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_097A36
	clr.w	$6C(a4)
	lea.l	sub_097974(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_097A98
loc_097A36:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_097A6A
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_097A98
loc_097A6A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097A7E
	clr.w	$96(a4)
loc_097A7E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_097A98:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
