; ---------------------------------------------------------------------------
; AvalonB1_TileHook - map tile hook: turn tile $1F/$20 at (x,y) into tile $1E
; In:  8(a6) = word column, $C(a6) = word row
; Out: d0 = 1
; Evidence: reads the map word at -$3A84 + row offset table -$3A72; Map_SetBlockFG (set map tile) with $1E; installed in -$3AF4 by AvalonB1_InstallTileHooks
; ---------------------------------------------------------------------------
AvalonB1_TileHook:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
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
	move.w	#$1FF,d7
	and.w	(a0,d0.l),d7
	cmpi.w	#$1F,d7
	beq.s	loc_00FD20
	cmpi.w	#$20,d7
	bne.s	loc_00FD38
loc_00FD20:
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1E,d1
	move.l	d1,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	lea.l	$10(a7),a7
loc_00FD38:
	moveq	#$1,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
