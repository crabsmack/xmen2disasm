; ---------------------------------------------------------------------------
; Cam_SetMinXBlocks - set the camera's minimum x (and its saved copy) from a 32-px block column
; In:  $A(a6) = word block column
; Out: none
; Evidence: g_CamMinX = $FFC768 = n << 5
; ---------------------------------------------------------------------------
Cam_SetMinXBlocks:
	link.w	a6,#$0
	move.w	$A(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.w	d0,g_CamMinX(a5)
	move.w	g_CamMinX(a5),g_CamMinXTarget(a5)
	unlk	a6
	rts
