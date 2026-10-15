; ---------------------------------------------------------------------------
; CloneA2_SetCameraLimitsToMap - open the camera limits to the whole map (map size from the header at -$CAE)
; In:  none
; Out: none
; Evidence: max x = (hdr+2)*8 - $140, max y = (hdr+4)*8 - $E0, mins 0 (same globals as CloneA2_SetCameraZone); jt 556; caller Teleporter_StateTeleport (teleporter code), TAS frame 48336
; ---------------------------------------------------------------------------
CloneA2_SetCameraLimitsToMap:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	clr.w	d4
	clr.w	d5
	movea.l	g_LevelFgMap(a5),a0
	moveq	#$0,d0
	move.w	$2(a0),d0
	lsl.l	#$3,d0
	move.l	d0,d6
	sub.l	#$140,d6
	movea.l	g_LevelFgMap(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	move.l	d0,d7
	sub.l	#$E0,d7
	move.w	d4,g_CamMinXTarget(a5)
	move.w	d4,g_CamMinX(a5)
	move.w	d5,g_CamMinYTarget(a5)
	move.w	d5,g_CamMinY(a5)
	move.w	d6,g_CamMaxXTarget(a5)
	move.w	d6,g_CamMaxX(a5)
	move.w	d7,g_CamMaxYTarget(a5)
	move.w	d7,g_CamMaxY(a5)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
