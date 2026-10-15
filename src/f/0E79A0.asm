; ---------------------------------------------------------------------------
; SentinelsA1_InstallHooks - SentinelsA1: install the frame hook, load resources, set up the zap lights and palette cycles, place the players
; In:  none
; Out: none
; Evidence: $FFC972 = SentinelsA1_FrameHook; Players_PlaceAtStart; clears $FFC61A (exit-open palette cycles off)
; ---------------------------------------------------------------------------
SentinelsA1_InstallHooks:
	link.w	a6,#$0
	lea.l	SentinelsA1_FrameHook(pc),a0
	move.l	a0,-$388E(a5)
	jsr	SentinelsA1_LoadResources(pc)
	jsr	SentinelsA1_InitZapLights(pc)
	jsr	SentinelsA1_ResetPalCycles(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_0E7A10
	ori.b	#$4,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_0E7A10:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E7A56
	ori.b	#$4,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_0E7A56:
	clr.b	-$3BE6(a5)
	unlk	a6
	rts
