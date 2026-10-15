; ---------------------------------------------------------------------------
; TeleportReceiver_GetSize - vtable +$06: return sizeof(TELEPORTRECEIVER) = $8C bytes
; In:  none
; Out: d0 = $8C
; Evidence: slot +$6 of the TELEPORTRECEIVER descriptor $085300; never runs in the corpus
; ---------------------------------------------------------------------------
TeleportReceiver_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
