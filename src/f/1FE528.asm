; ---------------------------------------------------------------------------
; Snd_SendAddr24 - send a 24-bit value (low byte first) to the sound driver command ring
; In:  8(a6) = long: value (ROM address)
; Out: none
; Evidence: three Snd_PutByte calls with the value shifted right by 0, 8, 16; Snd_Init sends four of these after command $0B
; ---------------------------------------------------------------------------
Snd_SendAddr24:
	jsr	Z80_BusAcquire(pc)
	move.l	$8(a6),d0
	jsr	Snd_PutByte(pc)
	asr.l	#$8,d0
	jsr	Snd_PutByte(pc)
	asr.l	#$8,d0
	jsr	Snd_PutByte(pc)
	jmp	Z80_BusRelease(pc)
