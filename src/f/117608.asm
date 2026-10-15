; ---------------------------------------------------------------------------
; PowerUp_Update - power-up per-frame update, a full replacement of ACTOR Update: count down the lifetime +$8C (Kill at 0), Deactivate when outside the camera bounds, give it to a live player whose box contains it and whose health is below $900 (Collect +$6E, Kill, sound $39), else step the animation script +$44 (class slot 17, +$4A; does not call the parent)
; In:  8(a6) = this
; Out: none
; Evidence: player box +$4C..+$52, health +$68; animation record {flags, count, delay word, frames at +7}; method 17 of class descriptor $117C28 (name string "POWERUP", parent ACTOR)
; ---------------------------------------------------------------------------
PowerUp_Update:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$8(a3),d5
	asr.l	#$8,d5
	move.l	$C(a3),d6
	asr.l	#$8,d6
	ext.l	d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d5,d1
	sub.l	d0,d1
	move.w	d1,-$2(a6)
	ext.l	d6
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d6,d7
	sub.l	d0,d7
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_117646
	moveq	#$2,d0
	bra.s	loc_117648
loc_117646:
	moveq	#$1,d0
loc_117648:
	move.w	d0,d4
	tst.w	$8C(a3)
	beq.s	loc_11766A
	sub.w	d4,$8C(a3)
	tst.w	$8C(a3)
	bgt.s	loc_11766A
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1177A0
loc_11766A:
	move.w	-$2(a6),d0
	cmp.w	g_DeactWinRight(a5),d0
	bgt.s	loc_11768A
	move.w	-$2(a6),d0
	cmp.w	g_DeactWinLeft(a5),d0
	blt.s	loc_11768A
	cmp.w	g_DeactWinBottom(a5),d7
	bgt.s	loc_11768A
	cmp.w	g_DeactWinTop(a5),d7
	bge.s	loc_1176A6
loc_11768A:
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.w	loc_1177A0
loc_1176A6:
	clr.w	d7
loc_1176A8:
	tst.w	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1176B8
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_1176BE
loc_1176B8:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_1176BE:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_117722
	cmp.w	$4E(a4),d5
	blt.s	loc_117722
	cmp.w	$52(a4),d5
	bgt.s	loc_117722
	cmp.w	$4C(a4),d6
	blt.s	loc_117722
	cmp.w	$50(a4),d6
	bgt.s	loc_117722
	tst.w	$68(a4)
	ble.s	loc_117722
	cmpi.w	#$900,$68(a4)
	bge.s	loc_117722
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	bra.s	loc_1177A0
loc_117722:
	addq.w	#$1,d7
	cmpi.w	#$2,d7
	blt.w	loc_1176A8
	add.w	d4,$4A(a3)
	movea.l	$44(a3),a0
	move.w	$4A(a3),d0
	cmp.w	$2(a0),d0
	blt.s	loc_1177A0
	addq.w	#$1,$48(a3)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$48(a3),d0
	bgt.s	loc_117766
	clr.w	$48(a3)
	movea.l	$44(a3),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_117766
	moveq	#$0,d0
	move.l	d0,$44(a3)
loc_117766:
	tst.l	$44(a3)
	beq.s	loc_1177A0
	move.w	$48(a3),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$44(a3),d0
	movea.l	d0,a0
	move.b	$7(a0),$2F(a3)
	moveq	#$0,d0
	move.b	$2F(a3),d0
	cmpi.w	#$FF,d0
	beq.s	loc_117796
	move.b	$2F(a3),d0
	cmp.b	$38(a3),d0
	beq.s	loc_11779C
loc_117796:
	andi.b	#$DF,$2E(a3)
loc_11779C:
	clr.w	$4A(a3)
loc_1177A0:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
