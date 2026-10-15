; ---------------------------------------------------------------------------
; Z80_DriverResume - clear the driver hold flag set by Z80_DriverPause
; In:  none
; Out: none
; Evidence: SR masked; writes 0 to Z80 RAM $1B20 under the bus; called last by VDP_FlushDmaQueue
; ---------------------------------------------------------------------------
Z80_DriverResume:
	move.w	sr,-(a7)
	ori.w	#$700,sr
	jsr	Z80_BusRequest(pc)
	move.b	#$0,($A01B20).l
	jsr	Z80_BusFree(pc)
	move.w	(a7)+,sr
	rts
