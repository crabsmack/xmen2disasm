; ---------------------------------------------------------------------------
; SpaceElev_CameraApply - SpaceA1: copy the camera position (+$30/+$32) to the scroll globals, clamped to the level bounds, and run the scroll hooks
; In:  8(a6) = camera
; Out: none
; Evidence: camera x/y $FFCD72/$FFCD70, bounds $FFC76C-$FFC772, hooks $FFC7AC/$FFC7B0 under Irq_Disable
; ---------------------------------------------------------------------------
SpaceElev_CameraApply:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d6
	move.w	$32(a4),d7
	move.w	g_CameraX(a5),d5
	move.w	g_CameraY(a5),d5
	move.w	d6,g_CameraX(a5)
	move.w	d7,g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_10B7D4
	move.w	-$3A8E(a5),g_CameraX(a5)
loc_10B7D4:
	move.w	g_CameraX(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_10B7E4
	move.w	-$3A90(a5),g_CameraX(a5)
loc_10B7E4:
	move.w	g_CameraY(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_10B7F4
	move.w	-$3A92(a5),g_CameraY(a5)
loc_10B7F4:
	move.w	g_CameraY(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_10B804
	move.w	-$3A94(a5),g_CameraY(a5)
loc_10B804:
	move.w	g_CameraX(a5),-$3AC2(a5)
	move.w	g_CameraY(a5),-$3AC4(a5)
	move.w	-$3AC2(a5),-$3AC6(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,-$3A56(a5)
	move.b	-$3A64(a5),-$3A58(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
