; ---------------------------------------------------------------------------
; sub_0C122A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C122A:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_0C1244
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_0C1244:
	moveq	#$1F,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0C1250
	jsr	sub_0C1412(pc)
loc_0C1250:
	jsr	$21FA(a5)	; -> sub_0BF8DC
	unlk	a6
	rts
