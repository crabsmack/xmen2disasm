; ---------------------------------------------------------------------------
; sub_1179D4	[jt 1441]
; ---------------------------------------------------------------------------
sub_1179D4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2DA2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$2C9A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$44(a4)
	move.b	$7(a0),$2F(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
