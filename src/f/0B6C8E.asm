; ---------------------------------------------------------------------------
; BrainChild_StateRise2 - BRAINCHILD leap: until vy >= -$10D, then frame 4
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
BrainChild_StateRise2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$FEF2,$18(a4)
	ble.s	loc_0B6CC4
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BrainChild_StateApex(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B6CD6
loc_0B6CC4:
	clr.w	$6C(a4)
	lea.l	BrainChild_StateRise2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B6CD6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
