; ---------------------------------------------------------------------------
; Snd_Resume - resume sound after Snd_Pause (driver command $0D) unless muted
; In:  none
; Out: none
; Evidence: sent by Pause_Check after the pause loop ends
; ---------------------------------------------------------------------------
Snd_Resume:
	jsr	Z80_BusAcquire(pc)
	tst.b	g_SndMute(a5)
	bne.w	Z80_BusRelease
	moveq	#$D,d0
	jsr	Snd_PutCmd(pc)
	jmp	Z80_BusRelease(pc)
