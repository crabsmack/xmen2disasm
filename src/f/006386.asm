; ---------------------------------------------------------------------------
; HUD_UpdateHealthBars - draw both players' health meters (and a second meter from player +$9E) into VRAM
; In:  none
; Out: none
; Evidence: health +$68 -> bars = (h-1)>>8 + 1 capped at 9, blinking via g_FrameCounter bit 4 when <= 2; 128-byte tile strips DMAed with sub_1FE17A to VRAM $FF80/$FF00 (P1) and $FC00/$FC80 (P2); full redraw via HUD_Redraw when -$38E2 != -$38E0; TAS frames 148-57445
; ---------------------------------------------------------------------------
HUD_UpdateHealthBars:
	link.w	a6,#$FFF4
	movem.l	d3/d6-d7/a3-a4,-(a7)
	lea.l	$3F8A(a5),a0
	move.l	$2(a0),-$C(a6)
	lea.l	$3F82(a5),a0
	move.l	$2(a0),-$8(a6)
	clr.b	g_HudDirty(a5)
	move.b	-$38E2(a5),d0
	cmp.b	-$38E0(a5),d0
	beq.s	loc_0063BE
	move.b	-$38E0(a5),-$38E2(a5)
	jsr	HUD_Redraw(pc)
	bra.w	loc_00657A
loc_0063BE:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_00649C
	lea.l	g_Player1(a5),a3
	move.w	$68(a3),d6
	bgt.s	loc_0063E6
	clr.w	d7
	bra.s	loc_006414
loc_0063E6:
	ext.l	d6
	move.l	d6,d0
	subq.l	#$1,d0
	asr.l	#$8,d0
	move.w	d0,d7
	addq.w	#$1,d7
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$9,d0
	bls.s	loc_006400
	moveq	#$9,d7
	bra.s	loc_006414
loc_006400:
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$2,d0
	bhi.s	loc_006414
	moveq	#$10,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_006414
	clr.w	d7
loc_006414:
	moveq	#$0,d0
	move.w	d7,d0
	lsl.l	#$7,d0
	add.l	-$C(a6),d0
	move.l	d0,-$4(a6)
	pea.l	($80).w
	move.l	#$FF80,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	tst.b	-$18A8(a5)
	lea.l	$C(a7),a7
	beq.s	loc_00649C
	move.w	$9E(a3),d7
	asr.w	#$2,d7
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$8,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_00645A
	moveq	#$0,d0
	move.w	d7,d0
	tst.l	d0
	bra.s	loc_00645C
loc_00645A:
	moveq	#$8,d0
loc_00645C:
	move.w	d0,d7
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#$8,d1
	cmp.l	d0,d1
	bne.s	loc_006478
	moveq	#$8,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_006472
	addq.w	#$1,d7
loc_006472:
	move.b	#$1,g_HudDirty(a5)
loc_006478:
	moveq	#$0,d0
	move.w	d7,d0
	lsl.l	#$7,d0
	add.l	-$8(a6),d0
	move.l	d0,-$4(a6)
	pea.l	($80).w
	move.l	#$FF00,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
loc_00649C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_00657A
	lea.l	g_Player2(a5),a4
	move.w	$68(a4),d6
	bgt.s	loc_0064C4
	clr.w	d7
	bra.s	loc_0064F2
loc_0064C4:
	ext.l	d6
	move.l	d6,d0
	subq.l	#$1,d0
	asr.l	#$8,d0
	move.w	d0,d7
	addq.w	#$1,d7
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$9,d0
	bls.s	loc_0064DE
	moveq	#$9,d7
	bra.s	loc_0064F2
loc_0064DE:
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$2,d0
	bhi.s	loc_0064F2
	moveq	#$10,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0064F2
	clr.w	d7
loc_0064F2:
	moveq	#$0,d0
	move.w	d7,d0
	lsl.l	#$7,d0
	add.l	-$C(a6),d0
	move.l	d0,-$4(a6)
	pea.l	($80).w
	move.l	#$FC00,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	tst.b	-$18AA(a5)
	lea.l	$C(a7),a7
	beq.s	loc_00657A
	move.w	$9E(a4),d7
	asr.w	#$2,d7
	moveq	#$0,d0
	move.w	d7,d0
	cmpi.w	#$8,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_006538
	moveq	#$0,d0
	move.w	d7,d0
	tst.l	d0
	bra.s	loc_00653A
loc_006538:
	moveq	#$8,d0
loc_00653A:
	move.w	d0,d7
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#$8,d1
	cmp.l	d0,d1
	bne.s	loc_006556
	moveq	#$8,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_006550
	addq.w	#$1,d7
loc_006550:
	move.b	#$1,g_HudDirty(a5)
loc_006556:
	moveq	#$0,d0
	move.w	d7,d0
	lsl.l	#$7,d0
	add.l	-$8(a6),d0
	move.l	d0,-$4(a6)
	pea.l	($80).w
	move.l	#$FC80,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
loc_00657A:
	movem.l	-$20(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
