; ---------------------------------------------------------------------------
; Scaler_InitParams - reset the scaler parameter block to defaults and start a job on g_ScaleTileBuf
; In:  none
; Out: g_ScaleParamsPtr = &g_ScalerParams or 0
; Evidence: zeroes g_ScalerParams words +0..+$12, +$14/+$15 = 1, +$19 = 1, g_ScalerTableKey = $FF, then Scaler_Start(&g_ScalerParams, 0, 10, g_ScaleTileBuf, 10)
; ---------------------------------------------------------------------------
Scaler_InitParams:
	moveq	#$0,d0
	move.w	d0,g_ScalerParams(a5)
	move.w	d0,g_ScalerParams+$2(a5)
	move.w	d0,g_ScalerParams+$4(a5)
	move.w	d0,g_ScalerParams+$6(a5)
	move.w	d0,g_ScalerParams+$8(a5)
	move.w	d0,g_ScalerParams+$A(a5)
	move.w	d0,g_ScalerParams+$C(a5)
	move.w	d0,g_ScalerParams+$E(a5)
	move.w	d0,g_ScalerParams+$10(a5)
	move.w	d0,g_ScalerParams+$12(a5)
	move.b	#$1,g_ScalerParams+$14(a5)
	move.b	#$1,g_ScalerParams+$15(a5)
	move.b	d0,g_ScalerParams+$16(a5)
	move.b	d0,g_ScalerParams+$17(a5)
	move.b	d0,g_ScalerParams+$18(a5)
	move.b	#$1,g_ScalerParams+$19(a5)
	move.b	d0,g_ScalerParams+$1A(a5)
	move.w	d0,g_ScalerParams+$1C(a5)
	st.b	g_ScalerTableKey(a5)
	pea.l	($A).w
	move.l	g_ScaleTileBuf(a5),-(a7)
	pea.l	($A).w
	clr.l	-(a7)
	pea.l	g_ScalerParams(a5)
	jsr	Scaler_Start(pc)
	lea.l	$14(a7),a7
	move.l	d0,g_ScaleParamsPtr(a5)
	rts
