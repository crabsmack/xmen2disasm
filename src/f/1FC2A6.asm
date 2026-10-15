; ---------------------------------------------------------------------------
; Scaler_ClearRows - zero the remaining output rows of the current pass
; In:  d7 = rows, a1 = output pointer
; Out: none
; Evidence: writes zero longs down each column using g_ScalerLine2/3 steps and g_ScalerRowStep; called from Scaler_RowEnd
; ---------------------------------------------------------------------------
Scaler_ClearRows:
	tst.w	g_ScalerRowCount(a5)
	bgt.s	loc_1FC2B2
	movea.l	g_ScalerLine3(a5),a3
	bra.s	loc_1FC2B6
loc_1FC2B2:
	movea.l	g_ScalerLine2(a5),a3
loc_1FC2B6:
	sub.w	d7,g_ScalerRowCount(a5)
	subq.w	#$1,d7
	bmi.s	loc_1FC2E6
	movea.l	g_ScalerRowStep(a5),a4
loc_1FC2C2:
	move.w	$6(a3),d1
	addq.w	#$3,d1
	move.l	a1,d6
	move.w	g_ScalerParams+$C(a5),d5
	subq.w	#$1,d5
	moveq	#$0,d0
loc_1FC2D2:
	move.l	d0,(a1)
	adda.w	d1,a1
	dbra	d5,loc_1FC2D2
	movea.l	d6,a1
	adda.w	(a4)+,a1
	dbra	d7,loc_1FC2C2
	move.l	a4,g_ScalerRowStep(a5)
loc_1FC2E6:
	rts
