; ---------------------------------------------------------------------------
; SiberiaB1_InstallHooks - SiberiaB1: frame hook; with no player (power-on demo) pick a random character from the VDP H/V counter and start a 1200-frame demo timer; place players, resources, ice tiles, wind
; In:  none
; Out: none
; Evidence: $FFC972 = SiberiaB1_FrameHook; reads $C00008; Rand_Seed, Player1_StartLife; $FFC6F6 = $4B0; NOTES: power-on play ends at ~frame 1380
; ---------------------------------------------------------------------------
SiberiaB1_InstallHooks:
	link.w	a6,#$0
	move.l	d7,-(a7)
	lea.l	SiberiaB1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	tst.l	g_Player1(a5)
	bne.s	loc_0FD662
	jsr	$4D9A(a5)	; -> Irq_Disable
loc_0FD62C:
	moveq	#$0,d7
	move.b	($C00008).l,d7
	moveq	#$0,d0
	move.b	($C00008).l,d0
	cmp.w	d7,d0
	bne.s	loc_0FD62C
	jsr	$4DA2(a5)	; -> Irq_Enable
	ext.l	d7
	move.w	g_AttractDemoNum(a5),d0
	ext.l	d0
	add.l	d7,d0
	move.l	d0,-(a7)
	jsr	$4182(a5)	; -> Rand_Seed
	jsr	$4A(a5)	; -> Player1_StartLife
	move.w	#$4B0,-$3B0A(a5)
	addq.w	#$4,a7
	bra.s	loc_0FD666
loc_0FD662:
	clr.w	-$3B0A(a5)
loc_0FD666:
	moveq	#$2,d0
	and.w	g_ProgressFlags(a5),d0
	beq.s	loc_0FD672
	clr.w	-$3B0A(a5)
loc_0FD672:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	SiberiaB1_LoadResources(pc)
	jsr	SiberiaB1_InstallTileHooks(pc)
	jsr	SiberiaB1_ResetPalCycles(pc)
	jsr	SiberiaB1_InitWind(pc)
	lea.l	$10(a7),a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
