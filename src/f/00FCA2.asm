; ---------------------------------------------------------------------------
; AvalonB1_CyclePalettes - advance the two AvalonB1 palette-cycle animations
; In:  none
; Out: none
; Evidence: two calls to sub_159FD6 (palette cycle: timer, step, sequence, table; writes one g_PalBase colour) with jt $FEC4/$FEDA tables; called each frame from AvalonB1_FrameHook
; ---------------------------------------------------------------------------
AvalonB1_CyclePalettes:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$D2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3CDE(a5)
	pea.l	-$3CE0(a5)
	pea.l	-$3CDC(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3CE4(a5)
	pea.l	-$3CE6(a5)
	pea.l	-$3CE2(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	unlk	a6
	rts
