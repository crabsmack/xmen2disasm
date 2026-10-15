; ---------------------------------------------------------------------------
; sub_0AB526	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB526:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$90(a4),d0
	bmi.w	loc_0AB750
	cmpi.w	#$7,d0
	bgt.w	loc_0AB750
	add.w	d0,d0
	move.w	Sw_0AB526(pc,d0.w),d0
	jmp	Sw_0AB526-2(pc,d0.w)
