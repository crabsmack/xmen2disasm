; ---------------------------------------------------------------------------
; CloneA2_CamHookNormal - CAMERA per-frame hook for CloneA2 (normal mode): re-install itself and set camera fields +$40 = $80, +$42 = $C0
; In:  8(a6) = camera object
; Out: none
; Evidence: CAMERA calls its +$1C hook after each update (sub_1607E8); +$40/+$42 are the 2nd/4th of the four bounds CAMERA +$1A sets; created with it by CloneA2_InitCamera, restored by CloneA2_CamAltTimer
; ---------------------------------------------------------------------------
CloneA2_CamHookNormal:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	CloneA2_CamHookNormal(pc),a0
	move.l	a0,$1C(a4)
	move.w	#$80,$40(a4)
	move.w	#$C0,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
