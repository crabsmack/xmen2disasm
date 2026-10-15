; ---------------------------------------------------------------------------
; Snd_Pause - pause sound output (driver command $0C) unless muted
; In:  none
; Out: none
; Evidence: only caller Pause_Check sends it when Start is pressed, before the pause-screen loop; Snd_Resume ($0D) follows
; ---------------------------------------------------------------------------
Snd_Pause:
	jsr	Z80_BusAcquire(pc)
	tst.b	g_SndMute(a5)
	bne.w	Z80_BusRelease
	moveq	#$C,d0
	jsr	Snd_PutCmd(pc)
	jmp	Z80_BusRelease(pc)
