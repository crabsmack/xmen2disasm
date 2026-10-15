; ---------------------------------------------------------------------------
; BigAcolyte_ActAppear - BIGACOLYTE intro step 2: create the debris object, render the small big-acolyte picture into VRAM, next script step
; In:  8(a6) = this
; Out: none
; Evidence: sub_13F4D4($24) -> -$3CDA; tile base +$34 from the sprite resource table; BigAcolyte_RenderScaled(jt $11A50 picture, scale 7x$B); +$A9 = 1; Tbl_BigAcolyteIntroScriptLen entry 1
; ---------------------------------------------------------------------------
BigAcolyte_ActAppear:
	link.w	a6,#$FFD6
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2E(a4),a3
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$24,d1
	move.l	d1,-(a7)
	jsr	$3B62(a5)	; -> sub_13F4D4
	move.l	d0,-$3CDA(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	BigAcolyte_LoadSprite(pc)
	jsr	$3F3A(a5)	; -> sub_15B0E6
	movea.l	-$3CDA(a5),a0
	move.w	#$400,$2(a0)
	movea.l	-$3CDA(a5),a0
	move.w	$4(a0),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$2A(a6)
	movea.l	a0,a1
	move.w	$8(a1),d7
	add.w	$6(a0),d7
	move.w	d7,$6(a3)
	move.w	#$4D,$8(a3)
	ori.b	#$80,(a3)
	ext.l	d7
	move.l	d7,d0
	moveq	#$4D,d1
	add.l	d1,d0
	lea.l	$1FA(a5),a0
	movea.l	$2(a0),a3
	move.l	a3,g_ScaleSrcBitmap(a5)
	moveq	#$0,d0
	move.b	$4(a3),d0
	moveq	#$0,d2
	move.b	$2(a3),d2
	sub.w	d2,d0
	move.w	d0,-$26(a6)
	btst	#$0,d0
	lea.l	$14(a7),a7
	beq.s	loc_010A32
	move.w	-$26(a6),d0
	addq.w	#$1,-$26(a6)
loc_010A32:
	moveq	#$0,d0
	move.b	$5(a3),d0
	moveq	#$0,d1
	move.b	$3(a3),d1
	sub.w	d1,d0
	move.w	d0,-$24(a6)
	clr.l	-$22(a6)
	move.w	-$26(a6),-$1E(a6)
	move.w	-$24(a6),-$1C(a6)
	move.w	#$7,-$1A(a6)
	move.w	#$B,-$18(a6)
	move.w	-$26(a6),-$16(a6)
	move.w	-$24(a6),-$14(a6)
	move.b	#$1,-$12(a6)
	move.b	#$1,-$11(a6)
	clr.w	-$10(a6)
	clr.b	-$E(a6)
	move.b	#$1,-$D(a6)
	clr.b	-$C(a6)
	clr.l	-$A(a6)
	clr.l	-$6(a6)
	clr.w	-$2(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	pea.l	-$26(a6)
	move.l	a3,-(a7)
	jsr	BigAcolyte_RenderScaled(pc)
	move.b	#$1,$A9(a4)
	tst.l	$98(a4)
	lea.l	$10(a7),a7
	bne.s	loc_010ACA
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_010AF6
loc_010ACA:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_010ADE
	clr.w	$96(a4)
loc_010ADE:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_010AF6:
	movem.l	-$36(a6),d7/a3-a4
	unlk	a6
	rts
