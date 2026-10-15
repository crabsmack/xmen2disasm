; ---------------------------------------------------------------------------
; AvalonA2_ToggleTileHook - map tile hook: toggle tile bit 9 at (x,y), clear its palette/flip bits and redraw it (after RetractFloor_TriggerNearest on the row)
; In:  8(a6) = word column, $C(a6) = word row
; Out: d0 = 0
; Evidence: installed in -$3AF0 by AvalonA2_InstallTileHooks; Map_RefreshBlock redraws the cell
; ---------------------------------------------------------------------------
AvalonA2_ToggleTileHook:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$A(a6),d6
	move.w	$E(a6),d7
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,d5
	lsl.l	#$8,d5
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,d5
	lsl.l	#$8,d5
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$54A(a5)	; -> RetractFloor_TriggerNearest
	eori.w	#$200,(a4)
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	andi.w	#$C7FF,(a0,d0.l)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FD2(a5)	; -> Map_RefreshBlock
	moveq	#$0,d0
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
