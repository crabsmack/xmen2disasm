; ---------------------------------------------------------------------------
; Pal_RestoreBase - copy the saved 64-colour palette back into the base palette
; In:  none
; Out: none
; Evidence: g_PalBase[i] = g_PalSave[i], i = 0..63
; ---------------------------------------------------------------------------
Pal_RestoreBase:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	lea.l	g_PalSave(a5),a4
	clr.b	d7
	moveq	#$40,d3
loc_1F685E:
	ext.w	d7
	move.l	d7,d0
	add.w	d0,d0
	ext.w	d7
	move.l	d7,d1
	add.w	d1,d1
	lea.l	g_PalBase(a5),a0
	move.w	(a4,d0.w),(a0,d1.w)
	move.b	d7,d0
	addq.b	#$1,d7
	cmp.b	d7,d3
	bgt.s	loc_1F685E
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
