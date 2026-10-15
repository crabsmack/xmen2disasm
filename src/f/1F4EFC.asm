; ---------------------------------------------------------------------------
; VDP_UpdateScroll - write pending plane scroll values to the H-scroll table (VRAM $F400) and VSRAM, and ease camera values toward their targets
; In:  none
; Out: none
; Evidence: flag bytes -$3A56/-$3A58/-$3A5A/-$3A5C ($FFC7AA/A8/A6/A4) select which of VRAM $F400/$F402 (commands $74000003/$74020003) and VSRAM 0/2 to write; -$3A5A also writes 40 column words from -$9C6(a5); then steps four words $FFC764-$FFC772 by 1 toward limits
; ---------------------------------------------------------------------------
VDP_UpdateScroll:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	moveq	#$0,d0
	move.b	g_FgScrollDirty(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F4F62
	clr.b	g_FgScrollDirty(a5)
	move.l	#$74000003,($C00004).l
	move.w	g_FgScrollX(a5),d0
	ext.l	d0
	move.w	g_FgScrollAdjX(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40000010,($C00004).l
	move.w	g_FgScrollY(a5),d0
	ext.l	d0
	move.w	g_FgScrollAdjY(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F4F62:
	moveq	#$0,d0
	move.b	g_BgLockToObj(a5),d0
	cmpi.w	#$1,d0
	beq.s	loc_1F4F7A
	moveq	#$0,d0
	move.b	g_BgScrollDirty(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F4FCC
loc_1F4F7A:
	clr.b	g_BgScrollDirty(a5)
	move.l	#$74020003,($C00004).l
	move.w	g_BgScrollX(a5),d0
	ext.l	d0
	move.w	g_BgScrollAdjX(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	g_BgScrollY(a5),d0
	ext.l	d0
	move.w	g_BgScrollAdjY(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F4FCC:
	moveq	#$0,d0
	move.b	g_VsramReq(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F5028
	clr.b	g_VsramReq(a5)
	move.l	#$40000010,($C00004).l
	move.w	g_FgScrollY(a5),d0
	ext.l	d0
	move.w	g_FgScrollAdjY(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	g_BgScrollY(a5),d0
	ext.l	d0
	move.w	g_BgScrollAdjY(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$FF,d0
	and.l	d1,d0
	move.w	d0,($C00000).l
loc_1F5028:
	moveq	#$0,d0
	move.b	g_ColumnVsReq(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1F50AE
	clr.b	g_ColumnVsReq(a5)
	move.l	#$74000003,($C00004).l
	move.w	g_FgScrollX(a5),d0
	ext.l	d0
	move.w	g_FgScrollAdjX(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$74020003,($C00004).l
	move.w	g_BgScrollX(a5),d0
	ext.l	d0
	move.w	g_BgScrollAdjX(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	#$1FF,d0
	and.l	d1,d0
	neg.l	d0
	move.w	d0,($C00000).l
	move.l	#$40000010,($C00004).l
	clr.w	d7
	moveq	#$28,d3
loc_1F5096:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_HScrollBuf(a5),a0
	move.w	(a0,d0.w),($C00000).l
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5096
loc_1F50AE:
	move.w	g_CamMinX(a5),d0
	cmp.w	g_CamMinXTarget(a5),d0
	beq.s	loc_1F510A
	move.w	g_CamMinX(a5),d0
	cmp.w	g_CamMinXTarget(a5),d0
	ble.s	loc_1F50DE
	move.w	g_CamMinX(a5),d0
	cmp.w	g_CameraX(a5),d0
	bne.s	loc_1F50D6
	move.w	g_CamMinX(a5),d0
	subq.w	#$1,g_CamMinX(a5)
	bra.s	loc_1F510A
loc_1F50D6:
	move.w	g_CamMinXTarget(a5),g_CamMinX(a5)
	bra.s	loc_1F510A
loc_1F50DE:
	move.w	g_CamMinX(a5),d0
	cmp.w	g_CameraX(a5),d0
	bne.s	loc_1F50F2
	move.w	g_CamMinX(a5),d0
	addq.w	#$1,g_CamMinX(a5)
	bra.s	loc_1F510A
loc_1F50F2:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinXTarget(a5),d0
	ble.s	loc_1F5104
	move.w	g_CamMinXTarget(a5),g_CamMinX(a5)
	bra.s	loc_1F510A
loc_1F5104:
	move.w	g_CameraX(a5),g_CamMinX(a5)
loc_1F510A:
	move.w	g_CamMaxX(a5),d0
	cmp.w	g_CamMaxXTarget(a5),d0
	beq.s	loc_1F5166
	move.w	g_CamMaxX(a5),d0
	cmp.w	g_CamMaxXTarget(a5),d0
	bge.s	loc_1F513A
	move.w	g_CamMaxX(a5),d0
	cmp.w	g_CameraX(a5),d0
	bne.s	loc_1F5132
	move.w	g_CamMaxX(a5),d0
	addq.w	#$1,g_CamMaxX(a5)
	bra.s	loc_1F5166
loc_1F5132:
	move.w	g_CamMaxXTarget(a5),g_CamMaxX(a5)
	bra.s	loc_1F5166
loc_1F513A:
	move.w	g_CamMaxX(a5),d0
	cmp.w	g_CameraX(a5),d0
	bne.s	loc_1F514E
	move.w	g_CamMaxX(a5),d0
	subq.w	#$1,g_CamMaxX(a5)
	bra.s	loc_1F5166
loc_1F514E:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxXTarget(a5),d0
	bge.s	loc_1F5160
	move.w	g_CamMaxXTarget(a5),g_CamMaxX(a5)
	bra.s	loc_1F5166
loc_1F5160:
	move.w	g_CameraX(a5),g_CamMaxX(a5)
loc_1F5166:
	move.w	g_CamMinY(a5),d0
	cmp.w	g_CamMinYTarget(a5),d0
	beq.s	loc_1F51C2
	move.w	g_CamMinY(a5),d0
	cmp.w	g_CamMinYTarget(a5),d0
	ble.s	loc_1F5196
	move.w	g_CamMinY(a5),d0
	cmp.w	g_CameraY(a5),d0
	bne.s	loc_1F518E
	move.w	g_CamMinY(a5),d0
	subq.w	#$1,g_CamMinY(a5)
	bra.s	loc_1F51C2
loc_1F518E:
	move.w	g_CamMinYTarget(a5),g_CamMinY(a5)
	bra.s	loc_1F51C2
loc_1F5196:
	move.w	g_CamMinY(a5),d0
	cmp.w	g_CameraY(a5),d0
	bne.s	loc_1F51AA
	move.w	g_CamMinY(a5),d0
	addq.w	#$1,g_CamMinY(a5)
	bra.s	loc_1F51C2
loc_1F51AA:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinYTarget(a5),d0
	ble.s	loc_1F51BC
	move.w	g_CamMinYTarget(a5),g_CamMinY(a5)
	bra.s	loc_1F51C2
loc_1F51BC:
	move.w	g_CameraY(a5),g_CamMinY(a5)
loc_1F51C2:
	move.w	g_CamMaxY(a5),d0
	cmp.w	g_CamMaxYTarget(a5),d0
	beq.s	loc_1F521E
	move.w	g_CamMaxY(a5),d0
	cmp.w	g_CamMaxYTarget(a5),d0
	bge.s	loc_1F51F2
	move.w	g_CamMaxY(a5),d0
	cmp.w	g_CameraY(a5),d0
	bne.s	loc_1F51EA
	move.w	g_CamMaxY(a5),d0
	addq.w	#$1,g_CamMaxY(a5)
	bra.s	loc_1F521E
loc_1F51EA:
	move.w	g_CamMaxYTarget(a5),g_CamMaxY(a5)
	bra.s	loc_1F521E
loc_1F51F2:
	move.w	g_CamMaxY(a5),d0
	cmp.w	g_CameraY(a5),d0
	bne.s	loc_1F5206
	move.w	g_CamMaxY(a5),d0
	subq.w	#$1,g_CamMaxY(a5)
	bra.s	loc_1F521E
loc_1F5206:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxYTarget(a5),d0
	bge.s	loc_1F5218
	move.w	g_CamMaxYTarget(a5),g_CamMaxY(a5)
	bra.s	loc_1F521E
loc_1F5218:
	move.w	g_CameraY(a5),g_CamMaxY(a5)
loc_1F521E:
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
