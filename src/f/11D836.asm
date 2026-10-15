; ---------------------------------------------------------------------------
; BabySentinelC_SizeOf - BabySentinelC: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $11B8F6 (name string "BABYSENTINELC", parent BABYBIO)
; ---------------------------------------------------------------------------
BabySentinelC_SizeOf:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
