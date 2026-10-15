; ---------------------------------------------------------------------------
; XPlayer_StateHurtRecover - hurt state: stay knocked back until landing (then Land, maybe hard landing) or the hurt timer ends, blinking invulnerable
; In:  8(a6) = player
; Out: d0
; Evidence: +$6A = 2 while flying; on ground: +$6A = 40, +6 |= $40 blink, +$90 &= ~8, vtable +$9A Land, fall speed >= $44C -> +$EA HardLanding else control; airborne and +$6E < 1 -> control
; ---------------------------------------------------------------------------
XPlayer_StateHurtRecover:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$2,$6A(a4)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F3BCA
	move.w	#$28,$6A(a4)
	ori.w	#$40,$6(a4)
	andi.l	#$FFFFFFF7,$90(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$9A(a0),a1
	jsr	(a1)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3B2E
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3B36
loc_1F3B2E:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3B36:
	addq.w	#$4,a7
	beq.s	loc_1F3B54
	tst.b	$9D(a4)
	bne.s	loc_1F3B4A
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3B8A
loc_1F3B4A:
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F3B8A
loc_1F3B54:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3B68
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3B70
loc_1F3B68:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3B70:
	beq.s	loc_1F3B8A
	tst.b	$9D(a4)
	bne.s	loc_1F3B82
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3B8A
loc_1F3B82:
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1F3B8A:
	cmpi.w	#$44C,$1C(a4)
	blt.s	loc_1F3BA8
	movea.l	(a4),a0
	move.l	$EA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$EA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F3C72
loc_1F3BA8:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F3C72
loc_1F3BCA:
	tst.w	$6E(a4)
	bgt.w	loc_1F3C60
	move.w	#$28,$6A(a4)
	ori.w	#$40,$6(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3BF2
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3BFA
loc_1F3BF2:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3BFA:
	beq.s	loc_1F3C16
	tst.b	$9D(a4)
	bne.s	loc_1F3C0C
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3C4C
loc_1F3C0C:
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F3C4C
loc_1F3C16:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3C2A
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3C32
loc_1F3C2A:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3C32:
	beq.s	loc_1F3C4C
	tst.b	$9D(a4)
	bne.s	loc_1F3C44
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3C4C
loc_1F3C44:
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1F3C4C:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F3C72
loc_1F3C60:
	clr.w	$6C(a4)
	lea.l	XPlayer_StateHurtRecover(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F3C72:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
