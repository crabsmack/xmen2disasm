; ---------------------------------------------------------------------------
; EvilMaker_StateIdle - EVILMAKER state: idle (re-arms itself)
; In:  8(a6) = this
; Out: d0
; Evidence: jt 686
; Found: jt 686
; ---------------------------------------------------------------------------
EvilMaker_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	lea.l	EvilMaker_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
