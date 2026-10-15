; ---------------------------------------------------------------------------
; SentinelElevator_StateAuto - SENTINELELEVATOR state: automatic mode - waits $3C at the top and $78 at the bottom, starts up after $C frames
; In:  8(a6) = this
; Out: d0
; Evidence: +$98/+$99 waits; next SentinelElevator_StateGoUp; TAS 5218
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelElevator_StateAuto:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.b	#$3C,$98(a4)
	move.b	#$78,$99(a4)
	addq.w	#$8,a7
	move.w	#$C,$6C(a4)
	lea.l	SentinelElevator_StateGoUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
