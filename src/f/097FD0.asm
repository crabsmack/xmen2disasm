; ---------------------------------------------------------------------------
; EvilBeam_GetSize - EVILBEAM slot +$06: return the object size $2A
; In:  none
; Out: d0 = $2A
; Evidence: Tbl_EvilBeam_vtable (root class)
; Found: jt 768
; ---------------------------------------------------------------------------
EvilBeam_GetSize:
	link.w	a6,#$0
	moveq	#$2A,d0
	unlk	a6
	rts
