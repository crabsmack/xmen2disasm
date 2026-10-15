; ---------------------------------------------------------------------------
; Timer_InitAll - mark all 30 timer slots free and empty the active-timer list
; In:  none
; Out: none
; Evidence: 30 slots of $16 bytes at g_Timers(a5): state word = -3 (free); list head long g_TimerList(a5) = 0
; ---------------------------------------------------------------------------
Timer_InitAll:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	g_Timers(a5),a3
	movea.l	a3,a4
	clr.w	d7
	moveq	#$1E,d3
loc_1F9C72:
	move.w	#$FFFD,(a4)
	lea.l	$16(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F9C72
	moveq	#$0,d0
	move.l	d0,g_TimerList(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
