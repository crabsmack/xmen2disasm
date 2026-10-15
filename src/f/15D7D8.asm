; ---------------------------------------------------------------------------
; Map_RefreshBlock - redraw one FG map block
; In:  8(a6) = word block x, $C(a6) = word block y
; Out: none
; Evidence: Map_RedrawBlock(x, y, 0)
; ---------------------------------------------------------------------------
Map_RefreshBlock:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$A(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	Map_RedrawBlock(pc)
	unlk	a6
	rts
