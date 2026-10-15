; ---------------------------------------------------------------------------
; BaniMazaA2_CamHook - CAMERA per-frame hook for BaniMazaA2: camera fields +$3C = $2E, +$3E = $80, +$44 = 7
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA New by BaniMazaA2_InitCamera
; ---------------------------------------------------------------------------
BaniMazaA2_CamHook:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$2E,$3C(a4)
	move.w	#$80,$3E(a4)
	move.w	#$7,$44(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
