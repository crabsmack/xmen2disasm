; ---------------------------------------------------------------------------
; Tile_RunHooksAtPoints - run the map-tile hooks under an object's frame hit points (or under its whole box when the frame flag says so)
; In:  8(a6) = object, $C(a6) = point list (byte pairs, 0,0 end) or box, $10/$14(a6) = words x/y
; Out: d0 = byte 1 if any hook ran
; Evidence: points flipped by +$2E bits 4/3; 32-px map cells (FG $FFC77C/$FFC78E or BG when $FFCC36); tile bits $3800 -> hook table $FFC708; box mode once per hook type; called by XPlayer_Update
; ---------------------------------------------------------------------------
Tile_RunHooksAtPoints:
	link.w	a6,#$FFE4
	movem.l	d4-d7/a3-a4,-(a7)
	tst.b	-$35CA(a5)
	beq.s	loc_15CB48
	move.w	-$3A7A(a5),d0
	bra.s	loc_15CB4C
loc_15CB48:
	move.w	-$3A6E(a5),d0
loc_15CB4C:
	move.w	d0,-$10(a6)
	tst.b	-$35CA(a5)
	beq.s	loc_15CB5C
	move.w	-$3A7C(a5),d0
	bra.s	loc_15CB60
loc_15CB5C:
	move.w	-$3A78(a5),d0
loc_15CB60:
	move.w	d0,-$E(a6)
	movea.l	$8(a6),a0
	lea.l	$2E(a0),a4
	move.b	(a4),d4
	moveq	#$0,d0
	move.b	d4,d0
	moveq	#$10,d1
	and.b	d0,d1
	beq.s	loc_15CB7C
	moveq	#$1,d0
	bra.s	loc_15CB7E
loc_15CB7C:
	moveq	#$0,d0
loc_15CB7E:
	move.b	d0,-$B(a6)
	moveq	#$0,d0
	move.b	d4,d0
	moveq	#$8,d1
	and.b	d0,d1
	beq.s	loc_15CB90
	moveq	#$1,d0
	bra.s	loc_15CB92
loc_15CB90:
	moveq	#$0,d0
loc_15CB92:
	move.b	d0,-$A(a6)
	clr.b	-$9(a6)
	clr.b	d4
	bra.s	loc_15CBAC
loc_15CB9E:
	moveq	#$0,d0
	move.b	d4,d0
	move.b	#$1,-$8(a6,d0.w)
	move.b	d4,d0
	addq.b	#$1,d4
loc_15CBAC:
	moveq	#$0,d0
	move.b	d4,d0
	cmpi.b	#$8,d0
	bcs.s	loc_15CB9E
	movea.l	$8(a6),a0
	move.l	$30(a0),d0
	moveq	#$24,d1
	add.l	d1,d0
	moveq	#$0,d2
	move.b	$2F(a0),d2
	lsl.l	#$4,d2
	add.l	d0,d2
	moveq	#$0,d0
	move.b	$2F(a0),d0
	lsl.l	#$2,d0
	movea.l	d0,a4
	adda.l	d2,a4
	moveq	#$1,d0
	and.w	$E(a4),d0
	beq.s	loc_15CBE4
	moveq	#$1,d0
	bra.s	loc_15CBE6
loc_15CBE4:
	moveq	#$0,d0
