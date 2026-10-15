; ---------------------------------------------------------------------------
; Cerebro_PrintText - print a word-wrapped string into the Cerebro text window (plane at VRAM $E000), optionally typing it out with a colour flash
; In:  8(a6) = string ('\r' = newline), $C(a6) = style 0-7
; Out: none
; Evidence: cursor -$3B04/-$3B06, window -$3C58..-$3C5C; styles 4-7 animate per character with VDP_WaitVBlank; style picks the font tile bank
; ---------------------------------------------------------------------------
Cerebro_PrintText:
	link.w	a6,#$FFE4
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d4
	move.w	#$2A2,-$12(a6)
	move.w	#$4A4,-$14(a6)
	move.w	#$6A6,-$16(a6)
	move.w	#$8A8,-$18(a6)
	move.w	#$AAA,-$1A(a6)
	move.w	#$CCC,-$1C(a6)
	move.w	#$22A,-$6(a6)
	move.w	#$44A,-$8(a6)
	move.w	#$66A,-$A(a6)
	move.w	#$88A,-$C(a6)
	move.w	#$AAA,-$E(a6)
	move.w	#$CCC,-$10(a6)
	clr.w	d5
	lea.l	-$1C(a6),a0
	move.l	a0,-$4(a6)
	cmpi.w	#$1,d4
	beq.s	loc_064FE0
	cmpi.w	#$5,d4
	beq.s	loc_064FE0
	cmpi.w	#$7,d4
	bne.s	loc_064FEA
loc_064FE0:
	moveq	#$1,d5
	lea.l	-$10(a6),a0
	move.l	a0,-$4(a6)
loc_064FEA:
	cmpi.w	#$2,d4
	bne.s	loc_064FF2
	moveq	#$2,d5
loc_064FF2:
	cmpi.w	#$3,d4
	bne.w	loc_065388
	moveq	#$3,d5
	bra.w	loc_065388
loc_065000:
	tst.w	-$3B02(a5)
	bne.s	loc_065026
	cmpi.w	#$5,d4
	beq.s	loc_065012
	cmpi.w	#$7,d4
	bne.s	loc_065016
loc_065012:
	moveq	#$1,d4
	moveq	#$1,d5
loc_065016:
	cmpi.w	#$4,d4
	beq.s	loc_065022
	cmpi.w	#$6,d4
	bne.s	loc_065026
loc_065022:
	clr.w	d4
	clr.w	d5
loc_065026:
	movea.l	$8(a6),a0
	moveq	#$D,d0
	cmp.b	(a0),d0
	bne.s	loc_065054
	move.w	-$3B06(a5),d0
	cmp.w	-$3C5C(a5),d0
	bge.s	loc_065042
	move.w	-$3B06(a5),d0
	addq.w	#$1,-$3B06(a5)
loc_065042:
	move.w	-$3C56(a5),-$3B04(a5)
	move.l	$8(a6),d0
	addq.l	#$1,$8(a6)
	bra.w	loc_065388
loc_065054:
	movea.l	$8(a6),a4
	bra.s	loc_06505C
loc_06505A:
	addq.w	#$1,a4
loc_06505C:
	moveq	#$20,d0
	cmp.b	(a4),d0
	beq.s	loc_06505A
	moveq	#$D,d0
	cmp.b	(a4),d0
	beq.s	loc_06505A
	moveq	#$9,d0
	cmp.b	(a4),d0
	beq.s	loc_06505A
	movea.l	a4,a3
	bra.s	loc_065074
loc_065072:
	addq.w	#$1,a3
loc_065074:
	moveq	#$20,d0
	cmp.b	(a3),d0
	beq.s	loc_06508A
	moveq	#$D,d0
	cmp.b	(a3),d0
	beq.s	loc_06508A
	moveq	#$9,d0
	cmp.b	(a3),d0
	beq.s	loc_06508A
	tst.b	(a3)
	bne.s	loc_065072
loc_06508A:
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	a3,d1
	sub.l	$8(a6),d1
	subq.l	#$1,d1
	add.l	d0,d1
	move.w	-$3C5A(a5),d0
	ext.l	d0
	cmp.l	d1,d0
	bge.s	loc_0650C0
	move.w	-$3B06(a5),d0
	cmp.w	-$3C5C(a5),d0
	bge.s	loc_0650B6
	move.w	-$3B06(a5),d0
	addq.w	#$1,-$3B06(a5)
loc_0650B6:
	move.w	-$3C56(a5),-$3B04(a5)
	move.l	a4,$8(a6)
loc_0650C0:
	cmpi.w	#$6,d4
	beq.s	loc_0650CE
	cmpi.w	#$7,d4
	bne.w	loc_0651FA
loc_0650CE:
	move.w	-$3B04(a5),d6
	movea.l	$8(a6),a4
	bra.w	loc_0651F0
