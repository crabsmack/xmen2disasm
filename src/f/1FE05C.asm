; ---------------------------------------------------------------------------
; unk_VDP_1FE05C - init-time DMA of 4 bytes from the long at g_VBlankCount(a5) to VRAM $ED00 with the display off
; In:  none
; Out: none
; Evidence: reg1 $8114, length 2 words, source g_VBlankCount(a5) (the V-int frame counter, just zeroed by the caller), command $6D000083 (VRAM $ED00 DMA), reg1 $8104; only caller Sys_InitHardware at TAS frame 4; purpose of the VRAM target unknown
; ---------------------------------------------------------------------------
unk_VDP_1FE05C:
	move.l	d7,-(a7)
	move.w	#$6D00,g_VdpCmdHi(a5)
	move.w	#$83,g_VdpCmdLo(a5)
	lea.l	g_VBlankCount(a5),a0
	move.l	a0,d7
	move.w	#$8114,($C00004).l
	move.w	#$9302,($C00004).l
	move.w	#$9400,($C00004).l
	move.l	d7,d0
	asr.l	#$1,d0
	move.l	#$FF,d1
	and.l	d0,d1
	addi.l	#$9500,d1
	move.w	d1,($C00004).l
	moveq	#$9,d0
	move.l	d7,d1
	asr.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	addi.l	#$9600,d0
	move.w	d0,($C00004).l
	moveq	#$11,d0
	move.l	d7,d1
	asr.l	d0,d1
	moveq	#$7F,d0
	and.l	d1,d0
	addi.l	#$9700,d0
	move.w	d0,($C00004).l
	move.w	g_VdpCmdHi(a5),($C00004).l
	move.w	g_VdpCmdLo(a5),($C00004).l
	move.w	#$8104,($C00004).l
	move.l	(a7)+,d7
	rts
