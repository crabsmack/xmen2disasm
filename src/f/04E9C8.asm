; ---------------------------------------------------------------------------
; ApocBomb_Spawn_part2 - part 2 of ApocBomb_Spawn: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of ApocBomb_Spawn
; Out: continues in ApocBomb_Spawn
; Evidence: only reached by branches from ApocBomb_Spawn
; ---------------------------------------------------------------------------
ApocBomb_Spawn_part2:
	move.w	#$FF9C,$9E(a4)
	bra.s	ApocBomb_Spawn_part4
