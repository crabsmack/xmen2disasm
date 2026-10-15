; ---------------------------------------------------------------------------
; Level_CompactUsedItems - number the used entries of a list compactly (optionally moving their data down) and return how many are used
; In:  8(a6) = used-bitmap  $C(a6) = count  $10(a6) = word remap table out  $17(a6) = byte: move data  $18(a6) = data  $1E(a6) = word log2(words per entry)
; Out: d0 = used count
; Evidence: sub_15FC84(bitmap, i) tests entry i; remap[i] = running index; data entries of 1 << shift words copied down; caller Level_LoadUsedTiles (blocks and tiles)
; ---------------------------------------------------------------------------
Level_CompactUsedItems:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$1E(a6),d6
	moveq	#$0,d4
	moveq	#$0,d5
	bra.s	loc_1F5600
loc_1F55A6:
	move.l	d5,-(a7)
	move.l	$8(a6),-(a7)
	jsr	$4152(a5)	; -> Bitmap_Test
	tst.l	d0
	addq.w	#$8,a7
	beq.s	loc_1F55FC
	tst.b	$17(a6)
	beq.s	loc_1F55EC
	move.l	$18(a6),-$4(a6)
	move.l	d5,d0
	lsl.l	d6,d0
	add.l	d0,d0
	movea.l	d0,a3
	adda.l	-$4(a6),a3
	move.l	d4,d0
	lsl.l	d6,d0
	add.l	d0,d0
	movea.l	d0,a4
	adda.l	-$4(a6),a4
	moveq	#$0,d7
	bra.s	loc_1F55E4
loc_1F55DE:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
loc_1F55E4:
	moveq	#$1,d0
	lsl.l	d6,d0
	cmp.l	d7,d0
	bgt.s	loc_1F55DE
loc_1F55EC:
	movea.l	$10(a6),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	d4,(a0,d0.l)
	move.l	d4,d0
	addq.l	#$1,d4
loc_1F55FC:
	move.l	d5,d0
	addq.l	#$1,d5
loc_1F5600:
	cmp.l	$C(a6),d5
	blt.s	loc_1F55A6
	move.l	d4,d0
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
