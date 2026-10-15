; ---------------------------------------------------------------------------
; Seg_FindInBlock - find the floor segment of a type that contains the centre of a 32-px map block
; In:  $A(a6) = word type  $E(a6) = word block column  $12(a6) = word block row
; Out: d0 = segment or 0
; Evidence: Seg_FindContaining(col*32+16, row*32+16, type); 9 callers that crack or change map blocks (AvalonA4/BaniMazaB2 floor cracks, MagnetoBoss_SmashSegment, XClone_TileHookOpenWall, ...)
; ---------------------------------------------------------------------------
Seg_FindInBlock:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,d6
	moveq	#$10,d0
	add.l	d0,d6
	move.w	$12(a6),d1
	ext.l	d1
	lsl.l	#$5,d1
	move.l	d1,d7
	add.l	d0,d7
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	Seg_FindContaining(pc)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
