; ---------------------------------------------------------------------------
; Magneto_StateAirShot - air shot wind-up: when the animation ends fire a magnetic bolt in the aim direction
; In:  8(a6) = player
; Out: d0
; Evidence: grounded -> control; anim done -> Magneto_SpawnShot(x, y, dir +$BC, player, standing, priority, air, VRAM $7BE), Obj_SetAnim(Magneto_AirShotEndAnim(dir)), state Magneto_StateAirShotEnd
; ---------------------------------------------------------------------------
Magneto_StateAirShot:
	link.w	a6,#$FFFC
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CDEDC
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Magneto_HoverDamp(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1CDF5E
loc_1CDEDC:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDEF0
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDEF8
loc_1CDEF0:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDEF8:
	beq.s	loc_1CDF14
	tst.b	$9D(a4)
	bne.s	loc_1CDF0A
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDF4A
loc_1CDF0A:
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1CDF4A
loc_1CDF14:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDF28
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDF30
loc_1CDF28:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDF30:
	beq.s	loc_1CDF4A
	tst.b	$9D(a4)
	bne.s	loc_1CDF42
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDF4A
loc_1CDF42:
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1CDF4A:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1CDFC8
loc_1CDF5E:
	tst.l	$44(a4)
	bne.s	loc_1CDFC8
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E32(a5)	; -> Magneto_AirShotEndAnim
	movea.l	d0,a3
	pea.l	($7BE).w
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_1CDF86
	moveq	#$1,d1
	bra.s	loc_1CDF88
loc_1CDF86:
	moveq	#$0,d1
loc_1CDF88:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	$BC(a4),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E4A(a5)	; -> Magneto_SpawnShot
	move.l	d0,-$4(a6)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$2C(a7),a7
	clr.w	$6C(a4)
	lea.l	Magneto_StateAirShotEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CDFC8:
	movem.l	-$10(a6),d3/a3-a4
	unlk	a6
	rts
