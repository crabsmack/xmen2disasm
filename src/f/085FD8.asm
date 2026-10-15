; ---------------------------------------------------------------------------
; sub_085FD8	[jt 617]
; ---------------------------------------------------------------------------
sub_085FD8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$14F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$2E32(a5)	; -> sub_118826
	lea.l	$144A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$2E3A(a5)	; -> ICandy_SetAnim
	move.b	#$6,$42(a4)
	clr.b	$43(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
