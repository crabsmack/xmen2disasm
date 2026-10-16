; ---------------------------------------------------------------------------
; Nightcrawler_CeilingToWall - go round the end of a ceiling onto a wall, upside down
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: +6 |= $2000, +$2E bit 3 (upside down), wall animation (Tbl_Anim_1A5FD0, jt $4462), x aligned to the wall +$BC by side (+$C0 2/3); Up held -> Nightcrawler_StateWaitUpRelease else Nightcrawler_StateWallCling
; ---------------------------------------------------------------------------
Nightcrawler_CeilingToWall:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d7
	move.b	#$1,g_CamModeSwitched(a5)
	ori.w	#$2000,$6(a4)
	ori.b	#$8,$2E(a4)
	lea.l	$4462(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$2,d1
	cmp.l	d0,d1
	addq.w	#$8,a7
	bne.s	loc_1A6BBC
	ori.b	#$10,$2E(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$C(a0),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	ext.l	d7
	move.l	$C(a4),d0
	asr.l	#$8,d0
	add.l	d7,d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.w	#$4,a7
	bra.s	loc_1A6BFA
loc_1A6BBC:
	andi.b	#$EF,$2E(a4)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$8(a0),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	ext.l	d7
	move.l	$C(a4),d0
	asr.l	#$8,d0
	add.l	d7,d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.w	#$4,a7
loc_1A6BFA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A6C0E
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6C16
loc_1A6C0E:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6C16:
	beq.s	loc_1A6C2C
	clr.w	$6C(a4)
	lea.l	Nightcrawler_StateWaitUpRelease(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6C3E
loc_1A6C2C:
	clr.w	$6C(a4)
	lea.l	Nightcrawler_StateWallCling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A6C3E:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
