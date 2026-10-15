; ---------------------------------------------------------------------------
; HitList_AllocNode - find a free hit-list node (owner field +8 == 0) and clear its links
; In:  none
; Out: d0 = node or 0
; Evidence: scans 50 x $C-byte nodes from $FFEBB2
; ---------------------------------------------------------------------------
HitList_AllocNode:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	g_HitNodes(a5),a3
	lea.l	(a3),a4
	clr.w	d7
	moveq	#$32,d3
loc_15DF00:
	tst.l	$8(a4)
	bne.s	loc_15DF12
	moveq	#$0,d0
	move.l	d0,(a4)
	move.l	d0,$4(a4)
	move.l	a4,d0
	bra.s	loc_15DF20
loc_15DF12:
	lea.l	$C(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_15DF00
	moveq	#$0,d0
loc_15DF20:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
