; ---------------------------------------------------------------------------
; Map_SetBlockFGFlip - change a FG map cell's block and flip bits and redraw it
; In:  8(a6) = word x, $C(a6) = word y, $10(a6) = word block, $14(a6) = byte keep hook bits, $18/$1C(a6) = bytes flip ($200/$400)
; Out: none
; Evidence: (old & $F800) | block | flips; Map_RedrawBlock(x, y, 0)
; ---------------------------------------------------------------------------
Map_SetBlockFGFlip:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	ext.l	d5
	movea.l	g_FgRowTable(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	move.w	#$F800,d0
	and.w	(a4),d0
	move.w	$12(a6),d7
	or.w	d0,d7
	tst.b	$17(a6)
	bne.s	loc_15D89C
	andi.w	#$C7FF,d7
loc_15D89C:
	tst.b	$1B(a6)
	beq.s	loc_15D8A6
	ori.w	#$200,d7
loc_15D8A6:
	tst.b	$1F(a6)
	beq.s	loc_15D8B0
	ori.w	#$400,d7
loc_15D8B0:
	move.w	d7,(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	Map_RedrawBlock(pc)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
