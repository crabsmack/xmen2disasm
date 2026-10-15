; ---------------------------------------------------------------------------
; CloneA5_CamSetHooks - CloneA5 camera creation hook: install CloneA5_CamUpdate (+4) and CloneA5_CamApply (+$C)
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA +$0A by CloneA5_InitCamera
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_CamSetHooks:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	CloneA5_CamUpdate(pc),a0
	move.l	a0,$4(a4)
	lea.l	CloneA5_CamApply(pc),a0
	move.l	a0,$C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
