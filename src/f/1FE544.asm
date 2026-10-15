; ---------------------------------------------------------------------------
; Snd_Init - load and start the Z80 sound driver and pass it four 24-bit data pointers
; In:  8(a6), $C(a6), $10(a6), $14(a6) = long: ROM addresses of sound data tables
; Out: none
; Evidence: Z80_LoadDriver, Z80_ResetRun, then bytes $FF,$0B and four Snd_SendAddr24; called once from Game_Init at TAS frame 5
; ---------------------------------------------------------------------------
Snd_Init:
	link.w	a6,#$0
	jsr	Z80_LoadDriver(pc)
	jsr	Z80_ResetRun(pc)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	jsr	Snd_SendByte(pc)
	moveq	#$B,d0
	move.l	d0,-(a7)
	jsr	Snd_SendByte(pc)
	move.l	$8(a6),-(a7)
	jsr	Snd_SendAddr24(pc)
	move.l	$C(a6),-(a7)
	jsr	Snd_SendAddr24(pc)
	move.l	$10(a6),-(a7)
	jsr	Snd_SendAddr24(pc)
	move.l	$14(a6),-(a7)
	jsr	Snd_SendAddr24(pc)
	unlk	a6
	rts
