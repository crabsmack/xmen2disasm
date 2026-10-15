; ---------------------------------------------------------------------------
; sub_00FA24	[link-after-rts]
; ---------------------------------------------------------------------------
sub_00FA24:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d7
	clr.w	g_Pad1Pressed(a5)
	clr.w	g_Pad2Pressed(a5)
	clr.w	g_Pad1Latch(a5)
	clr.w	g_Pad2Latch(a5)
	moveq	#$60,d0
	cmp.w	-$3490(a5),d0
	blt.w	loc_00FAD0
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00FA70
	move.w	#$1000,d0
	and.w	-$1754(a5),d0
	beq.s	loc_00FA70
	clr.b	d7
loc_00FA70:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00FA94
	move.w	#$1000,d0
	and.w	-$1844(a5),d0
	beq.s	loc_00FA94
	clr.b	d7
loc_00FA94:
	tst.b	d7
	beq.w	loc_00FB4A
	clr.b	g_SndMute(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$C2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	jsr	sub_00F60E(pc)
	lea.l	$4212(a5),a0
	movea.l	-$35B6(a5),a1
	move.l	a0,$4(a1)
	lea.l	$C(a7),a7
	bra.s	loc_00FB4A
loc_00FAD0:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00FAF4
	clr.w	-$173A(a5)
	clr.l	-$1742(a5)
	clr.w	-$1738(a5)
loc_00FAF4:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00FB18
	clr.w	-$182A(a5)
	clr.l	-$1832(a5)
	clr.w	-$1828(a5)
loc_00FB18:
	move.w	-$348E(a5),$30(a4)
	move.w	-$348E(a5),d6
	tst.b	-$38DE(a5)
	beq.s	loc_00FB2C
	moveq	#$4,d0
	bra.s	loc_00FB2E
loc_00FB2C:
	moveq	#$2,d0
loc_00FB2E:
	ext.w	d0
	move.w	-$3490(a5),d1
	sub.w	d0,d1
	move.w	d1,$32(a4)
	move.w	d1,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_00FC12(pc)
	addq.w	#$8,a7
loc_00FB4A:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
