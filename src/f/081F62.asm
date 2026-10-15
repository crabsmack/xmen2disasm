; ---------------------------------------------------------------------------
; sub_081F62	[link-after-rts]
; ---------------------------------------------------------------------------
sub_081F62:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	tst.w	-$3B04(a5)
	bne.w	loc_081FF4
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081FF4
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081FF4
	move.w	-$3B02(a5),d7
	move.w	-$3490(a5),d0
	asr.w	#$4,d0
	moveq	#$3,d1
	and.w	d0,d1
	move.w	d1,-$3B02(a5)
	cmp.w	-$3B02(a5),d7
	beq.s	loc_081FF4
	move.w	-$3B02(a5),d0
	bmi.s	loc_081FDA
	cmpi.w	#$3,d0
	bgt.s	loc_081FDA
	add.w	d0,d0
	move.w	$81FAC(pc,d0.w),d0
	jmp	$81FAA(pc,d0.w)
