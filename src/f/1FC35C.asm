; ---------------------------------------------------------------------------
; Spr_RenderToBitmap - render one sprite frame into a chunky byte-per-pixel buffer (for effects), honouring piece flips
; In:  8(a6) = sprite definition (type $18)   $C(a6) = word: frame   $10(a6) = buffer (+2..+5 header: 0, 0, width, height; pixels from +$26)
; Out: none
; Evidence: clears width*height bytes; per 8-byte piece: 4bpp tile longs expanded with Tbl_PixelPairExpand (zero pixels transparent), sizes from Tbl_SizeCodePixels; callers Cerebro_PlayIntro, loc_064868
; ---------------------------------------------------------------------------
Spr_RenderToBitmap:
	link.w	a6,#$FFEC
	movem.l	d2-d7/a2-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$24(a0),a4
	move.w	$E(a6),d0
	add.w	d0,d0
	add.w	d0,d0
	move.w	d0,d1
	add.w	d0,d0
	add.w	d0,d0
	add.w	d1,d0
	adda.w	d0,a4
	moveq	#$0,d7
	move.b	$10(a4),d7
	move.b	(a4),d0
	ext.w	d0
	move.w	d0,-$E(a6)
	move.b	$2(a4),d1
	ext.w	d1
	sub.w	d0,d1
	moveq	#$1,d0
	and.w	d1,d0
	add.w	d0,d1
	move.w	d1,-$A(a6)
	move.b	$1(a4),d0
	ext.w	d0
	move.w	d0,-$10(a6)
	move.b	$3(a4),d2
	ext.w	d2
	sub.w	d0,d2
	move.w	d2,-$C(a6)
	movea.l	$10(a6),a0
	clr.b	$2(a0)
	clr.b	$3(a0)
	move.b	d1,$4(a0)
	move.b	d2,$5(a0)
	move.w	d2,d0
	mulu.w	d1,d0
	lea.l	$26(a0),a3
	move.l	a3,-$4(a6)
	moveq	#$0,d2
	move.w	d0,d1
	lsr.w	#$2,d1
	bra.s	loc_1FC3DE
loc_1FC3DC:
	move.l	d2,(a3)+
loc_1FC3DE:
	dbra	d1,loc_1FC3DC
	andi.w	#$3,d0
	bra.s	loc_1FC3EA
loc_1FC3E8:
	move.b	d2,(a3)+
loc_1FC3EA:
	dbra	d0,loc_1FC3E8
	move.w	$12(a4),d0
	movea.l	$8(a6),a4
	adda.w	d0,a4
	lea.l	Tbl_PixelPairExpand(pc),a1
	bra.w	loc_1FC5F0
loc_1FC400:
	move.w	$4(a4),d0
	move.w	d0,d5
	andi.w	#$3,d5
	move.w	d5,-$12(a6)
	move.w	d0,d6
	lsr.w	#$2,d6
	andi.w	#$3,d6
	rol.w	#$5,d0
	move.w	d0,d1
	andi.w	#$1,d1
	move.b	d1,-$13(a6)
	andi.w	#$2,d0
	move.b	d0,-$14(a6)
	move.w	(a4),d0
	sub.w	-$E(a6),d0
	move.w	$2(a4),d1
	sub.w	-$10(a6),d1
	moveq	#$0,d3
	moveq	#-$8,d4
	move.w	-$A(a6),d3
	moveq	#$0,d2
	tst.b	-$13(a6)
	beq.s	loc_1FC450
	move.b	Tbl_SizeCodePixels(pc,d6.w),d2
	add.w	d2,d0
	neg.l	d4
loc_1FC450:
	tst.b	-$14(a6)
	beq.s	Spr_RenderToBitmap_Loop
	move.b	Tbl_SizeCodePixels(pc,d5.w),d2
	subq.w	#$1,d2
	add.w	d2,d1
	neg.l	d3
	bra.s	Spr_RenderToBitmap_Loop
