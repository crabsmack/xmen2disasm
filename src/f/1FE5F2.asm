; ---------------------------------------------------------------------------
; Snd_StopAll - stop all sound (driver command $16) unless muted
; In:  none
; Out: none
; Evidence: no argument; sent by Music_Play before starting a new track and by 17 stage/screen setup functions
; ---------------------------------------------------------------------------
Snd_StopAll:
	jsr	Z80_BusAcquire(pc)
	tst.b	g_SndMute(a5)
	bne.w	Z80_BusRelease
	moveq	#$16,d0
	jsr	Snd_PutCmd(pc)
	jmp	Z80_BusRelease(pc)
