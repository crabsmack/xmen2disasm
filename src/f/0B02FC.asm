; ---------------------------------------------------------------------------
; SavageA3_TileHookCrack - SavageA3 tile hook [2]: crack a breakable tile one step ($86 -> $8B -> $8C -> $2A broken; broken removes its block)
; In:  8(a6) = column, $A(a6) = row
; Out: none
; Evidence: SavageA2_SetBlockTiles(col, row, next | attrs, next == $2A, $47); installed by SavageA3_InstallTileHooks; TAS 32870-32879
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_TileHookCrack:
	link.w	a6,#$0
	movem.l	d3-d7,-(a7)
	move.w	$A(a6),d4
	move.w	$E(a6),d0
	ext.l	d0
	movea.l	g_FgRowTable(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d5
	move.w	#$1FF,d7
	and.w	d5,d7
	cmpi.w	#$86,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B0340
	move.l	#$8B,d0
	bra.s	loc_0B0362
loc_0B0340:
	cmpi.w	#$8B,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B0352
	move.l	#$8C,d0
	bra.s	loc_0B0362
loc_0B0352:
	cmpi.w	#$8C,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B0360
	moveq	#$2A,d0
	bra.s	loc_0B0362
loc_0B0360:
	moveq	#$2A,d0
loc_0B0362:
	move.w	d0,d6
	move.w	#$FE00,d0
	and.w	d5,d0
	move.w	d0,d7
	or.w	d6,d7
	moveq	#$47,d0
	move.l	d0,-(a7)
	cmpi.w	#$2A,d6
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$1BF2(a5)	; -> SavageA2_SetBlockTiles
	lea.l	$14(a7),a7
	movem.l	-$14(a6),d3-d7
	unlk	a6
	rts
