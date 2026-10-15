; ---------------------------------------------------------------------------
; AvalonB1_InitCamera - create the AvalonB1 camera with the intro hook chain, start at y = $430 with black palettes
; In:  none
; Out: none
; Evidence: saves line 0 colours, g_Camera = CAMERA(+$0A New) (jt $4FBA), g_Camera+4 = AvalonB1_CamHookWait2, g_CameraY = $430, clears g_PalBase lines 0 and 2
; ---------------------------------------------------------------------------
AvalonB1_InitCamera:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	clr.w	d7
	moveq	#$10,d3
loc_00FB60:
	move.w	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	ext.l	d7
	movea.l	-$3B14(a5),a1
	move.l	d7,d1
	add.l	d1,d1
	move.w	(a0,d0.w),(a1,d1.l)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_00FB60
	clr.w	-$3B3A(a5)
	clr.w	-$3B32(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	lea.l	AvalonB1_CamHookWait2(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$4(a1)
	move.w	#$430,g_CameraY(a5)
	move.w	g_CameraY(a5),g_FgScrollY(a5)
	move.w	#$E0,g_BgScrollY(a5)
	lea.l	g_PalBase(a5),a4
	clr.w	d7
	moveq	#$10,d3
	addq.w	#$8,a7
loc_00FBCE:
	clr.w	(a4)+
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_00FBCE
	lea.l	g_PalBase+$40(a5),a4
	clr.w	d7
	moveq	#$10,d3
loc_00FBE0:
	clr.w	(a4)+
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_00FBE0
	move.b	#$1,g_PalBaseDirty(a5)
	addi.w	#$100,g_FgStreamY(a5)
	clr.b	g_MapStreamNarrow(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
