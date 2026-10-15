; ---------------------------------------------------------------------------
; Cam_Nop12 - CAMERA slot +$12: empty
; In:  none
; Out: none
; Evidence: bare link/unlk/rts
; ---------------------------------------------------------------------------
Cam_Nop12:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
