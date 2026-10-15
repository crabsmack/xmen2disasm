; ---------------------------------------------------------------------------
; SentinelDoor_StateClosed - SENTINELDOOR state: closed - its floor segment (+$94) solid, frame 0; open when flag bit 1 of +$8C is set
; In:  8(a6) = this
; Out: d0
; Evidence: next SentinelDoor_StateOpen1 (+$92 = 1); TAS 2718-7239
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelDoor_StateClosed:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	movea.l	$94(a3),a0
	andi.b	#$BF,(a0)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$2,d0
	and.w	(a4),d0
	addq.w	#$8,a7
	beq.s	loc_0DE710
	move.w	#$1,$92(a3)
	clr.w	$6C(a3)
	lea.l	SentinelDoor_StateOpen1(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_0DE710:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
