; ---------------------------------------------------------------------------
; sub_0C12DE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C12DE:
	link.w	a6,#$0
	lea.l	sub_0C0FD2(pc),a0
	move.l	a0,-$38F4(a5)
	lea.l	sub_0C122A(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
