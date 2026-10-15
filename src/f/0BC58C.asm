; ---------------------------------------------------------------------------
; SavageBio_StateWaitCrossing - SAVAGE bio state: when the BIOBALLS companion (+$B4) is done, hide it and reappear on the opposite surface (floor <-> ceiling, v-flip toggled)
; In:  8(a6) = this
; Out: d0
; Evidence: y = +$A4 or +$A2 by the v-flip; next step
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateWaitCrossing:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d7
	tst.l	$B4(a4)
	beq.s	loc_0BC5C2
	move.l	$B4(a4),-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	move.b	d0,d7
	addq.w	#$4,a7
	beq.s	loc_0BC5C2
	pea.l	($FF).w
	movea.l	$B4(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_0BC5C2:
	tst.b	d7
	beq.s	loc_0BC62E
	moveq	#$8,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BC5DC
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_0BC5E8
loc_0BC5DC:
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_0BC5E8:
	eori.b	#$8,$2E(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC600
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC640
loc_0BC600:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC614
	clr.w	$96(a4)
loc_0BC614:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC640
loc_0BC62E:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateWaitCrossing(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BC640:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
