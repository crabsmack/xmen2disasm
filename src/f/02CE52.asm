; ---------------------------------------------------------------------------
; Exodus_NextPattern - EXODUS: advance to the next attack pattern from its spawn record's pattern table, reset the step
; In:  8(a6) = this
; Out: none
; Evidence: table = -$38D6 + spawn index (+$14) * 16, words +6..+$E give the successor of patterns 1-5 (0 = default next); +$A8 pattern, +$A9 step
; ---------------------------------------------------------------------------
Exodus_NextPattern:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$14(a3),d0
	movea.l	g_PlacementList(a5),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a4
	move.b	$A8(a3),d0
	cmpi.b	#$5,d0
	bhi.s	Exodus_NextPattern_part3
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02CE52(pc,d1.w),d1
	jmp	Sw_02CE52-2(pc,d1.w)
