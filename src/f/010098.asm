; ---------------------------------------------------------------------------
; sub_010098	[link-after-rts]
; ---------------------------------------------------------------------------
sub_010098:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.b	#$4,$2E(a4)
	move.w	$1A(a6),$8C(a4)
	move.l	$C(a6),$8E(a4)
	move.w	$12(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$92(a4)
	move.w	$16(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$96(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
