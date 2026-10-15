; ---------------------------------------------------------------------------
; sub_064CA2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064CA2:
	link.w	a6,#$0
	tst.b	g_PalFadeActive(a5)
	bne.w	loc_064E98
	subq.w	#$1,-$3B38(a5)
	tst.w	-$3B38(a5)
	bge.w	loc_064DD8
	move.w	#$3,-$3B38(a5)
	move.w	-$3B48(a5),d0
	add.w	d0,-$3B40(a5)
	move.w	-$3B40(a5),d0
	bmi.w	loc_064DD2
	cmpi.w	#$7,d0
	bgt.w	loc_064DD2
	add.w	d0,d0
	move.w	$64CE2(pc,d0.w),d0
	jmp	$64CE0(pc,d0.w)
