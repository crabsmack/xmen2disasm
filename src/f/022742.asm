; ---------------------------------------------------------------------------
; AvalonB2_TileHook - map tile hook: turn tile $1A/$1B at (x,y) into tile $19
; In:  8(a6) = word column, $C(a6) = word row
; Out: d0 = 1
; Evidence: same shape as AvalonB1_TileHook; sub_15D7F8 (set map tile); installed in -$3AF4 by AvalonB2_InstallTileHooks
; ---------------------------------------------------------------------------
AvalonB2_TileHook:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	ext.l	d5
	movea.l	-$3A72(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d7
	and.w	(a0,d0.l),d7
	cmpi.w	#$1A,d7
	beq.s	loc_022780
	cmpi.w	#$1B,d7
	bne.s	loc_022798
loc_022780:
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$19,d1
	move.l	d1,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
loc_022798:
	moveq	#$1,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
