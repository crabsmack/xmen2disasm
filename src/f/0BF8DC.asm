; ---------------------------------------------------------------------------
; sub_0BF8DC	[jt 1083]
; ---------------------------------------------------------------------------
sub_0BF8DC:
	link.w	a6,#$0
	move.l	d3,-(a7)
	tst.w	-$3C1E(a5)
	bne.w	loc_0BF9DE
	addq.w	#$1,-$3C1C(a5)
	move.w	-$3C1C(a5),d0
	subq.w	#$1,d0
	bmi.w	loc_0BF9C8
	cmpi.w	#$4,d0
	bgt.w	loc_0BF9C8
	add.w	d0,d0
	move.w	$BF90A(pc,d0.w),d0
	jmp	$BF908(pc,d0.w)
