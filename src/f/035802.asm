; ---------------------------------------------------------------------------
; AvalonA4_CamHook - CAMERA per-frame hook for AvalonA4: top limits $20, camera +$64 = +$42 = $D8
; In:  8(a6) = camera
; Out: none
; Evidence: -$3A9C = -$3A94 = $20; passed to CAMERA New by AvalonA4_InitCamera
; ---------------------------------------------------------------------------
AvalonA4_CamHook:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$20,d7
	move.w	d7,-$3A9C(a5)
	move.w	d7,g_CamMinY(a5)
	move.w	#$D8,$64(a4)
	move.w	#$D8,$42(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
