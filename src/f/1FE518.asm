; ---------------------------------------------------------------------------
; Snd_SendByte - send one raw byte to the sound driver command ring
; In:  8(a6) = long: byte value
; Out: none
; Evidence: Z80_BusAcquire, Snd_PutByte, Z80_BusRelease; used by Snd_Init for $FF and $0B
; ---------------------------------------------------------------------------
Snd_SendByte:
	jsr	Z80_BusAcquire(pc)
	move.l	$8(a6),d0
	jsr	Snd_PutByte(pc)
	jmp	Z80_BusRelease(pc)
