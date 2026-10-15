; ---------------------------------------------------------------------------
; BaniMazaA1_CamHook - CAMERA per-frame hook for BaniMazaA1: camera field +$42 = $A0
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA New by BaniMazaA1_InitCamera
; ---------------------------------------------------------------------------
BaniMazaA1_CamHook:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	#$A0,$42(a0)
	unlk	a6
	rts
