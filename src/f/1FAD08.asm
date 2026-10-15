; ---------------------------------------------------------------------------
; sub_1FAD08	[jt 2567]
; ---------------------------------------------------------------------------
sub_1FAD08:
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
	jsr	sub_1FAA08(pc)
	move.w	d0,d7
	move.l	g_HeapTop(a5),(a4)
	move.w	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
