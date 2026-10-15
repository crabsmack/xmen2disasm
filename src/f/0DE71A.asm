; ---------------------------------------------------------------------------
; SentinelDoor_StateOpen - SENTINELDOOR state: open - segment disabled (bit 6), frame 6; close when the flag bit clears
; In:  8(a6) = this
; Out: d0
; Evidence: next SentinelDoor_StateClose1 (+$92 = 2); TAS 2869-7282
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelDoor_StateOpen:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	movea.l	$94(a3),a0
	ori.b	#$40,(a0)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$2,d0
	and.w	(a4),d0
	addq.w	#$8,a7
	bne.s	loc_0DE760
	move.w	#$2,$92(a3)
	clr.w	$6C(a3)
	lea.l	SentinelDoor_StateClose1(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_0DE760:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
