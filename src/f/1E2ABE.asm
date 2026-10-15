; ---------------------------------------------------------------------------
; Cyclops_SetAirFrame	[jt 2386]
; ---------------------------------------------------------------------------
Cyclops_SetAirFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	cmpi.w	#$FE02,d7
	bge.s	loc_1E2AE6
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1E2B3E
loc_1E2AE6:
	cmpi.w	#$154,d7
	bge.s	loc_1E2AFE
	moveq	#$10,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1E2B3E
loc_1E2AFE:
	cmpi.w	#$200,d7
	bge.s	loc_1E2B16
	moveq	#$11,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1E2B3E
loc_1E2B16:
	cmpi.w	#$300,d7
	bge.s	loc_1E2B2E
	moveq	#$12,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1E2B3E
loc_1E2B2E:
	moveq	#$13,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1E2B3E:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
