; ---------------------------------------------------------------------------
; XClone_CamSetArenaMode - camera hook: arena mode - dead zones $A0/$A0/$70/$70 and XClone_CamArenaUpdate
; In:  8(a6) = camera
; Out: none
; Evidence: stored in g_Camera +$1C by XClone_LockArena
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_CamSetArenaMode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A0,$3C(a4)
	move.w	#$A0,$3E(a4)
	move.w	#$70,$40(a4)
	move.w	#$70,$42(a4)
	lea.l	XClone_CamArenaUpdate(pc),a0
	move.l	a0,$8(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
