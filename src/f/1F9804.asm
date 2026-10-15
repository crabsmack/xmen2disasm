; ---------------------------------------------------------------------------
; ClassList_CallSlot5A - call vtable slot $5A (0, i) on every class descriptor in the current level class list
; In:  none
; Out: none
; Evidence: same walk as ClassList_CallSlot62 over g_ClassList(a5); slot $5A is empty in ACTOR; only caller sub_1F98A8
; ---------------------------------------------------------------------------
ClassList_CallSlot5A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	tst.l	g_ClassList(a5)
	beq.s	loc_1F9846
	movea.l	g_ClassList(a5),a0
	move.w	(a0),d0
	ext.l	d0
	subq.l	#$2,d0
	move.l	d0,d6
	asr.l	#$2,d6
	movea.l	g_ClassList(a5),a0
	lea.l	$2(a0),a4
	moveq	#$0,d7
	bra.s	loc_1F9842
loc_1F982C:
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	(a4),a0
	movea.l	$5A(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.l	d7,d0
	addq.l	#$1,d7
	addq.w	#$4,a4
loc_1F9842:
	cmp.l	d7,d6
	bgt.s	loc_1F982C
loc_1F9846:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
