; ---------------------------------------------------------------------------
; DrawList_Init - clear the 30-node draw list
; In:  none
; Out: d0 = 0
; Evidence: nodes of $14 bytes at g_DrawNodes(a5) {+0 next, +4 prev, +8 func, +$C object, +$10 sort key = $5FF, +$12 flags = 0}; head -$1350, tail -$1354, alloc cursor -$1358
; ---------------------------------------------------------------------------
DrawList_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	g_DrawNodes(a5),a3
	move.l	a3,g_DrawNodeCursor(a5)
	movea.l	a3,a4
	moveq	#$0,d7
	moveq	#$1E,d3
loc_1F8F0C:
	moveq	#$0,d0
	move.l	d0,$4(a4)
	move.l	d0,(a4)
	move.l	d0,$8(a4)
	move.l	d0,$C(a4)
	move.w	#$5FF,$10(a4)
	clr.w	$12(a4)
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$14(a4),a4
	cmp.l	d7,d3
	bgt.s	loc_1F8F0C
	moveq	#$0,d0
	move.l	d0,g_DrawListTail(a5)
	move.l	d0,g_DrawListHead(a5)
	clr.b	g_DrawListZero(a5)
	moveq	#$0,d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
