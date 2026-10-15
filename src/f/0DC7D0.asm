; ---------------------------------------------------------------------------
; Barrier_StateStart - BARRIER first state: with no trigger (+$8C = 0) close at once, else watch the players
; In:  8(a6) = this
; Out: d0
; Evidence: next Barrier_StateIdle or Barrier_StateWatch
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barrier_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$8C(a4)
	bne.s	loc_0DC7FC
	move.l	a4,-(a7)
	jsr	Barrier_Close(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Barrier_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DC80E
loc_0DC7FC:
	clr.w	$6C(a4)
	lea.l	Barrier_StateWatch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DC80E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
