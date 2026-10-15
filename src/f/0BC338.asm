; ---------------------------------------------------------------------------
; SavageBio_ActStop60 - SAVAGE bio script action: stop, next step after $3C frames
; In:  8(a6) = this
; Out: none
; Evidence: TAS 33793
; Found: jt 1010
; ---------------------------------------------------------------------------
SavageBio_ActStop60:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC362
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0BC390
loc_0BC362:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC376
	clr.w	$96(a4)
loc_0BC376:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0BC390:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
