; ---------------------------------------------------------------------------
; BabyBio_ActCrawl - BABYBIO script action: crawl (animation $11B33A, speed $80) to the other horizontal limit, or idle 60 frames if the limits are equal
; In:  8(a6) = this
; Out: d0
; Evidence: BabyBio_Move lunges +$700 on frame 3 of this animation; next BabyBio_WaitCrawlLimit; TAS 53684-54559
; ---------------------------------------------------------------------------
BabyBio_ActCrawl:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.w	$AC(a4),d0
	cmp.w	$AE(a4),d0
	bne.s	loc_11D5DA
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$2FBA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_11D5AA
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_11D63C
loc_11D5AA:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D5BE
	clr.w	$96(a4)
loc_11D5BE:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_11D63C
loc_11D5DA:
	lea.l	$2F82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	cmp.w	$AC(a4),d7
	addq.w	#$8,a7
	bne.s	loc_11D600
	andi.b	#$EF,$2E(a4)
	addi.l	#$100,$9C(a4)
	bra.s	loc_11D614
loc_11D600:
	cmp.w	$AE(a4),d7
	bne.s	loc_11D614
	ori.b	#$10,$2E(a4)
	subi.l	#$100,$9C(a4)
loc_11D614:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_11D624
	move.w	#$80,$16(a4)
	bra.s	loc_11D62A
loc_11D624:
	move.w	#$FF80,$16(a4)
loc_11D62A:
	clr.w	$6C(a4)
	lea.l	BabyBio_WaitCrawlLimit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11D63C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
