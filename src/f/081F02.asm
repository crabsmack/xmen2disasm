; ---------------------------------------------------------------------------
; CloneA2_CamHookAlt - CAMERA per-frame hook for CloneA2 (alternate mode): camera fields +$40 = $5A, +$42 = $5F
; In:  8(a6) = camera object
; Out: none
; Evidence: set by CloneA2_StartCamAltMode for $300 frames (CloneA2_CamAltTimerTask); same shape as CloneA2_CamHookNormal; TAS frame 47902
; ---------------------------------------------------------------------------
CloneA2_CamHookAlt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	CloneA2_CamHookAlt(pc),a0
	move.l	a0,$1C(a4)
	move.w	#$5A,$40(a4)
	move.w	#$5F,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
