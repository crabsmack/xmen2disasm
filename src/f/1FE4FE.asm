; ---------------------------------------------------------------------------
; Snd_PutCmd - append a command (marker $FF then command byte d0) to the Z80 command ring; falls into Snd_PutByte
; In:  d0 = byte: command, d1 = ring write index, a0 = $A00036, a1 = $A01B40 (as set by Z80_BusAcquire)
; Out: d1 = new index (also stored at $A00036)
; Evidence: register-call helper used inside the Z80_BusAcquire...Z80_BusRelease bracket; ring is 64 bytes (index & $3F)
; ---------------------------------------------------------------------------
Snd_PutCmd:
	move.b	#$FF,(a1,d1.w)
	addq.b	#$1,d1
	andi.b	#$3F,d1
