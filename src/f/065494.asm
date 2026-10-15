; ---------------------------------------------------------------------------
; Cerebro_ClearScreen - fill a 40x32 plane at VRAM $0000 with the blank tile $86C0
; In:  none
; Out: none
; Evidence: direct VDP writes, 32 rows of 40 words at $80-byte stride
; ---------------------------------------------------------------------------
Cerebro_ClearScreen:
	link.w	a6,#$0
	movem.l	d3/d6-d7,-(a7)
	clr.w	d6
	moveq	#$1F,d3
loc_0654A0:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$7,d0
	move.l	#$3FFF,d1
	and.l	d0,d1
	swap	d1
	clr.w	d1
	add.l	#$40000000,d1
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$7,d0
	move.l	#$C000,d2
	and.l	d0,d2
	moveq	#$E,d0
	lsr.l	d0,d2
	add.l	d1,d2
	move.l	d2,($C00004).l
	clr.w	d7
	moveq	#$27,d2
loc_0654D6:
	move.w	#$86C0,($C00000).l
	addq.w	#$1,d7
	cmp.w	d7,d2
	bge.s	loc_0654D6
	addq.w	#$1,d6
	cmp.w	d6,d3
	bge.s	loc_0654A0
	movem.l	-$C(a6),d3/d6-d7
	unlk	a6
	rts
