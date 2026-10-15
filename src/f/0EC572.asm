; ---------------------------------------------------------------------------
; CoreElevator_StateIdle - CoreElevator idle state: clear its segment's byte +2 and stay
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: segment record $FFCE2E + idx*$14 (+$7A index); loops on itself
; ---------------------------------------------------------------------------
CoreElevator_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$7A(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	clr.b	$2(a0,d0.w)
	move.w	#$FF,$6C(a4)
	lea.l	CoreElevator_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
