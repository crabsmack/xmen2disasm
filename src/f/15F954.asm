; ---------------------------------------------------------------------------
; Spawn_Nop - empty spawn hook, installed when a level has no spawn records
; In:  none
; Out: none
; Evidence: Spawn_InitRecords stores it in $FFF634 when g_SpawnRecCount < 1
; ---------------------------------------------------------------------------
Spawn_Nop:
	link.w	a6,#$0
	unlk	a6
	rts
