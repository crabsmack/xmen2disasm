; ---------------------------------------------------------------------------
; CloneA1_InstallHooks - install CloneA1's frame hook, resources, sprites and palette cycle, then place the players in draw layer 1
; In:  none
; Out: none
; Evidence: g_SceneFrameHook = CloneA1_FrameHook; Players_PlaceAtStart; +$2E |= 4 and DrawList_SetPriority(node, 1, ...) per player
; ---------------------------------------------------------------------------
CloneA1_InstallHooks:
	link.w	a6,#$0
	lea.l	CloneA1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	CloneA1_LoadResources(pc)
	jsr	CloneA1_InitSprites(pc)
	jsr	CloneA1_ResetPalCycle(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_077694
	ori.b	#$4,g_Player1+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player1+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player1+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_Player1+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_077694:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0776D6
	ori.b	#$4,g_Player2+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player2+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player2+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_Player2+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
loc_0776D6:
	unlk	a6
	rts
