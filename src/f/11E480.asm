; ---------------------------------------------------------------------------
; BioBullet_Update - BioBullet: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $11E6EC (name string "BIOBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
BioBullet_Update:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_11E4AC
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_11E5DC
loc_11E4AC:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	tst.b	-$38DE(a5)
	beq.s	loc_11E4FA
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
loc_11E4FA:
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d3
	move.w	d6,d0
	asr.w	#$5,d0
	blt.s	loc_11E52A
	move.w	d6,d0
	asr.w	#$5,d0
	cmp.w	-$3A6E(a5),d0
	bge.s	loc_11E52A
	move.w	d7,d0
	asr.w	#$5,d0
	blt.s	loc_11E52A
	move.w	d7,d0
	asr.w	#$5,d0
	cmp.w	-$3A78(a5),d0
	bge.s	loc_11E52A
	moveq	#$1,d3
loc_11E52A:
	tst.b	d3
	beq.s	loc_11E560
	move.w	d7,d0
	asr.w	#$5,d0
	ext.l	d0
	movea.l	-$3A72(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.w	d6,d1
	asr.w	#$5,d1
	ext.l	d1
	add.l	d0,d1
	movea.l	-$3A84(a5),a0
	add.l	d1,d1
	move.w	#$4000,d0
	and.w	(a0,d1.l),d0
	beq.s	loc_11E55C
	moveq	#$1,d0
	bra.s	loc_11E562
loc_11E55C:
	moveq	#$0,d0
	bra.s	loc_11E562
loc_11E560:
	moveq	#$1,d0
loc_11E562:
	beq.s	loc_11E590
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_11E570
	moveq	#$1,d0
	bra.s	loc_11E572
loc_11E570:
	moveq	#$0,d0
loc_11E572:
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
	bra.s	loc_11E5DC
loc_11E590:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	sub_11E3E6(pc)
	move.l	-$165A(a5),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4FFA(a5)	; -> sub_1FA0AE
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_11E5DC
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_11E5BE
	moveq	#$1,d0
	bra.s	loc_11E5C0
loc_11E5BE:
	moveq	#$0,d0
loc_11E5C0:
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
loc_11E5DC:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
