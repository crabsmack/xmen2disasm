; ---------------------------------------------------------------------------
; sub_037924	[link-after-rts]
; ---------------------------------------------------------------------------
sub_037924:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_036B34(pc)
	move.b	d0,$9C(a4)
	move.b	d0,d7
	lea.l	sub_0378A8(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_0378A8(pc)
	lea.l	$C(a7),a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
