; ---------------------------------------------------------------------------
; Map_SetBlockFG - change the block number of a FG map cell (keeping its flag bits) and redraw it
; In:  8(a6) = word x, $C(a6) = word y, $10(a6) = word block, $14(a6) = byte keep hook bits
; Out: none
; Evidence: cell in $FFC77C via row table $FFC78E: (old & $FE00) | block, hook bits $3800 cleared unless kept; Map_RedrawBlock(x, y, 0); scene tile hooks use it
; ---------------------------------------------------------------------------
Map_SetBlockFG:
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
	move.w	#$FE00,d0
	and.w	(a4),d0
	move.w	$12(a6),d7
	or.w	d0,d7
	tst.b	$17(a6)
	bne.s	loc_15D83C
	andi.w	#$C7FF,d7
loc_15D83C:
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
