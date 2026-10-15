; ---------------------------------------------------------------------------
; Teleporter_Init - vtable +$12 constructor: run the parent's Init, then set up a TELEPORTER
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the TELEPORTER descriptor $085380; TAS frames 48256-48455 (2 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
Teleporter_Init:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$12D2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	movea.l	$8(a6),a0
	clr.w	$18(a0)
	movea.l	$8(a6),a0
	clr.w	$20(a0)
	lea.l	Teleporter_StateStart(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	lea.l	Teleporter_StateStart(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$64(a1)
	movea.l	$8(a6),a0
	ori.w	#$4083,$6(a0)
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_0854EA
	movea.l	$8(a6),a0
	move.w	$6(a3),$8C(a0)
	bra.s	loc_0854F2
loc_0854EA:
	movea.l	$8(a6),a0
	clr.w	$8C(a0)
loc_0854F2:
	clr.b	d5
	movea.l	$8(a6),a0
	move.w	$8C(a0),d0
	ext.l	d0
	move.l	d0,d6
	moveq	#$0,d7
	bra.s	loc_08554A
loc_085504:
	movea.l	g_SpawnRecs(a5),a0
	move.l	d7,d0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
	lea.l	$12CA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_085546
	movea.l	$A(a4),a3
	move.w	$6(a3),d0
	ext.l	d0
	cmp.l	d0,d6
	bne.s	loc_085546
	movea.l	$8(a6),a0
	move.l	a3,$8E(a0)
	moveq	#$1,d5
	bra.s	loc_085554
loc_085546:
	move.l	d7,d0
	addq.l	#$1,d7
loc_08554A:
	move.w	g_SpawnRecCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_085504
loc_085554:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
