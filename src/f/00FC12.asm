; ---------------------------------------------------------------------------
; AvalonB1_ScrollCameraTo - set the camera position clamped to the level limits and redraw the scroll
; In:  8(a6) = word x, $C(a6) = word y
; Out: none
; Evidence: clamps to g_CamMinX..g_CamMaxX (x) and g_CamMinY..g_CamMaxY (y), stores g_CameraX/g_CameraY, calls the scroll hooks at g_MapColHook/g_MapRowHook with interrupts off; callers are the five AvalonB1_CamHook* functions
; ---------------------------------------------------------------------------
AvalonB1_ScrollCameraTo:
	link.w	a6,#$0
	move.w	$A(a6),g_CameraX(a5)
	move.w	$E(a6),g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxX(a5),d0
	ble.s	loc_00FC32
	move.w	g_CamMaxX(a5),g_CameraX(a5)
loc_00FC32:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinX(a5),d0
	bge.s	loc_00FC42
	move.w	g_CamMinX(a5),g_CameraX(a5)
loc_00FC42:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxY(a5),d0
	ble.s	loc_00FC52
	move.w	g_CamMaxY(a5),g_CameraY(a5)
loc_00FC52:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinY(a5),d0
	bge.s	loc_00FC62
	move.w	g_CamMinY(a5),g_CameraY(a5)
loc_00FC62:
	move.w	g_CameraX(a5),g_FgScrollX(a5)
	move.w	g_CameraY(a5),g_FgScrollY(a5)
	tst.b	g_ScrollResync(a5)
	beq.s	loc_00FC7A
	addi.w	#$100,g_FgStreamY(a5)
loc_00FC7A:
	clr.b	g_ScrollResync(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapColHook(a5),a0
	jsr	(a0)
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,g_FgScrollDirty(a5)
	move.b	g_BgMapPresent(a5),g_BgScrollDirty(a5)
	unlk	a6
	rts
