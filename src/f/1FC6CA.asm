; ---------------------------------------------------------------------------
; Scaler_Step - run the scaler for one frame's budget: begin a new pass or resume a yielded one
; In:  none
; Out: g_ScalerReady updated (0 = done)
; Evidence: g_ScalerReady < 0 -> Scaler_BeginPass; > 0 -> Scaler_Resume; callers BigAcolyte_RenderScaled, Cerebro_BigSpriteDecode
; ---------------------------------------------------------------------------
Scaler_Step:
	tst.b	g_ScalerReady(a5)
	bmi.s	loc_1FC6E4
	beq.s	loc_1FC6E2
	movem.l	d3-d7/a1-a4,-(a7)
	jsr	Scaler_Resume(pc)
	move.b	d0,g_ScalerReady(a5)
	movem.l	(a7)+,d3-d7/a1-a4
loc_1FC6E2:
	rts
loc_1FC6E4:
	movem.l	d3-d7/a1-a4,-(a7)
	jsr	Scaler_BeginPass(pc)
	move.b	d0,g_ScalerReady(a5)
	movem.l	(a7)+,d3-d7/a1-a4
	rts
