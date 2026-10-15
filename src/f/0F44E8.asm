; ---------------------------------------------------------------------------
; sub_0F44E8	[jt 1315]
; ---------------------------------------------------------------------------
sub_0F44E8:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_0F451E
	tst.w	g_SceneExitTimer(a5)
	bne.s	loc_0F451A
	moveq	#$0,d0
	move.b	-$3B78(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0F4514
	tst.w	-$3B02(a5)
	beq.s	loc_0F451A
	move.w	#$5,g_SceneExitTimer(a5)
	bra.s	loc_0F451A
loc_0F4514:
	move.w	#$1E,g_SceneExitTimer(a5)
loc_0F451A:
	moveq	#$1,d0
	bra.s	loc_0F4520
loc_0F451E:
	moveq	#$0,d0
loc_0F4520:
	unlk	a6
	rts
