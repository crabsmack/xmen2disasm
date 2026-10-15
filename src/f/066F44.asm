; ---------------------------------------------------------------------------
; sub_066F44	[jt 468]
; ---------------------------------------------------------------------------
sub_066F44:
	link.w	a6,#$0
	clr.w	-$3B0C(a5)
	move.w	#$1,-$3B0A(a5)
	moveq	#$0,d0
	move.l	d0,-$3B14(a5)
	tst.w	-$3B92(a5)
	blt.s	loc_066F64
	move.w	-$3B92(a5),g_SceneIndex(a5)
loc_066F64:
	jsr	sub_066B26(pc)
	tst.w	-$3B92(a5)
	blt.s	loc_066F7A
	move.b	#$1,-$38C2(a5)
	move.w	#$FFFF,-$3B92(a5)
loc_066F7A:
	unlk	a6
	rts
