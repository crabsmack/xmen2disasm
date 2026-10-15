; ---------------------------------------------------------------------------
; ClassList_CallSlot62 - call vtable slot $62 (0, i) on every class descriptor in the current level class list
; In:  none
; Out: none
; Evidence: class list g_ClassList(a5) = {word bytes; desc*[]}, count = (bytes-2)/4; slot $62 is empty in ACTOR; called by the scene loop sub_0656B0 when the scene-exit countdown ends
; ---------------------------------------------------------------------------
ClassList_CallSlot62:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	tst.l	g_ClassList(a5)
	beq.s	loc_1FA8BA
	movea.l	g_ClassList(a5),a0
	move.w	(a0),d0
	ext.l	d0
	subq.l	#$2,d0
	move.l	d0,d6
	asr.l	#$2,d6
	movea.l	g_ClassList(a5),a0
	lea.l	$2(a0),a4
	moveq	#$0,d7
	bra.s	loc_1FA8B6
loc_1FA8A0:
	movea.l	(a4),a0
	movea.l	$62(a0),a3
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	(a3)
	addq.w	#$8,a7
	move.l	d7,d0
	addq.l	#$1,d7
	addq.w	#$4,a4
loc_1FA8B6:
	cmp.l	d7,d6
	bgt.s	loc_1FA8A0
loc_1FA8BA:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
