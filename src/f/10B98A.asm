; ---------------------------------------------------------------------------
; SpaceElev_FrameHook - SpaceA1 per-frame hook: count the frame and run Elevator_Update (twice at half rate)
; In:  none
; Out: none
; Evidence: installed in $FFC972 (called by the level loop sub_1FA124); frame counter word $FFCC5E; TAS 37298-45094
; ---------------------------------------------------------------------------
SpaceElev_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	movea.l	g_Elevator(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	tst.b	-$38DE(a5)
	addq.w	#$4,a7
	beq.s	loc_10B9C4
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	movea.l	g_Elevator(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_10B9C4:
	unlk	a6
	rts
