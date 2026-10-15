; ---------------------------------------------------------------------------
; SavageBio_ActDashTo - SAVAGE bio script action: dash up to the nearest player (targets: halfway, then the player); if already within $20, just face it
; In:  8(a6) = this
; Out: d0
; Evidence: next sub_0BC0C4 or SavageBio_ActFacePlayer after $3C
; Found: jt 1008
; ---------------------------------------------------------------------------
SavageBio_ActDashTo:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	$9E(a4),d0
	cmp.w	$A0(a4),d0
	addq.w	#$4,a7
	bne.s	loc_0BBFCE
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BBF9C
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BC0BA
loc_0BBF9C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BBFB0
	clr.w	$96(a4)
loc_0BBFB0:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BC0BA
loc_0BBFCE:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BBFE6
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_0BBFF0
loc_0BBFE6:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_0BBFF0:
	moveq	#$20,d1
	cmp.l	d0,d1
	ble.s	loc_0BC00E
	move.w	#$3C,$6C(a4)
	lea.l	SavageBio_ActFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_0BC0BA
loc_0BC00E:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$9E(a4),d7
	bne.s	loc_0BC02C
	addi.l	#$100,$8(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BC040
loc_0BC02C:
	cmp.w	$A0(a4),d7
	bne.s	loc_0BC040
	subi.l	#$100,$8(a4)
	ori.b	#$10,$2E(a4)
loc_0BC040:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BC050
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BC056
loc_0BC050:
	move.l	#$220,d0
loc_0BC056:
	move.w	d0,$16(a4)
	pea.l	($EA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EA).w
	jsr	$521A(a5)	; -> Snd_Play
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	asr.l	#$1,d0
	add.w	d7,d0
	move.w	d0,$A8(a4)
	move.w	d6,$AA(a4)
	cmp.w	$A8(a4),d7
	addq.w	#$8,a7
	bge.s	loc_0BC08E
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BC094
loc_0BC08E:
	ori.b	#$10,$2E(a4)
loc_0BC094:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BC0A0
	moveq	#-$56,d0
	bra.s	loc_0BC0A2
loc_0BC0A0:
	moveq	#$56,d0
loc_0BC0A2:
	ext.w	d0
	move.w	d0,$1E(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BC0C4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BC0BA:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
