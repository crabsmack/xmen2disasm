; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes - per-frame Cerebro palette animation (two stepping colour sequences)
; In:  none
; Out: none
; Evidence: counters -$3B38/-$3B40/-$3B48 and -$3B32/-$3B3A; 8-way switches Sw_064CA2 and Sw_064DD2 write colours into g_PalBase; paused while g_PalFadeActive (-$3A02) is set
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes:
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
	bmi.w	Cerebro_AnimatePalettes_StepB
	cmpi.w	#$7,d0
	bgt.w	Cerebro_AnimatePalettes_StepB
	add.w	d0,d0
	move.w	Sw_064CA2(pc,d0.w),d0
	jmp	Sw_064CA2-2(pc,d0.w)
