; ---------------------------------------------------------------------------
; SavageBio_ActExtendTentacle2 - SAVAGE bio script action: extend the tentacle along path $0B8066 (frame $42)
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageBio_StateExtend
; Found: jt 998
; ---------------------------------------------------------------------------
SavageBio_ActExtendTentacle2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$42,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$1E6A(a5),a0
	move.l	$2(a0),$B0(a4)
	tst.w	$AE(a4)
	addq.w	#$8,a7
	bne.s	loc_0BB5C6
	move.w	#$1,$AE(a4)
loc_0BB5C6:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateExtend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
