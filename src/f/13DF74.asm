; ---------------------------------------------------------------------------
; ExplodeFx_TrailUpdate - per-frame timer of a trail: move the head puff and drop a new puff at its position every few steps; animate the dropped puffs
; In:  8(a6) = effect
; Out: none
; Evidence: puff 0 = head: moves with velocity/acceleration, +$10 step count; when step >= 2 * puffs-so-far (+$11 of the head, < 10) copies its position into the next puff (+$1F = count) with the explosion sound; head off the view window ($FFCC3A-$FFCC40) stops; ExplodeFx_Free when nothing is live
; ---------------------------------------------------------------------------
ExplodeFx_TrailUpdate:
	link.w	a6,#$FFF6
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d4
	movea.l	a3,a4
	lea.l	$E(a4),a4
	move.l	a4,-$A(a6)
	clr.b	-$5(a6)
	tst.b	$D(a3)
	ble.s	loc_13DF9A
	subq.b	#$1,$D(a3)
loc_13DF9A:
	movea.l	-$A(a6),a0
	moveq	#$0,d0
	move.b	$11(a0),d0
	cmp.w	d4,d0
	ble.w	loc_13E132
	tst.b	$11(a4)
	beq.w	loc_13E126
	tst.w	d4
	bne.s	loc_13DFFA
	clr.b	d5
	move.l	(a4),d0
	asr.l	#$8,d0
	move.w	d0,d6
	sub.w	g_CameraX(a5),d6
	move.l	$4(a4),d0
	asr.l	#$8,d0
	move.w	d0,d7
	sub.w	g_CameraY(a5),d7
	cmp.w	-$35C2(a5),d6
	ble.s	loc_13DFD8
	moveq	#$1,d5
	bra.s	loc_13DFF4
loc_13DFD8:
	cmp.w	-$35C0(a5),d6
	bge.s	loc_13DFE2
	moveq	#$1,d5
	bra.s	loc_13DFF4
loc_13DFE2:
	cmp.w	-$35C6(a5),d7
	ble.s	loc_13DFEC
	moveq	#$1,d5
	bra.s	loc_13DFF4
loc_13DFEC:
	cmp.w	-$35C4(a5),d7
	bge.s	loc_13DFF4
	moveq	#$1,d5
loc_13DFF4:
	tst.b	d5
	bne.w	loc_13E126
loc_13DFFA:
	tst.w	d4
	bne.w	loc_13E0B0
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	move.w	$A(a4),d0
	ext.l	d0
	add.l	d0,$4(a4)
	move.w	$C(a4),d0
	add.w	d0,$8(a4)
	move.w	$E(a4),d0
	add.w	d0,$A(a4)
	addq.b	#$1,$10(a4)
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.b	#$A,d0
	bcc.w	loc_13E120
	moveq	#$0,d0
	move.b	$10(a4),d0
	moveq	#$0,d1
	move.b	$11(a4),d1
	ext.l	d1
	add.l	d1,d1
	cmp.w	d0,d1
	bhi.w	loc_13E120
	tst.b	$D(a3)
	bgt.s	loc_13E068
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	#$6,$D(a3)
	addq.w	#$8,a7
loc_13E068:
	movea.l	-$A(a6),a0
	moveq	#$0,d0
	move.b	$11(a0),d0
	move.l	d0,d1
	mulu.w	#$12,d0
	swap	d1
	mulu.w	#$12,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.l	(a4),(a0,d0.l)
	movea.l	-$A(a6),a0
	moveq	#$0,d0
	move.b	$11(a0),d0
	move.l	d0,d1
	mulu.w	#$12,d0
	swap	d1
	mulu.w	#$12,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.l	$4(a4),$4(a0,d0.l)
	addq.b	#$1,$11(a4)
	bra.s	loc_13E120
loc_13E0B0:
	moveq	#$0,d0
	move.b	$10(a4),d0
	moveq	#$F,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	move.w	d0,-$4(a6)
	move.b	$10(a4),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,-$2(a6)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13E0DA
	moveq	#$2,d0
	bra.s	loc_13E0DC
loc_13E0DA:
	moveq	#$1,d0
loc_13E0DC:
	ext.w	d0
	sub.w	d0,-$4(a6)
	tst.w	-$4(a6)
	bgt.s	loc_13E110
	move.w	-$2(a6),d0
	addq.w	#$1,-$2(a6)
	moveq	#$6,d0
	cmp.w	-$2(a6),d0
	bge.s	loc_13E0FE
	clr.b	$11(a4)
	bra.s	loc_13E126
loc_13E0FE:
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$4,d0
	moveq	#$6,d1
	or.l	d0,d1
	move.b	d1,$10(a4)
	bra.s	loc_13E120
loc_13E110:
	andi.b	#$F0,$10(a4)
	moveq	#$F,d0
	and.w	-$4(a6),d0
	or.b	d0,$10(a4)
loc_13E120:
	move.b	#$1,-$5(a6)
loc_13E126:
	move.w	d4,d0
	addq.w	#$1,d4
	lea.l	$12(a4),a4
	bra.w	loc_13DF9A
loc_13E132:
	tst.b	-$5(a6)
	bne.s	loc_13E140
	move.l	a3,-(a7)
	jsr	ExplodeFx_Free(pc)
	addq.w	#$4,a7
loc_13E140:
	movem.l	-$22(a6),d4-d7/a3-a4
	unlk	a6
	rts
