; ---------------------------------------------------------------------------
; Level_FillBlockSlot - write a 4x4 block definition whose 16 tiles are consecutive from a slot's tile base (optionally h-flipped)
; In:  8(a6) = block definitions   $C(a6) = word: tile base   $10(a6) = word: block number   $14(a6) = word: first slot block   $18(a6) = byte: h-flip
; Out: d0 = last row index
; Evidence: definition = blocks + (n & $1FF) * $20; tile = base + (n - first)*$10 + row + col*4 (column-major), flip adds $800 and mirrors columns
; ---------------------------------------------------------------------------
Level_FillBlockSlot:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.b	$1B(a6),d4
	move.w	#$1FF,d0
	and.w	d6,d0
	moveq	#$0,d1
	move.w	d0,d1
	lsl.l	#$4,d1
	add.l	d1,d1
	movea.l	d1,a4
	adda.l	$8(a6),a4
	ext.l	d6
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	lsl.l	#$4,d0
	move.w	d0,d5
	add.w	$E(a6),d5
	clr.w	d6
	moveq	#$4,d3
loc_1F5384:
	clr.w	d7
loc_1F5386:
	tst.b	d4
	beq.s	loc_1F53A2
	ext.l	d5
	ext.l	d7
	moveq	#$3,d0
	sub.l	d7,d0
	lsl.l	#$2,d0
	add.l	d5,d0
	ext.l	d6
	add.l	d6,d0
	add.w	#$800,d0
	move.w	d0,(a4)
	bra.s	loc_1F53B0
loc_1F53A2:
	ext.l	d5
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$2,d0
	add.l	d5,d0
	add.w	d6,d0
	move.w	d0,(a4)
loc_1F53B0:
	addq.w	#$2,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5386
	move.w	d6,d0
	addq.w	#$1,d6
	cmp.w	d6,d3
	bgt.s	loc_1F5384
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
