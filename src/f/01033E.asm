; ---------------------------------------------------------------------------
; sub_01033E	[jt 31]
; ---------------------------------------------------------------------------
sub_01033E:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$30(a4),a3
	lea.l	$2E(a4),a0
	move.l	a0,-$4(a6)
	moveq	#$0,d0
	move.l	d0,$30(a4)
	move.l	a4,-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	a3,$30(a4)
	move.b	#$FF,$2F(a4)
	move.b	#$FF,$38(a4)
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
