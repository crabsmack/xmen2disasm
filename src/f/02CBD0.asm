; ---------------------------------------------------------------------------
; AvalonA3_InitCamera - create the AvalonA3 camera with AvalonA3_CamHook
; In:  none
; Out: none
; Evidence: g_Camera = CAMERA +$0A New(Tbl_Camera_vtable (jt $4DBA), AvalonA3_CamHook)
; ---------------------------------------------------------------------------
AvalonA3_InitCamera:
	link.w	a6,#$0
	pea.l	AvalonA3_CamHook(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	unlk	a6
	rts
