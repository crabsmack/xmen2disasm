; ---------------------------------------------------------------------------
; sub_067202	[jt 475]
; ---------------------------------------------------------------------------
sub_067202:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$FCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	movea.l	$8C(a4),a0
	move.w	$A(a0),$34(a4)
	move.w	$8(a0),$36(a4)
	ori.b	#$80,$2E(a4)
	move.b	#$FF,$2F(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
