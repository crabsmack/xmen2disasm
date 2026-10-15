; ---------------------------------------------------------------------------
; Deathbird_StateLandOnSwitch	[link-after-rts]
; ---------------------------------------------------------------------------
Deathbird_StateLandOnSwitch:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($3E8).w
	pea.l	($170).w
	pea.l	($F0).w
	jsr	$3EFA(a5)	; -> sub_15A8FE
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_112EEE
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_112EDE
	move.w	$A(a3),d0
	bra.s	loc_112EE2
loc_112EDE:
	move.w	$E(a3),d0
loc_112EE2:
	move.w	d0,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_112EEE:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	cmpi.l	#$F0,d0
	addq.w	#$8,a7
	ble.s	loc_112F1C
	move.l	#$11800,$8(a4)
	ori.b	#$10,$2E(a4)
	bra.s	loc_112F2A
loc_112F1C:
	move.l	#$C800,$8(a4)
	andi.b	#$EF,$2E(a4)
loc_112F2A:
	lea.l	$2AF2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Deathbird_StatePeck(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
