; ---------------------------------------------------------------------------
; SiberiaB1_InitCamera - SiberiaB1 camera init callback: set the apply function (+$C)
; In:  8(a6) = camera
; Out: none
; Evidence: +$C = SiberiaB1_CamApply
; ---------------------------------------------------------------------------
SiberiaB1_InitCamera:
	link.w	a6,#$0
	lea.l	SiberiaB1_CamApply(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$C(a1)
	unlk	a6
	rts
