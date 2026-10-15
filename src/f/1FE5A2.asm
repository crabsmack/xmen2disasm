; ---------------------------------------------------------------------------
; Snd_Stop - stop one sound by id (driver command $12 + id) unless sound is muted
; In:  8(a6) = long: sound id (byte)
; Out: none
; Evidence: usually right before Snd_Play with the same id (restart); alone in teardown paths (e.g. sub_096A36 clears an object's sound then frees it); 232 callers
; ---------------------------------------------------------------------------
Snd_Stop:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$12,d0
	bra.s	loc_1FE592
