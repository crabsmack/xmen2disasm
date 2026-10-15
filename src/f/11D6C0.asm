; ---------------------------------------------------------------------------
; BabySentinelA_GetSize - return sizeof(BABYSENTINELA object) = $BC bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $BC
; Evidence: method 0 of class descriptor $11B7D6 (name string "BABYSENTINELA", parent BABYBIO)
; ---------------------------------------------------------------------------
BabySentinelA_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
