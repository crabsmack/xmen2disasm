; ---------------------------------------------------------------------------
; SentinelDoor_StateOpen5 - SENTINELDOOR opening: frame 5, then open
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelDoor_StateOpen5:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$92(a4)
	addq.w	#$8,a7
	move.w	#$1,$6C(a4)
	lea.l	SentinelDoor_StateOpen(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
