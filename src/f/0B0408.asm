; ---------------------------------------------------------------------------
; SavageA3_InitCamera - SavageA3: create the camera (CAMERA +$0A with SavageA3_CamSetHooks) into g_Camera
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_InitCamera:
	link.w	a6,#$0
	pea.l	SavageA3_CamSetHooks(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	unlk	a6
	rts
