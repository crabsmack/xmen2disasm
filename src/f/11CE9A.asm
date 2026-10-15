; ---------------------------------------------------------------------------
; BabyBio_ActMoveHorizontal - BABYBIO script action: walk toward the other horizontal limit at speed +$B4 (or stop 60 frames if both limits are equal), dropping a mismatched attachment
; In:  8(a6) = this
; Out: d0
; Evidence: next BabyBio_WaitReachHLimit
; ---------------------------------------------------------------------------
BabyBio_ActMoveHorizontal:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.w	$AC(a4),d0
	cmp.w	$AE(a4),d0
	bne.s	loc_11CF0A
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_11CED8
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_11CFDE
loc_11CED8:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CEEC
	clr.w	$96(a4)
loc_11CEEC:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_11CFDE
loc_11CF0A:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$AC(a4),d7
	bne.s	loc_11CF46
	andi.b	#$EF,$2E(a4)
	addi.l	#$100,$9C(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CF38
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11CF40
loc_11CF38:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11CF40:
	move.w	d0,$16(a4)
	bra.s	loc_11CF74
loc_11CF46:
	ori.b	#$10,$2E(a4)
	subi.l	#$100,$9C(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CF66
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11CF6E
loc_11CF66:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11CF6E:
	neg.l	d0
	move.w	d0,$16(a4)
loc_11CF74:
	tst.l	$A8(a4)
	beq.s	loc_11CFCC
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11CFA8
	movea.l	$A8(a4),a0
	moveq	#$10,d0
	and.b	$2E(a0),d0
	bne.s	loc_11CFCC
	tst.l	$A8(a4)
	beq.s	loc_11CFCC
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
	bra.s	loc_11CFCC
loc_11CFA8:
	movea.l	$A8(a4),a0
	moveq	#$10,d0
	and.b	$2E(a0),d0
	beq.s	loc_11CFCC
	tst.l	$A8(a4)
	beq.s	loc_11CFCC
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11CFCC:
	clr.w	$6C(a4)
	lea.l	BabyBio_WaitReachHLimit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11CFDE:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
