; ---------------------------------------------------------------------------
; SiberiaB1_InstallTileHooks - SiberiaB1: set SiberiaB1_IceTileHit as the breakable-tile handler, allocate the 48-entry debris pool and start the debris timer
; In:  none
; Out: none
; Evidence: $FFC710 = SiberiaB1_IceTileHit; Mem_StackAlloc($3C0); Timer_Create(SiberiaB1_DebrisUpdate)
; ---------------------------------------------------------------------------
SiberiaB1_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	lea.l	SiberiaB1_IceTileHit(pc),a0
	move.l	a0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	move.b	#$1,-$35CA(a5)
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
