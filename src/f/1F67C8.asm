; ---------------------------------------------------------------------------
; sub_1F67C8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F67C8:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.w	$A(a6),d7
	clr.w	-$7C4(a5)
	move.w	$E(a6),-$3A04(a5)
	move.w	d7,-$7BC(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,-$7BA(a5)
	move.w	$12(a6),-$7BE(a5)
	move.l	$14(a6),-$7C2(a5)
	move.l	-$7C2(a5),-(a7)
	move.w	-$7BC(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$50E2(a5)	; -> Pal_ApplyFade
	move.b	#$1,-$3A02(a5)
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
