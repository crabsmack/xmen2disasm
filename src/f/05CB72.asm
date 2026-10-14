; ---------------------------------------------------------------------------
; sub_05CB72	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CB72:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$1000,d1
	move.l	d1,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$D8A(a5)	; -> sub_05D0BC
	movea.l	d0,a3
	move.w	#$3C,$6E(a4)
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
