; ---------------------------------------------------------------------------
; SyncActor_SpawnRecOutOfView - SyncActor: has the object left the despawn window (class slot 11, +$32)
; In:  8(a6) = this  $C(a6) = spawn record
; Out: d0.b = 1 to despawn
; Evidence: method 11 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_SpawnRecOutOfView:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
