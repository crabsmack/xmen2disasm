; ---------------------------------------------------------------------------
; Mem_StackFree - free a Mem_StackAlloc block: pop it if it is the top block, otherwise tag it 'FREE ME'
; In:  8(a6) = block pointer (as returned by Mem_StackAlloc)
; Out: none
; Evidence: if header+0 == top g_HeapTop(a5): top = header; else header+4 = Str_FreeMe
; ---------------------------------------------------------------------------
Mem_StackFree:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	subq.w	#$8,a4
	move.l	(a4),d0
	cmp.l	g_HeapTop(a5),d0
	bne.s	loc_1FA93E
	move.l	a4,g_HeapTop(a5)
	bra.s	loc_1FA946
loc_1FA93E:
	lea.l	Str_FreeMe(pc),a0
	move.l	a0,$4(a4)
loc_1FA946:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
