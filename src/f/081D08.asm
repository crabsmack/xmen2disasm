; ---------------------------------------------------------------------------
; CloneA2_FrameHook - CloneA2 per-frame scene hook: quake trigger check and palette flicker
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook(a5) by CloneA2_InstallHooks; if -$3B08 clear and the trigger point (+8/+A) of zone -$3B06 in Tbl_CloneA2CameraZones lies inside the 320x224 view (g_CameraX/Y) calls CloneA2_StartQuake; calls CloneA2_FlickerUpdate (a second time when -$38DE is set, the flag that also makes g_FrameCounter step by 2); TAS 47905-48904 every frame
; ---------------------------------------------------------------------------
CloneA2_FrameHook:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.w	-$3B08(a5)
	bne.s	loc_081D9A
	lea.l	$1152(a5),a0
	movea.l	$2(a0),a4
	move.w	-$3B06(a5),d0
	ext.l	d0
	move.l	d0,d1
	mulu.w	#$C,d0
	swap	d1
	mulu.w	#$C,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.w	$8(a4,d0.l),d6
	move.w	-$3B06(a5),d0
	ext.l	d0
	move.l	d0,d1
	mulu.w	#$C,d0
	swap	d1
	mulu.w	#$C,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.w	$A(a4,d0.l),d7
	tst.w	d6
	beq.s	loc_081D9A
	tst.w	d7
	beq.s	loc_081D9A
	cmp.w	g_CameraX(a5),d6
	ble.s	loc_081D9A
	ext.l	d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	cmp.l	d6,d0
	ble.s	loc_081D9A
	cmp.w	g_CameraY(a5),d7
	ble.s	loc_081D9A
	ext.l	d7
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	cmp.l	d7,d0
	ble.s	loc_081D9A
	jsr	CloneA2_StartQuake(pc)
loc_081D9A:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081DAA
	tst.w	-$3B04(a5)
	bne.s	loc_081DAA
	jsr	CloneA2_FlickerUpdate(pc)
loc_081DAA:
	tst.b	-$38DE(a5)
	beq.s	loc_081DC8
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081DC8
	tst.w	-$3B04(a5)
	bne.s	loc_081DC8
	jsr	CloneA2_FlickerUpdate(pc)
loc_081DC8:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
