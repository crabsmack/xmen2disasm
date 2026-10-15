; ---------------------------------------------------------------------------
; Magneto_StateAirShotEnd - after an air shot: hover-damp until the follow-through animation ends, then control (keep hovering if he was)
; In:  8(a6) = player
; Out: d0
; Evidence: grounded -> re-latch direction, control; anim done -> clear B latch, +$6E = 10, hover animation again if +$12 (was hovering), control
; ---------------------------------------------------------------------------
Magneto_StateAirShotEnd:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CDDCE
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Magneto_HoverDamp(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1CDE50
loc_1CDDCE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDDE2
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDDEA
loc_1CDDE2:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDDEA:
	beq.s	loc_1CDE06
	tst.b	$9D(a4)
	bne.s	loc_1CDDFC
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDE3C
loc_1CDDFC:
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1CDE3C
loc_1CDE06:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDE1A
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDE22
loc_1CDE1A:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDE22:
	beq.s	loc_1CDE3C
	tst.b	$9D(a4)
	bne.s	loc_1CDE34
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDE3C
loc_1CDE34:
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1CDE3C:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1CDEA8
loc_1CDE50:
	tst.l	$44(a4)
	bne.s	loc_1CDEA8
	tst.b	$9D(a4)
	bne.s	loc_1CDE6C
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDE7A
loc_1CDE6C:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CDE7A:
	move.w	#$A,$6E(a4)
	tst.w	$12(a4)
	beq.s	loc_1CDE96
	lea.l	$467A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1CDE96:
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CDEA8:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
