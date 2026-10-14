; ---------------------------------------------------------------------------
; sub_087600	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087600:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	beq.s	loc_087620
	movea.l	$A2(a4),a0
	move.b	#$1,$43(a0)
	moveq	#$0,d0
	move.l	d0,$A2(a4)
loc_087620:
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	sub_0874DC(pc)
	ori.w	#$40,-$3B0C(a5)
	addi.w	#$A,$8E(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_08765E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
