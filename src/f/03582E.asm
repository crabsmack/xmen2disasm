; ---------------------------------------------------------------------------
; AvalonA4_InitCamera - create the AvalonA4 camera with AvalonA4_CamHook unless one exists
; In:  none
; Out: none
; Evidence: g_Camera == 0 -> CAMERA +$0A New(Tbl_Camera_vtable (jt $4DBA), AvalonA4_CamHook)
; ---------------------------------------------------------------------------
AvalonA4_InitCamera:
	link.w	a6,#$0
	tst.l	g_Camera(a5)
	bne.s	loc_035858
	pea.l	AvalonA4_CamHook(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	addq.w	#$8,a7
loc_035858:
	unlk	a6
	rts
