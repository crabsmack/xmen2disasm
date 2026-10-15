; ---------------------------------------------------------------------------
; DropBomb_Init - vtable +$12 constructor: run the parent's Init, then set up a DROPBOMB
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the DROPBOMB descriptor $082294; TAS frames 48297-49894 (5 frames active); calls parent ACTOR slot +$12; state handler(s) put in +$5C: sub_08243E
; ---------------------------------------------------------------------------
DropBomb_Init:
	link.w	a6,#$FFF0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$11A2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	sub_08243E(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_08243E(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$4083,$6(a4)
	lea.l	$1572(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	a3,d0
	lea.l	$10(a7),a7
	bne.s	loc_0823D2
	lea.l	-$10(a6),a3
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a3)
	move.w	#$78,$6(a3)
	clr.l	$8(a3)
	clr.l	$C(a3)
loc_0823D2:
	move.w	$6(a3),d6
	beq.s	loc_0823DE
	move.w	d6,$8E(a4)
	bra.s	loc_0823E4
loc_0823DE:
	move.w	#$78,$8E(a4)
loc_0823E4:
	move.w	$2(a3),d6
	move.w	$4(a3),d7
	pea.l	($3E8).w
	ext.l	d7
	move.l	d7,d0
	moveq	#$20,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EFA(a5)	; -> sub_15A8FE
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_08242A
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_082420
	move.w	$A(a3),d0
	bra.s	loc_082424
loc_082420:
	move.w	$E(a3),d0
loc_082424:
	move.w	d0,$8C(a4)
	bra.s	loc_082434
loc_08242A:
	move.w	d7,d0
	add.w	#$A0,d0
	move.w	d0,$8C(a4)
loc_082434:
	movem.l	-$24(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
