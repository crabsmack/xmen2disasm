; ---------------------------------------------------------------------------
; SavageBio_ActCharge - SAVAGE bio script action: charge to the far side of its range (speed $220, accel $56, sound $EA), then the next step
; In:  8(a6) = this
; Out: d0
; Evidence: range +$9E..+$A0 (waits $3C when empty); next SavageBio_StateChargeToEdge
; Found: jt 1004
; ---------------------------------------------------------------------------
SavageBio_ActCharge:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	$9E(a4),d0
	cmp.w	$A0(a4),d0
	bne.s	loc_0BB980
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BB94E
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBA04
loc_0BB94E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BB962
	clr.w	$96(a4)
loc_0BB962:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBA04
loc_0BB980:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$9E(a4),d7
	bne.s	loc_0BB99E
	addi.l	#$100,$8(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BB9B2
loc_0BB99E:
	cmp.w	$A0(a4),d7
	bne.s	loc_0BB9B2
	subi.l	#$100,$8(a4)
	ori.b	#$10,$2E(a4)
loc_0BB9B2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BB9C2
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BB9C8
loc_0BB9C2:
	move.l	#$220,d0
loc_0BB9C8:
	move.w	d0,$16(a4)
	pea.l	($EA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EA).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BB9E8
	moveq	#-$56,d0
	bra.s	loc_0BB9EA
loc_0BB9E8:
	moveq	#$56,d0
loc_0BB9EA:
	ext.w	d0
	move.w	d0,$1E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	SavageBio_StateChargeToEdge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BBA04:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
