; ---------------------------------------------------------------------------
; AvalonB1_CyclePalettes - advance the two AvalonB1 palette-cycle animations
; In:  none
; Out: none
; Evidence: two calls to Pal_CycleStep (palette cycle: timer, step, sequence, table; writes one g_PalBase colour) with jt $FEC4/$FEDA tables; called each frame from AvalonB1_FrameHook
; ---------------------------------------------------------------------------
AvalonB1_CyclePalettes:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$D2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_AvalonB1PalCycles+$8(a5)
	pea.l	g_AvalonB1PalCycles+$6(a5)
	pea.l	g_AvalonB1PalCycles+$A(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_AvalonB1PalCycles+$2(a5)
	pea.l	g_AvalonB1PalCycles(a5)
	pea.l	g_AvalonB1PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	unlk	a6
	rts
