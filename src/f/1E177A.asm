; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_Emit - Cyclops_DrawBeam second half: write the beam's two piece lists into the sprite table, clipped by the cut length
; In:  a6 frame of Cyclops_DrawBeam; d6/d7 = cut y/x
; Out: none
; Evidence: entered directly when the cut is already known; writes g_SpriteTable via g_SprWritePtr, stores counts in instance +$C/+$D and link indexes in $FFE990-$FFE99B, sets $FFE98E/$FFE993 = $FF
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_Emit:
	move.w	d7,-$2(a6)
	move.w	d6,-$4(a6)
	tst.b	-$19(a6)
	beq.s	loc_1E178E
	ori.w	#$800,-$A(a6)
loc_1E178E:
	movea.l	g_SprWritePtr(a5),a2
	move.b	$3(a2),d0
	move.b	d0,g_SprFlickerNew+$1(a5)
	subq.b	#$1,d0
	move.b	d0,g_SprFlickerNew(a5)
	movea.l	$C(a6),a0
	movea.l	$14(a0),a4
	move.b	$6(a4),d0
	ext.w	d0
	move.w	d0,-$C(a6)
	adda.w	$2(a4),a4
	sf.b	-$18(a6)
loc_1E17BA:
	moveq	#$0,d2
	st.b	-$17(a6)
	bra.w	loc_1E1884
loc_1E17C4:
	tst.w	$6(a4)
	blt.w	loc_1E188C
	moveq	#$F,d5
	and.b	$5(a4),d5
	moveq	#$C,d4
	and.w	d5,d4
	addq.w	#$4,d4
	add.w	d4,d4
	moveq	#$3,d3
	and.w	d5,d3
	addq.w	#$1,d3
	lsl.w	#$3,d3
	move.w	(a4),d7
	move.w	$2(a4),d6
	move.w	d7,d1
	tst.b	-$19(a6)
	beq.s	loc_1E17F4
	neg.w	d7
	sub.w	d4,d7
loc_1E17F4:
	moveq	#$7,d0
	and.b	$4(a4),d0
	cmp.b	-$17(a6),d0
	beq.w	loc_1E1822
	move.b	d0,-$17(a6)
	lsr.w	#$1,d4
	lsr.w	#$1,d3
	add.w	d1,d4
	add.w	d6,d3
	bpl.s	loc_1E1812
	neg.w	d3
loc_1E1812:
	cmp.w	-$2(a6),d1
	bhi.w	loc_1E188C
	cmp.w	-$4(a6),d3
	bhi.w	loc_1E188C
loc_1E1822:
	add.w	-$8(a6),d6
	add.w	-$6(a6),d7
	cmpi.w	#$FFE0,d7
	ble.s	loc_1E1880
	cmpi.w	#$140,d7
	bge.s	loc_1E1880
	cmpi.w	#$FFE0,d6
	ble.s	loc_1E1880
	cmpi.w	#$E0,d6
	bge.s	loc_1E1880
	move.b	$3(a2),d0
	ext.w	d0
	cmpi.w	#$50,d0
	beq.s	loc_1E188C
	move.w	d0,g_SprIndex(a5)
	addq.l	#$8,a2
	move.l	a2,g_SprWritePtr(a5)
	addi.w	#$80,d6
	move.w	d6,(a2)
	move.b	d5,$2(a2)
	move.w	-$A(a6),d0
	add.w	$6(a4),d0
	move.w	$4(a4),d1
	andi.w	#$1800,d1
	eor.w	d1,d0
	move.w	d0,$4(a2)
	addi.w	#$80,d7
	move.w	d7,$6(a2)
loc_1E1880:
	addq.w	#$1,d2
	addq.w	#$8,a4
loc_1E1884:
	cmp.w	-$C(a6),d2
	blt.w	loc_1E17C4
loc_1E188C:
	movea.l	$C(a6),a1
	tst.b	-$18(a6)
	bne.s	loc_1E18BA
	st.b	-$18(a6)
	move.b	d2,$C(a1)
	move.b	$3(a2),g_SprFlickerNew+$2(a5)
	movea.l	$14(a1),a4
	move.b	$7(a4),d0
	ext.w	d0
	move.w	d0,-$C(a6)
	adda.w	$4(a4),a4
	bra.w	loc_1E17BA
loc_1E18BA:
	move.b	d2,$D(a1)
	move.b	$3(a2),-$1865(a5)
	moveq	#$0,d0
	move.b	$3(a2),d0
	ext.w	d0
	cmpi.w	#$50,d0
	beq.s	loc_1E18EE
	move.w	d0,g_SprIndex(a5)
	addq.l	#$8,a2
	move.l	a2,g_SprWritePtr(a5)
	moveq	#-$1,d6
	moveq	#$0,d5
	move.w	d6,(a2)
	move.b	d5,$2(a2)
	move.w	d5,$4(a2)
	move.w	d6,$6(a2)
loc_1E18EE:
	st.b	d0
	move.b	d0,g_SprFlickerNew+$3(a5)
	move.b	d0,g_SprFlickerPending(a5)
loc_1E18F8:
	movem.l	-$40(a6),d2-d7/a2-a4
	unlk	a6
	rts
