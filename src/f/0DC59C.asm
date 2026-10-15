; ---------------------------------------------------------------------------
; ClosedBarrier_Update - vtable +$4A: per-frame update of a CLOSEDBARRIER
; In:  8(a6) = this
; Evidence: slot +$4A of the CLOSEDBARRIER descriptor $0DCA2E; never runs in the corpus
; ---------------------------------------------------------------------------
ClosedBarrier_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_0DC5B2
	moveq	#$2,d0
	bra.s	loc_0DC5B4
loc_0DC5B2:
	moveq	#$1,d0
loc_0DC5B4:
	move.w	d0,d7
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0DC5E0
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_0DC5F4
loc_0DC5E0:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> sub_15F8B6
	lea.l	$10(a7),a7
loc_0DC5F4:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
