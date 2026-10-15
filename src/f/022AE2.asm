; ---------------------------------------------------------------------------
; AvalonA2_RaiseCameraFloor - move the camera's bottom limit up by $C0 pixels
; In:  none
; Out: none
; Evidence: -$3A92 -= $C0, -$3A9A = -$3A92; called by AvalonA2_RunScene ('Falling_Room')
; ---------------------------------------------------------------------------
AvalonA2_RaiseCameraFloor:
	link.w	a6,#$0
	subi.w	#$C0,g_CamMaxY(a5)
	move.w	g_CamMaxY(a5),-$3A9A(a5)
	unlk	a6
	rts
