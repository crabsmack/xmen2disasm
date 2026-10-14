; ---------------------------------------------------------------------------
; sub_1F7BB6	[jt 2525]
; ---------------------------------------------------------------------------
sub_1F7BB6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F7A9E(pc)
	move.w	$22(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F8494(pc)
	move.l	a4,-(a7)
	jsr	sub_1F7AF8(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
