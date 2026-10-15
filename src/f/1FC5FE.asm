; ---------------------------------------------------------------------------
; Scaler_Start - start a picture-scaling job: allocate the work area once, copy the caller's parameter record, remember source/dest/VRAM, mark it ready
; In:  8(a6) = parameter record ($26 bytes, or &g_ScalerParams)  $C(a6) = source A  $10(a6) = source B  $14(a6) = output buffer  $1A(a6) = word VRAM address
; Out: d0 = &g_ScalerParams, or 0 when no source was given
; Evidence: g_ScalerWork = Mem_StackAlloc($DC0, Str_ScalerData) split into g_ScalerLine0-5; copies 9 longs + a word; only A: g_ScalerHalfWidth = $FF; A and B: Scaler_ExpandSource then A = 0; g_ScalerReady = $FF
; ---------------------------------------------------------------------------
Scaler_Start:
	link.w	a6,#$0
	tst.l	g_ScalerWork(a5)
	bne.s	loc_1FC64A
	pea.l	Str_ScalerData(pc)
	pea.l	($DC0).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	addq.w	#$8,a7
	movea.l	d0,a0
	move.l	a0,g_ScalerWork(a5)
	lea.l	(a0),a1
	move.l	a1,g_ScalerLine0(a5)
	lea.l	$280(a0),a1
	move.l	a1,g_ScalerLine1(a5)
	lea.l	$500(a0),a1
	move.l	a1,g_ScalerLine2(a5)
	lea.l	$780(a0),a1
	move.l	a1,g_ScalerLine3(a5)
	lea.l	$A00(a0),a1
	move.l	a1,g_ScalerLine4(a5)
	lea.l	$C80(a0),a1
	move.l	a1,g_ScalerLine5(a5)
loc_1FC64A:
	move.l	$8(a6),d0
	beq.s	loc_1FC666
	lea.l	g_ScalerParams(a5),a1
	cmpa.l	d0,a1
	beq.s	loc_1FC666
	movea.l	a1,a1
	movea.l	d0,a0
	moveq	#$8,d0
loc_1FC65E:
	move.l	(a0)+,(a1)+
	dbra	d0,loc_1FC65E
	move.w	(a0)+,(a1)+
loc_1FC666:
	move.l	$C(a6),g_ScalerSrcA(a5)
	move.l	$10(a6),g_ScalerSrcB(a5)
	move.l	$14(a6),g_ScalerDest(a5)
	move.w	$1A(a6),g_ScalerVram(a5)
	sf.b	g_ScalerHalfWidth(a5)
	sf.b	g_ScalerReady(a5)
	tst.l	g_ScalerSrcA(a5)
	beq.s	loc_1FC6A2
	tst.l	g_ScalerSrcB(a5)
	bne.s	loc_1FC698
	st.b	g_ScalerHalfWidth(a5)
	bra.s	loc_1FC6A8
loc_1FC698:
	jsr	Scaler_ExpandSource(pc)
	clr.l	g_ScalerSrcA(a5)
	bra.s	loc_1FC6A8
loc_1FC6A2:
	tst.l	g_ScalerSrcB(a5)
	beq.s	loc_1FC6AC
loc_1FC6A8:
	st.b	g_ScalerReady(a5)
loc_1FC6AC:
	suba.l	a0,a0
	tst.b	g_ScalerReady(a5)
	beq.s	loc_1FC6B8
	lea.l	g_ScalerParams(a5),a0
loc_1FC6B8:
	move.l	a0,d0
	unlk	a6
	rts
