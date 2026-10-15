; ---------------------------------------------------------------------------
; DrawList_AllocNode - find a free draw-list node (flags word 0), searching round-robin from the cursor
; In:  none
; Out: d0 = node pointer, 0 if none free
; Evidence: scans -$134C..-$1108 from cursor -$1358 with wrap; advances the cursor past the found node
; ---------------------------------------------------------------------------
DrawList_AllocNode:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	g_DrawNodeCursor(a5),a4
	lea.l	-$1108(a5),a3
	bra.s	loc_1F8F74
loc_1F8F5E:
	lea.l	$14(a4),a4
	cmpa.l	a4,a3
	bcc.s	loc_1F8F6A
	lea.l	g_DrawNodes(a5),a4
loc_1F8F6A:
	cmpa.l	g_DrawNodeCursor(a5),a4
	bne.s	loc_1F8F74
	moveq	#$0,d0
	bra.s	loc_1F8F98
loc_1F8F74:
	moveq	#$0,d0
	move.w	$12(a4),d0
	tst.l	d0
	bne.s	loc_1F8F5E
	move.l	a4,d0
	moveq	#$14,d1
	add.l	d1,d0
	move.l	d0,g_DrawNodeCursor(a5)
	cmpa.l	g_DrawNodeCursor(a5),a3
	bcc.s	loc_1F8F96
	lea.l	g_DrawNodes(a5),a0
	move.l	a0,g_DrawNodeCursor(a5)
loc_1F8F96:
	move.l	a4,d0
loc_1F8F98:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
