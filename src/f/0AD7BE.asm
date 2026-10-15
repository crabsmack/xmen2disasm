; ---------------------------------------------------------------------------
; SavageA2_InitCamera - SavageA2: create the camera (CAMERA +$0A with SavageA2_CamSetHooks) into g_Camera
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_InitCamera:
	link.w	a6,#$0
	pea.l	SavageA2_CamSetHooks(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	unlk	a6
	rts
