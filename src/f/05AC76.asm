; ---------------------------------------------------------------------------
; BaniMazaB2_CamHook - CAMERA per-frame hook for BaniMazaB2: camera field +$42 = $D2
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA New by BaniMazaB2_InitCamera
; ---------------------------------------------------------------------------
BaniMazaB2_CamHook:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	#$D2,$42(a0)
	unlk	a6
	rts
