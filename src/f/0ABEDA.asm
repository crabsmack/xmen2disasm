; ---------------------------------------------------------------------------
; sub_0ABEDA	[jt 872]
; ---------------------------------------------------------------------------
sub_0ABEDA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1B12(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	move.w	#$1,$68(a4)
	lea.l	sub_0ABB1A(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
