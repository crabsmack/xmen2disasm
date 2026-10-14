; ---------------------------------------------------------------------------
; sub_08503E	[jt 596]
; ---------------------------------------------------------------------------
sub_08503E:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	move.w	$A6(a4),d7
	move.w	$B2(a4),d0
	btst	#$0,d0
	beq.s	loc_08507C
	ori.b	#$10,$2E(a4)
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$A2(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bne.s	loc_085094
	moveq	#$1,d6
	bra.s	loc_085094
loc_08507C:
	andi.b	#$EF,$2E(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$A4(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bne.s	loc_085094
	moveq	#$1,d6
loc_085094:
	tst.b	d6
	beq.s	loc_0850C8
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	ori.w	#$1000,$6(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_085130(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_085126
loc_0850C8:
	lea.l	$11EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	move.w	d7,$16(a4)
	addq.w	#$8,a7
	tst.w	$B0(a4)
	bne.s	loc_085126
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	bne.s	loc_0850FA
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_085126
loc_0850FA:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_08510E
	clr.w	$96(a4)
loc_08510E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_085126:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
