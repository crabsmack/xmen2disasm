; ---------------------------------------------------------------------------
; sub_1F67C8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F67C8:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.w	$A(a6),d7
	clr.w	g_PalFadeTimer(a5)
	move.w	$E(a6),g_PalFadeDelay(a5)
	move.w	d7,g_PalFadeLevel(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,g_PalFadeUp(a5)
	move.w	$12(a6),g_PalFadeLine(a5)
	move.l	$14(a6),g_PalFadeTable(a5)
	move.l	g_PalFadeTable(a5),-(a7)
	move.w	g_PalFadeLevel(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$50E2(a5)	; -> Pal_ApplyFade
	move.b	#$1,g_PalFadeActive(a5)
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
