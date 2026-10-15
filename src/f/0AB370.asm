; ---------------------------------------------------------------------------
; sub_0AB370	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB370:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	-$3C1C(a5),d0
	subq.w	#$1,d0
	bmi.w	loc_0AB416
	cmpi.w	#$5,d0
	bgt.w	loc_0AB416
	add.w	d0,d0
	move.w	Sw_0AB370(pc,d0.w),d0
	jmp	Sw_0AB370-2(pc,d0.w)