loc_0650DA:
	move.w	-$3B06(a5),d0
	ext.l	d0
	lsl.l	#$7,d0
	add.l	#$E000,d0
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$1,d1
	add.l	d0,d1
	move.l	#$3FFF,d0
	and.l	d1,d0
	swap	d0
	clr.w	d0
	add.l	#$40000000,d0
	move.w	-$3B06(a5),d1
	ext.l	d1
	lsl.l	#$7,d1
	add.l	#$E000,d1
	ext.l	d6
	move.l	d6,d2
	lsl.l	#$1,d2
	add.l	d1,d2
	move.l	#$C000,d1
	and.l	d2,d1
	moveq	#$E,d2
	lsr.l	d2,d1
	add.l	d0,d1
	move.l	d1,($C00004).l
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E5C0,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	clr.w	d7
loc_065140:
	ext.l	d7
	movea.l	-$4(a6),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),-$3912(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	jsr	Cerebro_FrameHook(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$6,d7
	blt.s	loc_065140
	move.w	-$3B06(a5),d0
	ext.l	d0
	lsl.l	#$7,d0
	add.l	#$E000,d0
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$1,d1
	add.l	d0,d1
	move.l	#$3FFF,d0
	and.l	d1,d0
	swap	d0
	clr.w	d0
	add.l	#$40000000,d0
	move.w	-$3B06(a5),d1
	ext.l	d1
	lsl.l	#$7,d1
	add.l	#$E000,d1
	ext.l	d6
	move.l	d6,d2
	lsl.l	#$1,d2
	add.l	d1,d2
	move.l	#$C000,d1
	and.l	d2,d1
	moveq	#$E,d2
	lsr.l	d2,d1
	add.l	d0,d1
	move.l	d1,($C00004).l
	tst.w	d5
	beq.s	loc_0651D2
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E680,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	loc_0651E4
loc_0651D2:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E6C0,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
loc_0651E4:
	jsr	Cerebro_FrameHook(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	addq.w	#$1,d6
	addq.w	#$1,a4
loc_0651F0:
	cmpa.l	a4,a3
	bne.w	loc_0650DA
	bra.w	loc_06537A
loc_0651FA:
	cmpi.w	#$4,d4
	beq.s	loc_065208
	cmpi.w	#$5,d4
	bne.w	loc_0652AE
loc_065208:
	move.w	-$3B06(a5),d0
	ext.l	d0
	lsl.l	#$7,d0
	add.l	#$E000,d0
	move.w	-$3B04(a5),d1
	ext.l	d1
	lsl.l	#$1,d1
	add.l	d0,d1
	move.l	#$3FFF,d0
	and.l	d1,d0
	swap	d0
	clr.w	d0
	add.l	#$40000000,d0
	move.w	-$3B06(a5),d1
	ext.l	d1
	lsl.l	#$7,d1
	add.l	#$E000,d1
	move.w	-$3B04(a5),d2
	ext.l	d2
	lsl.l	#$1,d2
	add.l	d1,d2
	move.l	#$C000,d1
	and.l	d2,d1
	moveq	#$E,d2
	lsr.l	d2,d1
	add.l	d0,d1
	move.l	d1,($C00004).l
	movea.l	$8(a6),a4
	bra.s	loc_065278
loc_065264:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E5C0,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	addq.w	#$1,a4
loc_065278:
	cmpa.l	a4,a3
	bne.s	loc_065264
	clr.w	d7
loc_06527E:
	ext.l	d7
	movea.l	-$4(a6),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),-$3912(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	jsr	Cerebro_FrameHook(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	jsr	Cerebro_FrameHook(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$6,d7
	blt.s	loc_06527E
loc_0652AE:
	move.w	-$3B06(a5),d0
	ext.l	d0
	lsl.l	#$7,d0
	add.l	#$E000,d0
	move.w	-$3B04(a5),d1
	ext.l	d1
	lsl.l	#$1,d1
	add.l	d0,d1
	move.l	#$3FFF,d0
	and.l	d1,d0
	swap	d0
	clr.w	d0
	add.l	#$40000000,d0
	move.w	-$3B06(a5),d1
	ext.l	d1
	lsl.l	#$7,d1
	add.l	#$E000,d1
	move.w	-$3B04(a5),d2
	ext.l	d2
	lsl.l	#$1,d2
	add.l	d1,d2
	move.l	#$C000,d1
	and.l	d2,d1
	moveq	#$E,d2
	lsr.l	d2,d1
	add.l	d0,d1
	move.l	d1,($C00004).l
	movea.l	$8(a6),a4
	bra.s	loc_065376
loc_06530A:
	move.w	d5,d0
	bmi.s	loc_065374
	cmpi.w	#$3,d0
	bgt.s	loc_065374
	add.w	d0,d0
	move.w	Sw_064F70(pc,d0.w),d0
	jmp	Sw_064F70-2(pc,d0.w)
