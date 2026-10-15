; ---------------------------------------------------------------------------
; Cam_GetSize - CAMERA slot +$06: return sizeof(CAMERA object) = $6C
; In:  none
; Out: d0 = $6C
; Evidence: CAMERA descriptor $1F4960 slot +$06; Cam_New allocates this many bytes
; ---------------------------------------------------------------------------
Cam_GetSize:
	link.w	a6,#$0
	moveq	#$6C,d0
	unlk	a6
	rts
