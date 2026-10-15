; ---------------------------------------------------------------------------
; Cam_CommitLook - fold the camera's look offset into its position (so it does not spring back)
; In:  8(a6) = camera
; Out: none
; Evidence: +$32 += +$5C, +$5C = 0; called by XPlayer_DropThrough
; ---------------------------------------------------------------------------
Cam_CommitLook:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$5C(a4),d0
	add.w	d0,$32(a4)
	clr.w	$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
