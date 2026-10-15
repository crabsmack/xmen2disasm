; ---------------------------------------------------------------------------
; SavageA2_TileHookCrack - SavageA2 tile hook [2]: crack a breakable tile one step ($83 -> $88 -> $89 -> $27 broken; broken removes its block)
; In:  8(a6) = column, $A(a6) = row
; Out: none
; Evidence: SavageA2_SetBlockTiles(col, row, next | attrs, next == $27, $AD); installed in $FFC710
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_TileHookCrack:
	link.w	a6,#$0
	movem.l	d3-d7,-(a7)
	move.w	$A(a6),d4
	move.w	$E(a6),d0
	ext.l	d0
	movea.l	-$3A72(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d5
	move.w	#$1FF,d7
	and.w	d5,d7
	cmpi.w	#$83,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0AD386
	move.l	#$88,d0
	bra.s	loc_0AD3A8
loc_0AD386:
	cmpi.w	#$88,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0AD398
	move.l	#$89,d0
	bra.s	loc_0AD3A8
loc_0AD398:
	cmpi.w	#$89,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0AD3A6
	moveq	#$27,d0
	bra.s	loc_0AD3A8
loc_0AD3A6:
	moveq	#$27,d0
loc_0AD3A8:
	move.w	d0,d6
	move.w	#$FE00,d0
	and.w	d5,d0
	move.w	d0,d7
	or.w	d6,d7
	pea.l	($AD).w
	cmpi.w	#$27,d6
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	SavageA2_SetBlockTiles(pc)
	lea.l	$14(a7),a7
	movem.l	-$14(a6),d3-d7
	unlk	a6
	rts
