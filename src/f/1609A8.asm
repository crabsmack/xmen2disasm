; ---------------------------------------------------------------------------
; Cam_Update - CAMERA slot +$16: run the camera's update function (+4) if set
; In:  8(a6) = this
; Out: d0 = its result or 0
; Evidence: +4 defaults to Cam_DefaultUpdate; scenes replace it with their own camera hooks (AvalonB1_CamHook*)
; ---------------------------------------------------------------------------
Cam_Update:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$4(a3),a4
	move.l	a4,d0
	beq.s	loc_1609C2
	move.l	a3,-(a7)
	jsr	(a4)
	addq.w	#$4,a7
loc_1609C2:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
