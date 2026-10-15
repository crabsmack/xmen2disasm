; ---------------------------------------------------------------------------
; ApocBomb_Spawn_part3 - part 3 of ApocBomb_Spawn: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of ApocBomb_Spawn
; Out: continues in ApocBomb_Spawn
; Evidence: only reached by branches from ApocBomb_Spawn
; ---------------------------------------------------------------------------
ApocBomb_Spawn_part3:
	ori.w	#$2,$92(a4)
	move.w	#$64,$9E(a4)
	bra.s	ApocBomb_Spawn_part4
loc_04E9DE:
	ori.w	#$2,$92(a4)
	move.w	#$C8,$9E(a4)
