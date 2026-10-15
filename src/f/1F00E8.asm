; ---------------------------------------------------------------------------
; XPlayer_GetSize - XPLAYER slot +$06: return sizeof(player object) = $BC
; In:  none
; Out: d0 = $BC
; Evidence: XPLAYER descriptor $1131A0 slot +$06
; ---------------------------------------------------------------------------
XPlayer_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
