; ---------------------------------------------------------------------------
; XClone_SpawnByType_Done - tail of XClone_SpawnByType: return the new object
; Evidence: common exit of the switch
; ---------------------------------------------------------------------------
XClone_SpawnByType_Done:
	move.l	a3,d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
