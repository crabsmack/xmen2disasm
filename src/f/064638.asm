; ---------------------------------------------------------------------------
; sub_064638	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064638:
	link.w	a6,#$FFF0
	movem.l	d3-d7/a3-a4,-(a7)
	clr.w	-$E(a6)
	moveq	#$0,d0
	move.l	d0,-$8(a6)
	clr.l	-$4(a6)
	clr.w	d4
loc_064650:
	move.w	d4,d0
	bmi.w	loc_0646D6
	cmpi.w	#$6,d0
	bgt.s	loc_0646D6
	add.w	d0,d0
	move.w	$64666(pc,d0.w),d0
	jmp	$64664(pc,d0.w)
