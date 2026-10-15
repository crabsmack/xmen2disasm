; ---------------------------------------------------------------------------
; Magneto_GetSize - MAGNETO slot +$06: return sizeof(Magneto object) = $C2
; In:  none
; Out: d0 = $C2
; Evidence: MAGNETO descriptor $11379A; XPLAYER $BC + aim direction word +$BC and held flux bomb pointer +$BE
; ---------------------------------------------------------------------------
Magneto_GetSize:
	link.w	a6,#$0
	move.l	#$C2,d0
	unlk	a6
	rts
