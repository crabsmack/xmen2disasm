; ---------------------------------------------------------------------------
; SyncActor_SpawnRecOutOfView - always returns 0: a synchronized actor never despawns on its own (class slot 11, +$32)
; In:  8(a6) = this  $C(a6) = spawn record
; Out: d0.b = 0
; Evidence: body = moveq #0,d0; method 11 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_SpawnRecOutOfView:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