loc_15CBE6:
	beq.w	loc_15CDAC
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$14(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$12(a6)
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d7
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d6
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d4
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d5
	cmp.w	d7,d4
	bge.s	loc_15CC44
	eor.w	d4,d7
	eor.w	d7,d4
	eor.w	d4,d7
loc_15CC44:
	cmp.w	d6,d5
	bge.s	loc_15CC4E
	eor.w	d5,d6
	eor.w	d6,d5
	eor.w	d5,d6
loc_15CC4E:
	tst.b	-$B(a6)
	beq.s	loc_15CC6E
	move.w	-$14(a6),d0
	move.w	d0,-$1C(a6)
	sub.w	d4,d0
	move.w	d0,-$1A(a6)
	move.w	-$1C(a6),d0
	sub.w	d7,d0
	move.w	d0,-$16(a6)
	bra.s	loc_15CC88
loc_15CC6E:
	move.w	-$14(a6),-$1C(a6)
	move.w	d7,d0
	add.w	-$1C(a6),d0
	move.w	d0,-$1A(a6)
	move.w	d4,d0
	add.w	-$1C(a6),d0
	move.w	d0,-$16(a6)
loc_15CC88:
	tst.b	-$A(a6)
	beq.s	loc_15CCA4
	move.w	-$12(a6),d0
	move.w	d0,-$1C(a6)
	sub.w	d5,d0
	move.w	d0,-$18(a6)
	move.w	-$1C(a6),d4
	sub.w	d6,d4
	bra.s	loc_15CCB4
loc_15CCA4:
	move.w	-$12(a6),d7
	move.w	d7,d0
	add.w	d6,d0
	move.w	d0,-$18(a6)
	move.w	d7,d4
	add.w	d5,d4
loc_15CCB4:
	move.w	-$1A(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$1A(a6)
	move.w	-$16(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$16(a6)
	move.w	-$18(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$18(a6)
	asr.w	#$5,d4
	move.w	-$1A(a6),d6
	bra.w	loc_15CDA0
loc_15CCDC:
	move.w	-$18(a6),d7
	bra.w	loc_15CD96
loc_15CCE4:
	tst.w	d6
	blt.w	loc_15CD92
	cmp.w	-$10(a6),d6
	bge.w	loc_15CD92
	tst.w	d7
	blt.w	loc_15CD92
	cmp.w	-$E(a6),d7
	bge.w	loc_15CD92
	tst.b	-$35CA(a5)
	beq.s	loc_15CD2E
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
	move.w	#$3800,d1
	and.w	(a0,d0.l),d1
	moveq	#$B,d0
	lsr.w	d0,d1
	bra.s	loc_15CD54
loc_15CD2E:
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
	move.w	#$3800,d1
	and.w	(a0,d0.l),d1
	moveq	#$B,d0
	lsr.w	d0,d1
loc_15CD54:
	move.w	d1,d5
	beq.s	loc_15CD92
	move.l	d5,d0
	asl.w	#$2,d0
	lea.l	-$3AF8(a5),a0
	movea.l	(a0,d0.w),a4
	move.l	a4,d0
	beq.s	loc_15CD92
	tst.b	-$8(a6,d5.w)
	beq.s	loc_15CD92
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	movea.l	a4,a0
	jsr	(a0)
	move.b	d0,-$8(a6,d5.w)
	move.b	#$1,-$9(a6)
	lea.l	$14(a7),a7
loc_15CD92:
	move.w	d7,d0
	addq.w	#$1,d7
loc_15CD96:
	cmp.w	d7,d4
	bge.w	loc_15CCE4
	move.w	d6,d0
	addq.w	#$1,d6
loc_15CDA0:
	cmp.w	-$16(a6),d6
	ble.w	loc_15CCDC
	bra.w	loc_15CEBE
loc_15CDAC:
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,-$12(a6)
	movea.l	$C(a6),a0
	addq.l	#$1,$C(a6)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d4
	tst.w	-$12(a6)
	bne.s	loc_15CDD6
	tst.w	d4
	beq.w	loc_15CEBE
loc_15CDD6:
	tst.b	-$B(a6)
	beq.s	loc_15CDE8
	move.w	-$12(a6),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,-$12(a6)
loc_15CDE8:
	tst.b	-$A(a6)
	beq.s	loc_15CDF6
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	move.w	d0,d4
loc_15CDF6:
	move.w	$12(a6),d0
	ext.l	d0
	move.w	-$12(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	asr.l	#$5,d6
	move.w	$16(a6),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	move.l	d0,d7
	asr.l	#$5,d7
	tst.w	d6
	blt.s	loc_15CDAC
	cmp.w	-$10(a6),d6
	bge.s	loc_15CDAC
	tst.w	d7
	blt.s	loc_15CDAC
	cmp.w	-$E(a6),d7
	bge.s	loc_15CDAC
	tst.b	-$35CA(a5)
	beq.s	loc_15CE58
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
	move.w	#$3800,d1
	and.w	(a0,d0.l),d1
	moveq	#$B,d0
	lsr.w	d0,d1
	bra.s	loc_15CE7E
loc_15CE58:
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
	move.w	#$3800,d1
	and.w	(a0,d0.l),d1
	moveq	#$B,d0
	lsr.w	d0,d1
loc_15CE7E:
	move.w	d1,d5
	beq.w	loc_15CDAC
	move.l	d5,d0
	asl.w	#$2,d0
	lea.l	-$3AF8(a5),a0
	movea.l	(a0,d0.w),a3
	move.l	a3,d0
	beq.w	loc_15CDAC
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	(a3)
	move.b	#$1,-$9(a6)
	lea.l	$14(a7),a7
	bra.w	loc_15CDAC
loc_15CEBE:
	move.b	-$9(a6),d0
	movem.l	-$34(a6),d4-d7/a3-a4
	unlk	a6
	rts
