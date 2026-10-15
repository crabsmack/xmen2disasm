; ---------------------------------------------------------------------------
; XPlayer_StartLookUp - start looking up: stop, mark looking (+$90 $40000) and tell the camera to look up
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: velocities/gravity 0, g_Camera vtable +$26 Cam_LookUp, state XPlayer_StateLookUp; reached from XPlayer_StateStand after Up is held ~50 frames
; ---------------------------------------------------------------------------
XPlayer_StartLookUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.l	#$40000,$90(a4)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	XPlayer_StateLookUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
