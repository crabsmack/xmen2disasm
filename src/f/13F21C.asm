; ---------------------------------------------------------------------------
; sub_13F21C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13F21C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.b	$70(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	lea.l	$3D7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_13EEFA(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
