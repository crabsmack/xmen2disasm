; ---------------------------------------------------------------------------
; SpaceA1_InitCamera - SpaceA1 camera init callback: set its update (+4) and apply (+$C) functions
; In:  8(a6) = camera
; Out: none
; Evidence: passed to the CAMERA New by SpaceA1_InstallHooks
; ---------------------------------------------------------------------------
SpaceA1_InitCamera:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	SpaceA1_CamUpdate(pc),a0
	move.l	a0,$4(a4)
	lea.l	SpaceA1_CamApply(pc),a0
	move.l	a0,$C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
