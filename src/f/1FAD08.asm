; ---------------------------------------------------------------------------
; Spr_PreloadToHeap - Spr_PreloadTiles wrapped in a Mem_StackAlloc block so the RAM copy stays allocated
; In:  8(a6) = sprite instance   $C(a6) = word: first VRAM tile
; Out: d0 = word: next free VRAM tile
; Evidence: Mem_StackAlloc(0, Str_EmptyTag), Spr_PreloadTiles, then the block header's next-top = g_HeapTop; callers SprDef_Add and 3 others
; ---------------------------------------------------------------------------
Spr_PreloadToHeap:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	g_HeapTop(a5),a4
	pea.l	Str_EmptyTag(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	jsr	Spr_PreloadTiles(pc)
	move.w	d0,d7
	move.l	g_HeapTop(a5),(a4)
	move.w	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
