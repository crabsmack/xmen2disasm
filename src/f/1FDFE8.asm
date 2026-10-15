; ---------------------------------------------------------------------------
; VDP_ClearCram - zero all 64 palette entries in CRAM
; In:  none
; Out: none
; Evidence: command $C0000000 (CRAM write 0), 64 zero words; called once by Sys_InitHardware (TAS frame 4)
; ---------------------------------------------------------------------------
VDP_ClearCram:
	move.l	#$C0000000,($C00004).l
	moveq	#$0,d1
	moveq	#$3F,d0
loc_1FDFF6:
	move.w	d1,($C00000).l
	dbra	d0,loc_1FDFF6
	rts
