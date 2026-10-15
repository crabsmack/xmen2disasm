; ---------------------------------------------------------------------------
; Timer_RunAll - per-frame timer pass: count down running timers, call due callbacks, then reap freed and start pending ones
; In:  none
; Out: none
; Evidence: loop 1 over list -$10EC: state > 0 decremented; state 0 -> state = period, g_TimerCurrent(a5) = timer, call func(arg, timer); loop 2: -1 unlinked and set -3, -4 set to 0; called from the scene frame loop Level_FrameLoop
; ---------------------------------------------------------------------------
Timer_RunAll:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	g_TimerList(a5),a4
	bra.s	loc_1F9D8C
loc_1F9D60:
	tst.w	(a4)
	ble.s	loc_1F9D66
	subq.w	#$1,(a4)
loc_1F9D66:
	tst.w	(a4)
	bne.s	loc_1F9D88
	move.l	$C(a4),-$4(a6)
	movea.l	$10(a4),a3
	move.w	$2(a4),(a4)
	move.l	a4,g_TimerCurrent(a5)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	-$4(a6),a0
	jsr	(a0)
	addq.w	#$8,a7
loc_1F9D88:
	movea.l	$4(a4),a4
loc_1F9D8C:
	move.l	a4,d0
	bne.s	loc_1F9D60
	movea.l	g_TimerList(a5),a4
	bra.s	loc_1F9DDA
loc_1F9D96:
	moveq	#-$1,d0
	cmp.w	(a4),d0
	bne.s	loc_1F9DCE
	tst.l	$8(a4)
	beq.s	loc_1F9DAC
	movea.l	$8(a4),a0
	move.l	$4(a4),$4(a0)
loc_1F9DAC:
	tst.l	$4(a4)
	beq.s	loc_1F9DBC
	movea.l	$4(a4),a0
	move.l	$8(a4),$8(a0)
loc_1F9DBC:
	cmpa.l	g_TimerList(a5),a4
	bne.s	loc_1F9DC8
	move.l	$4(a4),g_TimerList(a5)
loc_1F9DC8:
	move.w	#$FFFD,(a4)
	bra.s	loc_1F9DD6
loc_1F9DCE:
	moveq	#-$4,d0
	cmp.w	(a4),d0
	bne.s	loc_1F9DD6
	clr.w	(a4)
loc_1F9DD6:
	movea.l	$4(a4),a4
loc_1F9DDA:
	move.l	a4,d0
	bne.s	loc_1F9D96
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
