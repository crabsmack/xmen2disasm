; ---------------------------------------------------------------------------
; sub_04EC7C	[jt 380]
; ---------------------------------------------------------------------------
sub_04EC7C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$C0A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$9C2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	ori.w	#$1283,$6(a4)
	ori.b	#$4,$2E(a4)
	move.b	#$2,$42(a4)
	lea.l	sub_04EAFC(pc),a0
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
