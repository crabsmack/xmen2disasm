; ---------------------------------------------------------------------------
; sub_119D72	[jt 1505]
; ---------------------------------------------------------------------------
sub_119D72:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2F72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.b	$7(a3),$8B(a4)
	lea.l	$10(a7),a7
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> sub_1F9D38
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	addq.w	#$4,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
