; ---------------------------------------------------------------------------
; sub_11438A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11438A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$10(a6),a4
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	move.l	d7,d0
	asr.l	#$2,d0
	move.w	d0,(a4)
	ext.l	d0
	neg.l	d0
	asr.l	#$3,d0
	movea.l	$14(a6),a0
	move.w	d0,(a0)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
