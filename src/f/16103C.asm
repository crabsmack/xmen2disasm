; ---------------------------------------------------------------------------
; Cam_TrackBoth - camera tracking fn for two players: x follows the players' midpoint through the dead-zone box, y keeps both on screen; drops to one-player mode when one is gone
; In:  8(a6) = this
; Out: none
; Evidence: reads both players' +8/+$C; if $FFC920 (players alive) == 1 calls vtable +$1E Cam_FollowPlayer(96,90,224,192), sets g_CamModeSwitched and calls the hook +$1C
; ---------------------------------------------------------------------------
Cam_TrackBoth:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$3C(a4),-$A(a6)
	move.w	$3E(a4),-$8(a6)
	move.w	$40(a4),-$6(a6)
	move.w	$42(a4),-$4(a6)
	moveq	#$0,d0
	move.b	g_PlayersAlive(a5),d0
	cmpi.w	#$1,d0
	bne.s	loc_1610A4
	pea.l	($C0).w
	pea.l	($E0).w
	moveq	#$5A,d0
	move.l	d0,-(a7)
	moveq	#$60,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1E(a0),a1
	jsr	(a1)
	move.b	#$1,g_CamModeSwitched(a5)
	movea.l	$1C(a4),a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.w	loc_161184
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
	bra.w	loc_161184
loc_1610A4:
	move.l	-$1750(a5),d0
	cmp.l	-$1840(a5),d0
	bge.s	loc_1610C0
	move.l	-$1750(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.l	-$1840(a5),d4
	asr.l	#$8,d4
	bra.s	loc_1610D0
loc_1610C0:
	move.l	-$1840(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.l	-$1750(a5),d4
	asr.l	#$8,d4
loc_1610D0:
	move.l	-$174C(a5),d0
	cmp.l	-$183C(a5),d0
	bge.s	loc_1610E8
	move.l	-$174C(a5),d6
	asr.l	#$8,d6
	move.l	-$183C(a5),d5
	asr.l	#$8,d5
	bra.s	loc_1610F4
loc_1610E8:
	move.l	-$183C(a5),d6
	asr.l	#$8,d6
	move.l	-$174C(a5),d5
	asr.l	#$8,d5
loc_1610F4:
	move.w	-$2(a6),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	move.l	d0,d7
	asr.l	#$1,d7
	moveq	#$1,d0
	and.w	$4A(a4),d0
	bne.s	loc_161154
	ext.l	d7
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$A(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d7,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_16112A
	move.w	d7,d0
	sub.w	-$A(a6),d0
	bra.s	loc_161150
loc_16112A:
	ext.l	d7
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$8(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d7,d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_16114A
	move.w	d7,d0
	sub.w	-$8(a6),d0
	bra.s	loc_161150
loc_16114A:
	move.w	$30(a4),d0
	ext.l	d0
loc_161150:
	move.w	d0,$30(a4)
loc_161154:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_161184
	move.w	d5,d0
	sub.w	-$4(a6),d0
	move.w	d0,$32(a4)
	ext.l	d6
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$6(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d6,d1
	ble.s	loc_161184
	move.w	d6,d0
	sub.w	-$6(a6),d0
	move.w	d0,$32(a4)
loc_161184:
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
