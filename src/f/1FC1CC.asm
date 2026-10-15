; ---------------------------------------------------------------------------
; Scaler_ExpandSource - expand a packed 4bpp source (two pixels per byte) into one byte per pixel via Tbl_PixelPairExpand
; In:  none (g_ScalerSrcA -> g_ScalerSrcB, size from g_ScalerParams)
; Out: none
; Evidence: count = ((params+0 + 1) / 2) * params+2; word per source byte from Tbl_PixelPairExpand; called by Scaler_Start when both sources are given
; ---------------------------------------------------------------------------
Scaler_ExpandSource:
	move.l	a2,-(a7)
	move.w	g_ScalerParams(a5),d0
	addq.w	#$1,d0
	lsr.w	#$1,d0
	mulu.w	g_ScalerParams+$2(a5),d0
	subq.w	#$1,d0
	movea.l	g_ScalerSrcA(a5),a0
	movea.l	g_ScalerSrcB(a5),a1
	lea.l	Tbl_PixelPairExpand(pc),a2
loc_1FC1E8:
	moveq	#$0,d1
	move.b	(a0)+,d1
	add.w	d1,d1
	move.w	(a2,d1.w),(a1)+
	dbra	d0,loc_1FC1E8
	movea.l	(a7)+,a2
	rts
