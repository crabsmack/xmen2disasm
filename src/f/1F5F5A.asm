; ---------------------------------------------------------------------------
; Cam_SetMaxXBlocks - set the camera's maximum x (and its saved copy) so the screen's right edge stops at a 32-px block column
; In:  $A(a6) = word block column
; Out: none
; Evidence: g_CamMaxX = $FFC76A = n*32 - 320
; ---------------------------------------------------------------------------
Cam_SetMaxXBlocks:
	link.w	a6,#$0
	move.w	$A(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	sub.w	#$140,d0
	move.w	d0,g_CamMaxX(a5)
	move.w	g_CamMaxX(a5),g_CamMaxXTarget(a5)
	unlk	a6
	rts
