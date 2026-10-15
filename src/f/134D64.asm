; ---------------------------------------------------------------------------
; FlyBrood_Update - FlyBrood: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_134D7A
	moveq	#$2,d0
	bra.s	loc_134D7C
loc_134D7A:
	moveq	#$1,d0
loc_134D7C:
	move.w	d0,d7
	move.l	a4,-(a7)
	lea.l	$3732(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.w	loc_134E20
	tst.l	$9E(a4)
	beq.s	loc_134E20
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	$9E(a4),a0
	jsr	(a0)
	move.w	$B0(a4),d0
	btst	#$0,d0
	addq.w	#$8,a7
	beq.s	loc_134DF8
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$92(a4),d7
	bge.s	loc_134DDE
	move.w	$92(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_134DF8
loc_134DDE:
	cmp.w	$94(a4),d7
	ble.s	loc_134DF8
	move.w	$94(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_134DF8:
	moveq	#$2,d0
	and.w	$B0(a4),d0
	beq.s	loc_134E20
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$98(a4),d7
	bge.s	loc_134E20
	move.w	$98(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_134E20:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
