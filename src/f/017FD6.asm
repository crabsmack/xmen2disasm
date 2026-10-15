; ---------------------------------------------------------------------------
; ShootAcolyte_GetSize - vtable +$06: return sizeof(SHOOTACOLYTE) = $B2 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor SHOOTACOLYTE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
ShootAcolyte_GetSize:
	link.w	a6,#$0
	move.l	#$B2,d0
	unlk	a6
	rts
