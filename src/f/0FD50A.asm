; ---------------------------------------------------------------------------
; SiberiaB1_InstallTileHooks - SiberiaB1: set SiberiaB1_IceTileHit as the breakable-tile handler, allocate the 48-entry debris pool and start the debris timer
; In:  none
; Out: none
; Evidence: $FFC710 = SiberiaB1_IceTileHit; Mem_StackAlloc($3C0); Timer_Create(SiberiaB1_DebrisUpdate)
; ---------------------------------------------------------------------------
SiberiaB1_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	SiberiaB1_IceTileHit(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	move.b	#$1,g_SolidMapIsBg(a5)
	pea.l	Str_Empty_0FD574(pc)
	pea.l	($3C0).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	addq.l	#$8,a7
	move.l	d0,-(a7)
	jsr	SiberiaB1_DebrisInit(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	SiberiaB1_DebrisUpdate(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,-$3B28(a5)
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	unlk	a6
	rts
