; ---------------------------------------------------------------------------
; sub_0C0E2A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C0E2A:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_0C0E44
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_0C0E44:
	moveq	#$1F,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0C0E50
	jsr	sub_0C1412(pc)
loc_0C0E50:
	unlk	a6
	rts
