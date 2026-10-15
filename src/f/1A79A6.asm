; ---------------------------------------------------------------------------
; sub_1A79A6	[jt 2206]
; ---------------------------------------------------------------------------
sub_1A79A6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BA2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	lea.l	$18(a7),a7
	beq.w	loc_1A7A7E
	moveq	#$1,d0
	and.l	$90(a4),d0
	beq.s	loc_1A7A7E
	pea.l	($84).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($87).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($87).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$F900,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	#$2,$6C(a4)
	movea.l	$8C(a4),a0
	move.w	$18(a0),$24(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	clr.w	$16(a4)
	andi.l	#$FFFFFFFD,$90(a4)
	bclr	#$0,$93(a4)
	tst.b	$9D(a4)
	lea.l	$C(a7),a7
	bne.s	loc_1A7A70
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1A7A7E
loc_1A7A70:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1A7A7E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
