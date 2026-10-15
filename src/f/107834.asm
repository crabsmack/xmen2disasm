; ---------------------------------------------------------------------------
; sub_107834	[link-after-rts]
; ---------------------------------------------------------------------------
sub_107834:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	$C(a0),d0
	ext.l	d0
	move.l	g_FrameCounter(a5),d1
	sub.l	d0,d1
	moveq	#$A,d0
	cmp.l	d1,d0
	bcc.s	loc_10785C
	move.l	g_TimerCurrent(a5),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	clr.b	-$3BCA(a5)
	addq.w	#$4,a7
loc_10785C:
	unlk	a6
	rts
