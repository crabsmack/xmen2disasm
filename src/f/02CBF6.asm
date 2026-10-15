; ---------------------------------------------------------------------------
; AvalonA3_SavePalettes - save 14 colours of palette lines 0 and 2 into two buffers for AvalonA3_PsiFlashStep
; In:  8(a6) = buffer for line 0, $C(a6) = buffer for line 2
; Out: none
; Evidence: clears -$3CBA; pointers kept in -$3B14/-$3B18; buffers are on AvalonA3_RunScene's stack
; ---------------------------------------------------------------------------
AvalonA3_SavePalettes:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	clr.w	-$3CBA(a5)
	move.l	$8(a6),-$3B14(a5)
	move.l	$C(a6),-$3B18(a5)
	moveq	#$0,d7
	moveq	#$E,d3
loc_02CC12:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	movea.l	-$3B14(a5),a1
	move.l	d7,d1
	add.l	d1,d1
	move.w	(a0,d0.w),(a1,d1.l)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_02CC12
	moveq	#$0,d7
	moveq	#$E,d3
loc_02CC34:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$3940(a5),a0
	movea.l	-$3B18(a5),a1
	move.l	d7,d1
	add.l	d1,d1
	move.w	(a0,d0.w),(a1,d1.l)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_02CC34
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
