; ---------------------------------------------------------------------------
; VDP_ClearVram - clear all 64 KB of VRAM with a DMA fill of zero and wait for it
; In:  none
; Out: none
; Evidence: auto-inc 1, reg1 = shadow -$1D48 | $10 (DMA on), length $FFFF, source mode fill ($9780), dest VRAM 0, writes 0, polls status bit 1; called by Sys_InitHardware and sub_1F98A8
; ---------------------------------------------------------------------------
VDP_ClearVram:
	move.w	#$8F01,($C00004).l
	move.w	g_VdpReg1(a5),d0
	ori.w	#$10,d0
	move.w	d0,($C00004).l
	move.w	#$93FF,($C00004).l
	move.w	#$94FF,($C00004).l
	move.w	#$9780,($C00004).l
	move.w	#$4000,($C00004).l
	move.w	#$80,($C00004).l
	move.b	#$0,($C00000).l
	moveq	#$2,d0
loc_1FDFB4:
	and.w	($C00004).l,d0
	bne.s	loc_1FDFB4
	move.w	g_VdpReg1(a5),($C00004).l
	move.w	#$8F02,($C00004).l
	rts
