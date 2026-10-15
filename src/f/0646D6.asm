; ---------------------------------------------------------------------------
; PlayerSelect_AllocCharBuffers_Measure - measure one character's frame box and keep the maximum; then allocate the buffers
; In:  a4 = sprite definition, d0 = frame
; Out: none
; Evidence: tail of PlayerSelect_AllocCharBuffers
; ---------------------------------------------------------------------------
PlayerSelect_AllocCharBuffers_Measure:
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	#$FF,d7
	move.l	a4,d0
	beq.s	loc_064760
	move.l	a4,d0
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d7
	move.l	d7,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$2,d0
	movea.l	d0,a3
	adda.l	d2,a3
	move.b	$2(a3),d0
	ext.w	d0
	move.b	(a3),d2
	ext.w	d2
	move.w	d0,d6
	sub.w	d2,d6
	move.b	$3(a3),d0
	ext.w	d0
	move.b	$1(a3),d2
	ext.w	d2
	move.w	d0,d5
	sub.w	d2,d5
	moveq	#$1,d0
	and.w	d6,d0
	add.w	d0,d6
	move.w	d6,d0
	muls.w	d5,d0
	move.l	d0,-$C(a6)
	cmp.l	-$8(a6),d0
	ble.s	loc_06473A
	move.l	-$C(a6),-$8(a6)
	move.w	d5,-$4(a6)
	move.w	d6,-$2(a6)
loc_06473A:
	ext.l	d6
	move.l	d6,d0
	addq.l	#$7,d0
	asr.l	#$3,d0
	move.w	d0,d6
	ext.l	d5
	move.l	d5,d0
	addq.l	#$7,d0
	asr.l	#$3,d0
	move.w	d0,d5
	muls.w	d6,d0
	move.w	d0,-$10(a6)
	cmp.w	-$E(a6),d0
	ble.s	loc_064760
	move.w	-$10(a6),-$E(a6)
loc_064760:
	addq.w	#$1,d4
	cmpi.w	#$7,d4
	blt.w	loc_064650
	move.w	g_PlayerTiles(a5),d0
	cmp.w	-$E(a6),d0
	ble.s	loc_06477A
	move.w	g_PlayerTiles(a5),-$E(a6)
loc_06477A:
	pea.l	Str_Empty_0647CE(pc)
	move.w	-$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_ScaleTileBuf(a5)
	pea.l	Str_Empty_0647CC(pc)
	move.l	-$8(a6),d0
	moveq	#$26,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_ScaleSrcBitmap(a5)
	movea.l	d0,a3
	clr.w	(a3)
	clr.w	$2(a3)
	move.b	-$1(a6),$4(a3)
	move.b	-$3(a6),$5(a3)
	move.w	-$E(a6),d0
	lea.l	$10(a7),a7
	movem.l	-$2C(a6),d3-d7/a3-a4
	unlk	a6
	rts
