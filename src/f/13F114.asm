; ---------------------------------------------------------------------------
; sub_13F114	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13F114:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.w	loc_13F1C2
	move.w	$8C(a4),d0
	bmi.w	loc_13F1AE
	cmpi.w	#$5,d0
	bgt.s	loc_13F1AE
	add.w	d0,d0
	move.w	$13F13E(pc,d0.w),d0
	jmp	$13F13C(pc,d0.w)
