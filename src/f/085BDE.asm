; ---------------------------------------------------------------------------
; LittleLeg_GetSize - LITTLELEG slot +$06: return the object size $68
; In:  none
; Out: d0 = $68
; Evidence: slot +$06 of Tbl_LittleLeg_vtable (root class, no parent); LittleLeg_New allocates $68 bytes
; Found: jt 611
; ---------------------------------------------------------------------------
LittleLeg_GetSize:
	link.w	a6,#$0
	moveq	#$68,d0
	unlk	a6
	rts
