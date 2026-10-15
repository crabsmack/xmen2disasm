; ---------------------------------------------------------------------------
; Launcher_GetSize - vtable +$06: return sizeof(LAUNCHER) = $B8 bytes
; In:  none
; Out: d0 = $B8
; Evidence: slot +$6 of the LAUNCHER descriptor $0BED0C; never runs in the corpus
; ---------------------------------------------------------------------------
Launcher_GetSize:
	link.w	a6,#$0
	move.l	#$B8,d0
	unlk	a6
	rts
