; ---------------------------------------------------------------------------
; sub_157CB2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_157CB2:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$14(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$70(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$71(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
