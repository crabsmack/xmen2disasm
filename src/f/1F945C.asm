; ---------------------------------------------------------------------------
; Sys_Nop1F945C - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2542; called by CloneA5_CamApply, BroodClaw_CamApplyShake, Cam_ShakeStep
; ---------------------------------------------------------------------------
Sys_Nop1F945C:
	link.w	a6,#$0
	unlk	a6
	rts
