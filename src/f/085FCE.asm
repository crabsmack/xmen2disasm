; ---------------------------------------------------------------------------
; BroodBossWall_GetSize - BROODBOSSWALL slot +$06: return the object size $48
; In:  none
; Out: d0 = $48
; Evidence: Tbl_BroodBossWall_vtable (parent ICANDY)
; Found: jt 616
; ---------------------------------------------------------------------------
BroodBossWall_GetSize:
	link.w	a6,#$0
	moveq	#$48,d0
	unlk	a6
	rts
