; ---------------------------------------------------------------------------
; FluxBomb_HitTilesInArea - run the map-tile hooks for every hooked tile in the blast rectangle (spiralling out from the bomb), once per hook type
; In:  8(a6) = bomb, $C/$10/$14/$18(a6) = words left, top, right, bottom
; Out: none
; Evidence: clipped to the screen; 32-px cells via the map row table ($FFC78E/$FFC77C, or the BG map when $FFCC36); tile bits $3800 -> hook index into $FFC708; a hook returning 0 stops further calls of that type
; ---------------------------------------------------------------------------
FluxBomb_HitTilesInArea:
	link.w	a6,#$FFE2
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$18(a6)
	move.w	$12(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$16(a6)
	move.w	$16(a6),d0
	asr.w	#$5,d0
	ext.l	d0
	addq.l	#$1,d0
	move.w	d0,-$14(a6)
	move.w	$1A(a6),d0
	asr.w	#$5,d0
	ext.l	d0
	addq.l	#$1,d0
	move.w	d0,-$12(a6)
	move.w	g_CameraX(a5),d5
	asr.w	#$5,d5
	move.w	g_CameraY(a5),d4
	asr.w	#$5,d4
	ext.l	d5
	move.l	d5,d0
	moveq	#$B,d1
	add.l	d1,d0
	move.w	d0,-$10(a6)
	ext.l	d4
	move.l	d4,d0
	addq.l	#$8,d0
	move.w	d0,-$E(a6)
	movea.l	$8(a6),a0
	moveq	#$D,d0
	move.l	$8(a0),d6
	asr.l	d0,d6
	moveq	#$D,d0
	move.l	$C(a0),d7
	asr.l	d0,d7
	clr.l	-$4(a6)
	move.w	#$7,-$1A(a6)
	bra.s	loc_158698
loc_15868A:
	move.w	-$1A(a6),d0
	move.b	#$1,-$C(a6,d0.w)
	subq.w	#$1,-$1A(a6)
loc_158698:
	tst.w	-$1A(a6)
	bne.s	loc_15868A
	cmp.w	-$18(a6),d5
	ble.s	loc_1586A8
	move.w	d5,-$18(a6)
loc_1586A8:
	cmp.w	-$16(a6),d4
	ble.s	loc_1586B2
	move.w	d4,-$16(a6)
loc_1586B2:
	move.w	-$14(a6),d0
	cmp.w	-$10(a6),d0
	ble.s	loc_1586C2
	move.w	-$10(a6),-$14(a6)
loc_1586C2:
	move.w	-$12(a6),d0
	cmp.w	-$E(a6),d0
	ble.s	loc_1586D2
	move.w	-$E(a6),-$12(a6)
loc_1586D2:
	move.w	-$18(a6),d0
	ext.l	d0
	move.w	-$14(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d4
	asr.l	#$1,d4
	move.w	-$16(a6),d0
	ext.l	d0
	move.w	-$12(a6),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,-$1C(a6)
	cmp.w	d6,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_15870E
	ext.l	d6
	move.w	-$18(a6),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	bra.s	loc_15871A
loc_15870E:
	move.w	-$14(a6),d0
	ext.l	d0
	ext.l	d6
	sub.l	d6,d0
	move.l	d0,d1
loc_15871A:
	move.w	d1,d5
	cmp.w	-$1C(a6),d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_158734
	ext.l	d7
	move.w	-$16(a6),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_158740
loc_158734:
	move.w	-$12(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	move.l	d0,d1
loc_158740:
	move.w	d1,d4
	lsl.w	#$1,d5
	lsl.w	#$1,d4
	cmp.w	d5,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_158752
	move.w	d5,d0
	bra.s	loc_158754
loc_158752:
	move.w	d4,d0
loc_158754:
	move.w	d0,-$2(a6)
loc_158758:
	moveq	#$1,d0
	move.l	d0,-$1E(a6)
	addq.w	#$1,-$4(a6)
	move.w	-$4(a6),d1
	btst	#$0,d1
	beq.s	loc_158776
	move.l	-$1E(a6),d0
	neg.l	d0
	move.l	d0,-$1E(a6)
loc_158776:
	move.w	#$2,-$1A(a6)
	bra.w	loc_158858
loc_158780:
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,d4
	bra.w	loc_15884E
loc_15878C:
	moveq	#$0,d0
	move.w	-$1A(a6),d0
	moveq	#$2,d1
	and.w	d0,d1
	beq.s	loc_15879E
	add.w	-$1C(a6),d6
	bra.s	loc_1587A2
loc_15879E:
	add.w	-$1C(a6),d7
loc_1587A2:
	cmp.w	-$18(a6),d6
	blt.w	loc_15884C
	cmp.w	-$14(a6),d6
	bgt.w	loc_15884C
	cmp.w	-$16(a6),d7
	blt.w	loc_15884C
	cmp.w	-$12(a6),d7
	bgt.w	loc_15884C
	tst.b	-$35CA(a5)
	beq.s	loc_1587E8
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,d0
	bra.s	loc_158806
loc_1587E8:
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,d0
loc_158806:
	movea.l	d0,a4
	move.w	#$3800,d0
	and.w	(a4),d0
	moveq	#$B,d1
	move.w	d0,d5
	lsr.w	d1,d5
	tst.w	d5
	beq.s	loc_15884C
	move.l	d5,d0
	asl.w	#$2,d0
	lea.l	-$3AF8(a5),a0
	movea.l	(a0,d0.w),a3
	move.l	a3,d0
	beq.s	loc_15884C
	tst.b	-$C(a6,d5.w)
	beq.s	loc_15884C
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	movea.l	a3,a0
	jsr	(a0)
	move.b	d0,-$C(a6,d5.w)
	lea.l	$14(a7),a7
loc_15884C:
	subq.l	#$1,d4
loc_15884E:
	tst.l	d4
	bne.w	loc_15878C
	subq.w	#$1,-$1A(a6)
loc_158858:
	tst.w	-$1A(a6)
	bne.w	loc_158780
	move.w	-$4(a6),d0
	cmp.w	-$2(a6),d0
	blt.w	loc_158758
	movem.l	-$3A(a6),d3-d7/a3-a4
	unlk	a6
	rts
