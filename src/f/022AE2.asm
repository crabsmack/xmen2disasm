; ---------------------------------------------------------------------------
; AvalonA2_RaiseCameraFloor - move the camera's bottom limit up by $C0 pixels
; In:  none
; Out: none
; Evidence: g_CamMaxY -= $C0, g_CamMaxYTarget = g_CamMaxY; called by AvalonA2_RunScene ('Falling_Room')
; ---------------------------------------------------------------------------
AvalonA2_RaiseCameraFloor:
	link.w	a6,#$0
	subi.w	#$C0,g_CamMaxY(a5)
	move.w	g_CamMaxY(a5),g_CamMaxYTarget(a5)
	unlk	a6
	rts
