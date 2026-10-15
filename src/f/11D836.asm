; ---------------------------------------------------------------------------
; BabySentinelC_GetSize - return sizeof(BABYSENTINELC object) = $BC bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $BC
; Evidence: method 0 of class descriptor $11B8F6 (name string "BABYSENTINELC", parent BABYBIO)
; ---------------------------------------------------------------------------
BabySentinelC_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
