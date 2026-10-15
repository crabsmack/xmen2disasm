; ---------------------------------------------------------------------------
; ExodusBlast_Draw - vtable +$1A: draw a EXODUSBLAST
; In:  8(a6) = this (EXODUSBLAST object)
; Out: none
; Evidence: class descriptor EXODUSBLAST slot +$1A (tools/classes.py); TAS frames 17302-18255 (257 active)
; ---------------------------------------------------------------------------
ExodusBlast_Draw:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d6
	move.b	$98(a4),d6
	tst.l	d6
	beq.w	loc_02E488
	move.l	a4,-(a7)
	lea.l	$6EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	tst.w	$94(a4)
	addq.w	#$4,a7
	bne.s	loc_02E36E
	tst.w	$96(a4)
	beq.w	loc_02E488
loc_02E36E:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	$10(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-$8(a6)
	move.w	$12(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d4
	sub.l	d1,d4
	move.b	$2F(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-$4(a6)
	moveq	#$0,d5
loc_02E3BE:
	move.w	$94(a4),d0
	ext.l	d0
	add.l	d0,d6
	move.w	$96(a4),d0
	ext.l	d0
	add.l	d0,d7
	move.l	d6,d0
	sub.l	-$8(a6),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_02E3E2
	move.l	d6,d0
	sub.l	-$8(a6),d0
	bra.s	loc_02E3EA
loc_02E3E2:
	move.l	d6,d0
	sub.l	-$8(a6),d0
	neg.l	d0
loc_02E3EA:
	tst.w	$94(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_02E3FC
	move.w	$94(a4),d1
	ext.l	d1
	bra.s	loc_02E404
loc_02E3FC:
	move.w	$94(a4),d1
	ext.l	d1
	neg.l	d1
loc_02E404:
	cmp.l	d0,d1
	bgt.s	loc_02E480
	move.l	d7,d0
	sub.l	d4,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_02E418
	move.l	d7,d0
	sub.l	d4,d0
	bra.s	loc_02E41E
loc_02E418:
	move.l	d7,d0
	sub.l	d4,d0
	neg.l	d0
loc_02E41E:
	tst.w	$96(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_02E430
	move.w	$96(a4),d1
	ext.l	d1
	bra.s	loc_02E438
loc_02E430:
	move.w	$96(a4),d1
	ext.l	d1
	neg.l	d1
loc_02E438:
	cmp.l	d0,d1
	bgt.s	loc_02E480
	tst.l	d5
	seq.b	d3
	neg.b	d3
	beq.s	loc_02E448
	moveq	#$4,d0
	bra.s	loc_02E458
loc_02E448:
	moveq	#$1,d0
	cmp.l	d5,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_02E456
	moveq	#$8,d0
	bra.s	loc_02E458
loc_02E456:
	moveq	#$C,d0
loc_02E458:
	move.b	d0,$2F(a4)
	move.b	-$1(a6),d0
	add.b	d0,$2F(a4)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
	move.l	d5,d0
	addq.l	#$1,d5
	moveq	#$4,d0
	cmp.l	d5,d0
	bgt.w	loc_02E3BE
loc_02E480:
	move.l	-$4(a6),d0
	move.b	d0,$2F(a4)
loc_02E488:
	movem.l	-$20(a6),d3-d7/a4
	unlk	a6
	rts
