; ---------------------------------------------------------------------------
; TrapDoor_Init - vtable +$12 constructor: run the parent's Init, then set up a TRAPDOOR
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the TRAPDOOR descriptor $0AD956; TAS frames 30954-32834 (24 frames active); calls parent XNPC slot +$12
; ---------------------------------------------------------------------------
TrapDoor_Init:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$14(a6),a4
	movea.l	$8(a6),a3
	move.l	a4,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a3,-(a7)
	lea.l	$1C2A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a3)
	clr.l	$16(a3)
	clr.w	$20(a3)
	ori.w	#$4083,$6(a3)
	lea.l	sub_0ADB7E(pc),a0
	move.l	a0,$5C(a3)
	lea.l	sub_0ADB7E(pc),a0
	move.l	a0,$64(a3)
	lea.l	sub_0ADB7E(pc),a0
	move.l	a0,$60(a3)
	moveq	#$0,d0
	move.l	d0,$9C(a3)
	move.w	$2(a4),d5
	move.w	$4(a4),d6
	lea.l	-$33D2(a5),a4
	moveq	#$0,d7
	lea.l	$10(a7),a7
	bra.s	loc_0ADACA
loc_0ADA90:
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_0ADAC2
	moveq	#$13,d0
	cmp.b	$1(a4),d0
	bne.s	loc_0ADAC2
	cmp.w	$8(a4),d5
	blt.s	loc_0ADAC2
	cmp.w	$C(a4),d5
	bgt.s	loc_0ADAC2
	cmp.w	$A(a4),d6
	blt.s	loc_0ADAC2
	cmp.w	$E(a4),d6
	bgt.s	loc_0ADAC2
	move.l	a4,$9C(a3)
	bra.s	loc_0ADAD4
loc_0ADAC2:
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$14(a4),a4
loc_0ADACA:
	move.w	-$3474(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_0ADA90
loc_0ADAD4:
	moveq	#$0,d0
	move.b	-$3B60(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0ADAF0
	moveq	#$7F,d7
	move.w	d7,d6
	addq.w	#$1,d6
	move.w	d6,d5
	addq.w	#$1,d5
	move.w	d5,d4
	addq.w	#$1,d4
	bra.s	loc_0ADB00
loc_0ADAF0:
	move.w	#$82,d7
	move.w	d7,d6
	addq.w	#$1,d6
	move.w	d6,d5
	addq.w	#$1,d5
	move.w	d5,d4
	addq.w	#$1,d4
loc_0ADB00:
	move.w	d7,$94(a3)
	move.w	d6,$96(a3)
	move.w	d5,$98(a3)
	move.w	d4,$9A(a3)
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
