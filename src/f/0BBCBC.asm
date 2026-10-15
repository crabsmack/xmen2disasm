; ---------------------------------------------------------------------------
; SavageBio_StateChargeToPlayer - SAVAGE bio state: charge until within $82 px of the nearest player, braking and turning when it passes
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateChargeToPlayer:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BBCF4
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_0BBCFE
loc_0BBCF4:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_0BBCFE:
	cmpi.l	#$82,d0
	addq.w	#$4,a7
	bge.s	loc_0BBD58
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BBD28
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_0BBE02
loc_0BBD28:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BBD3C
	clr.w	$96(a4)
loc_0BBD3C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_0BBE02
loc_0BBD58:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBD6E
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	slt.b	d0
	neg.b	d0
	bra.s	loc_0BBD7A
loc_0BBD6E:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	sgt.b	d0
	neg.b	d0
loc_0BBD7A:
	bne.s	loc_0BBDD6
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BBD8E
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0BBD96
loc_0BBD8E:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0BBD96:
	moveq	#$8,d1
	cmp.l	d0,d1
	ble.s	loc_0BBDBE
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_0BBDB6
	ori.b	#$10,$2E(a4)
	bra.s	loc_0BBDF0
loc_0BBDB6:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BBDF0
loc_0BBDBE:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBDCA
	moveq	#-$18,d0
	bra.s	loc_0BBDCC
loc_0BBDCA:
	moveq	#$18,d0
loc_0BBDCC:
	neg.b	d0
	ext.w	d0
	move.w	d0,$1E(a4)
	bra.s	loc_0BBDF0
loc_0BBDD6:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBDE6
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BBDEC
loc_0BBDE6:
	move.l	#$220,d0
loc_0BBDEC:
	move.w	d0,$16(a4)
loc_0BBDF0:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateChargeToPlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BBE02:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
