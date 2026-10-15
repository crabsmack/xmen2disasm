; ---------------------------------------------------------------------------
; Actor_GetSize - ACTOR slot +$06: return sizeof(ACTOR object)
; In:  8(a6) = class descriptor
; Out: d0 = $8C
; Evidence: ACTOR ($1F49A6) method +$06; the spawner Synchronizer_New calls it on a descriptor to size the allocation
; ---------------------------------------------------------------------------
Actor_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
