; ---------------------------------------------------------------------------
; Gambit_GetSize - GAMBIT slot +$06: return sizeof(Gambit object) = $C4
; In:  none
; Out: d0 = $C4
; Evidence: vtable GAMBIT $113894; fields +$BC card array pointer, +$C0 card tile base, +$C2 throw kind
; ---------------------------------------------------------------------------
Gambit_GetSize:
	link.w	a6,#$0
	move.l	#$C4,d0
	unlk	a6
	rts
