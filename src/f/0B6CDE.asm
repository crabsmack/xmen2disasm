; ---------------------------------------------------------------------------
; BrainChild_StateApex - BRAINCHILD leap: until vy >= $10F, then frame 3
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
BrainChild_StateApex:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$10E,$18(a4)
	ble.s	loc_0B6D14
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BrainChild_StateFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B6D26
loc_0B6D14:
	clr.w	$6C(a4)
	lea.l	BrainChild_StateApex(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B6D26:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
