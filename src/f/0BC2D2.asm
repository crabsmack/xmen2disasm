; ---------------------------------------------------------------------------
; SavageBio_ActFrame40 - SAVAGE bio script action: frame $40, next step
; In:  8(a6) = this
; Out: none
; Found: jt 1009
; ---------------------------------------------------------------------------
SavageBio_ActFrame40:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$40,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_0BC304
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC330
loc_0BC304:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC318
	clr.w	$96(a4)
loc_0BC318:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BC330:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
