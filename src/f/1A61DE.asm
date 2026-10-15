; ---------------------------------------------------------------------------
; Nightcrawler_GetSize - NIGHTCRAWLER slot +$06: return sizeof(Nightcrawler object) = $C6
; In:  none
; Out: d0 = $C6
; Evidence: NIGHTCRAWLER descriptor $113496; XCLIMBER $C2 + teleport direction +$C2 and timer +$C4
; ---------------------------------------------------------------------------
Nightcrawler_GetSize:
	link.w	a6,#$0
	move.l	#$C6,d0
	unlk	a6
	rts
