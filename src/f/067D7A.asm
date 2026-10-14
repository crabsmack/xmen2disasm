; ---------------------------------------------------------------------------
; sub_067D7A	[jt 481]
; ---------------------------------------------------------------------------
sub_067D7A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$FD2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	sub_067E5E(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	move.w	#$1,$68(a4)
	move.b	#$1,$70(a4)
	moveq	#$0,d0
	move.l	d0,$30(a4)
	moveq	#-$4,d1
	and.b	$2E(a4),d1
	moveq	#$1,d2
	or.b	d1,d2
	move.b	d2,$2E(a4)
	ori.w	#$1080,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$14(a6),$8C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
