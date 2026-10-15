; ---------------------------------------------------------------------------
; AvalonB2_CamHook - CAMERA per-frame hook for AvalonB2: set camera fields +$62 = $60 and +$42 = $A0
; In:  8(a6) = camera
; Out: none
; Evidence: passed to CAMERA +$0A New by AvalonB2_RunScene
; ---------------------------------------------------------------------------
AvalonB2_CamHook:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$60,$62(a4)
	move.w	#$A0,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
