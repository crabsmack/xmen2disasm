; ---------------------------------------------------------------------------
; Snd_SendCmd2 - shared tail: send command d0 plus two byte arguments, then release the Z80
; In:  d0 = command, 8(a6)/$C(a6) = long: two argument bytes, Z80 already held by Z80_BusAcquire
; Out: none
; Evidence: entered by bra from Snd_SetParam; ends jmp Z80_BusRelease
; ---------------------------------------------------------------------------
Snd_SendCmd2:
	jsr	Snd_PutCmd(pc)
	move.l	$8(a6),d0
	jsr	Snd_PutByte(pc)
	move.l	$C(a6),d0
	jsr	Snd_PutByte(pc)
	jmp	Z80_BusRelease(pc)
