; ---------------------------------------------------------------------------
; sub_1F9464	[jt 2543]
; ---------------------------------------------------------------------------
sub_1F9464:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	g_SceneTable(a5),a4
	move.b	g_SceneCount(a5),d0
	addq.b	#$1,g_SceneCount(a5)
	move.b	d0,d7
	moveq	#$0,d0
	move.b	d7,d0
	asl.w	#$3,d0
	move.l	$8(a6),(a4,d0.w)
	moveq	#$0,d0
	move.b	d7,d0
	asl.w	#$3,d0
	move.l	$C(a6),$4(a4,d0.w)
	move.b	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
