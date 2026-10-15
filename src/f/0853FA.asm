; ---------------------------------------------------------------------------
; Teleporter_NoPause - empty function: the Start-press (pause) hook while a teleport runs, so pausing does nothing
; In:  8(a6) = 0
; Out: none
; Evidence: Teleporter_StateTeleport stores it in g_PauseHandler; Teleporter_StateWaitFade restores Pause_Check
; Found: empty function; Teleporter state at $085696 stores its address in the Start-press hook -$38FC while teleporting
; ---------------------------------------------------------------------------
Teleporter_NoPause:
	link.w	a6,#$0
	unlk	a6
	rts
