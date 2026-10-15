; ---------------------------------------------------------------------------
; Pal_Update - per-frame palette work: step an active fade every N frames, or upload the working/base palette when requested
; In:  none
; Out: none
; Evidence: fade active (-$3A02): every -$3A04 frames DMA -$3A00 (VDP_DmaPalette) and move level -$7BC up/down, ending past 7 or below 0; else if byte -$7C6 upload -$3A00; else if byte -$3A06 upload -$3980; called by VDP_FrameUpdate
; ---------------------------------------------------------------------------
Pal_Update:
	link.w	a6,#$FFFC
	move.l	d3,-(a7)
	tst.b	g_PalFadeActive(a5)
	beq.w	loc_1FD966
	move.w	g_PalFadeTimer(a5),d0
	subq.w	#$1,g_PalFadeTimer(a5)
	tst.w	g_PalFadeTimer(a5)
	bgt.w	loc_1FD990
	move.w	g_PalFadeDelay(a5),g_PalFadeTimer(a5)
	pea.l	g_PalWork(a5)
	jsr	$51EA(a5)	; -> VDP_DmaPalette
	tst.b	g_PalFadeUp(a5)
	addq.w	#$4,a7
	beq.s	loc_1FD910
	move.w	g_PalFadeLevel(a5),d0
	addq.w	#$1,g_PalFadeLevel(a5)
	bra.s	loc_1FD918
loc_1FD910:
	move.w	g_PalFadeLevel(a5),d0
	subq.w	#$1,g_PalFadeLevel(a5)
loc_1FD918:
	moveq	#$0,d0
	move.b	g_PalFadeUp(a5),d0
	moveq	#$7,d1
	cmp.w	g_PalFadeLevel(a5),d1
	slt.b	d3
	neg.b	d3
	ext.w	d3
	and.b	d0,d3
	bne.s	loc_1FD94C
	tst.b	g_PalFadeUp(a5)
	seq.b	d3
	neg.b	d3
	move.l	d3,-$4(a6)
	tst.w	g_PalFadeLevel(a5)
	slt.b	d3
	neg.b	d3
	move.l	-$4(a6),d0
	and.b	d0,d3
	tst.b	d3
	beq.s	loc_1FD952
loc_1FD94C:
	clr.b	g_PalFadeActive(a5)
	bra.s	loc_1FD990
loc_1FD952:
	move.l	g_PalFadeTable(a5),-(a7)
	move.w	g_PalFadeLevel(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Pal_ApplyFade(pc)
	addq.w	#$8,a7
	bra.s	loc_1FD990
loc_1FD966:
	tst.b	g_PalWorkDirty(a5)
	beq.s	loc_1FD97C
	clr.b	g_PalWorkDirty(a5)
	pea.l	g_PalWork(a5)
	jsr	$51EA(a5)	; -> VDP_DmaPalette
	addq.w	#$4,a7
	bra.s	loc_1FD990
loc_1FD97C:
	tst.b	g_PalBaseDirty(a5)
	beq.s	loc_1FD990
	clr.b	g_PalBaseDirty(a5)
	pea.l	g_PalBase(a5)
	jsr	$51EA(a5)	; -> VDP_DmaPalette
	addq.w	#$4,a7
loc_1FD990:
	move.l	-$8(a6),d3
	unlk	a6
	rts
