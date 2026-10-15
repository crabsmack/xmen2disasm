; ---------------------------------------------------------------------------
; Cerebro_LoadSpriteTiles - load the Cerebro sprite resource and remember its tile base
; In:  none
; Out: none
; Evidence: sub_1F62C0(jt $608E2 resource, 1); -$3B10 = tile base from the 20-byte resource table at $FFC980
; ---------------------------------------------------------------------------
Cerebro_LoadSpriteTiles:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DDA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,d7
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$6(a4),-$3B10(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
