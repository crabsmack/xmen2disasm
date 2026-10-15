; ---------------------------------------------------------------------------
; AvalonA3_CamHook - CAMERA per-frame hook for AvalonA3: camera field +$42 = 200
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA +$0A New by AvalonA3_InitCamera
; ---------------------------------------------------------------------------
AvalonA3_CamHook:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	#$C8,$42(a0)
	unlk	a6
	rts
