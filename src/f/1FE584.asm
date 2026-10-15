; ---------------------------------------------------------------------------
; Snd_Play - start a sound effect or music track (driver command $10 + id) unless sound is muted
; In:  8(a6) = long: sound id (byte)
; Out: none
; Evidence: skipped when byte -$18AC(a5) set (set during demos/init); Music_Play sends it with the track id after Snd_StopAll; 222 of 279 Snd_Stop(id) calls are immediately followed by Snd_Play(id) (restart idiom); 249 call sites
; ---------------------------------------------------------------------------
Snd_Play:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$10,d0
loc_1FE592:
	jsr	Snd_PutCmd(pc)
	move.l	$8(a6),d0
	jsr	Snd_PutByte(pc)
	jmp	Z80_BusRelease(pc)
