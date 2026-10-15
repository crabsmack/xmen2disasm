; ---------------------------------------------------------------------------
; VDP_DmaPalette - DMA a 64-colour palette (128 bytes) to CRAM, rewriting the first word by hand afterwards
; In:  4(a7) after movem = pointer to 64 words (sp+$C)
; Out: none
; Evidence: length $40 words, command $C0000080 (CRAM write, DMA), then the first word is written again through the data port; callers pass g_PalWork(a5) or g_PalBase(a5) (Pal_Update)
; ---------------------------------------------------------------------------
VDP_DmaPalette:
	movem.l	d7/a3,-(a7)
	movea.l	$C(a7),a3
	move.w	#$C000,g_VdpCmdHi(a5)
	move.w	#$80,g_VdpCmdLo(a5)
	move.l	a3,d7
	move.w	g_VdpReg1(a5),d0
	ori.w	#$10,d0
	move.w	d0,($C00004).l
	move.w	#$9340,($C00004).l
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
	move.l	d7,d0
	moveq	#$11,d1
	asr.l	d1,d0
	moveq	#$7F,d1
	and.l	d0,d1
	addi.l	#$9700,d1
	move.w	d1,($C00004).l
	move.w	g_VdpCmdHi(a5),($C00004).l
	move.w	g_VdpCmdLo(a5),($C00004).l
loc_1FE3A2:
	moveq	#$2,d0
	and.w	($C00004).l,d0
	bne.s	loc_1FE3A2
	andi.w	#$FF7F,g_VdpCmdLo(a5)
	move.w	g_VdpCmdHi(a5),($C00004).l
	move.w	g_VdpCmdLo(a5),($C00004).l
	movea.l	d7,a0
	move.w	(a0),($C00000).l
	move.w	g_VdpReg1(a5),($C00004).l
	movem.l	(a7)+,d7/a3
	rts
