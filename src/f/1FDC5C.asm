; ---------------------------------------------------------------------------
; VDP_WaitVBlank - wait for the start of the next vertical blank (when enabled)
; In:  none
; Out: none
; Evidence: clears byte g_FrameUpdated(a5); if word g_VdpReg1(a5) has bit 6 set, polls VDP status ($C00004) bit 3 (VBLANK) until it falls then rises
; ---------------------------------------------------------------------------
VDP_WaitVBlank:
	link.w	a6,#$0
	clr.b	g_FrameUpdated(a5)
	moveq	#$40,d0
	and.w	g_VdpReg1(a5),d0
	beq.s	loc_1FDC8C
loc_1FDC6C:
	moveq	#$8,d0
	and.w	($C00004).l,d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	bne.s	loc_1FDC6C
loc_1FDC7C:
	moveq	#$8,d0
	and.w	($C00004).l,d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.s	loc_1FDC7C
loc_1FDC8C:
	unlk	a6
	rts
