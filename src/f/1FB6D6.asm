; ---------------------------------------------------------------------------
; Spr_EmitPreLinked_Piece - Spr_EmitPreLinked inner loop: clip one piece and write it to the next free sprite slot
; In:  registers of Spr_EmitPreLinked (d6/d7 = y/x, a3 = piece)
; Out: none
; Evidence: window $60-$1C0 / $60-$160; slot from the link byte at write pointer -$1FE6, sprite index -$1FE2; 80-slot limit
; ---------------------------------------------------------------------------
Spr_EmitPreLinked_Piece:
	cmpi.w	#$60,d7
	blt.s	loc_1FB730
	cmpi.w	#$1C0,d7
	bgt.s	loc_1FB730
	cmpi.w	#$60,d6
	blt.s	loc_1FB730
	cmpi.w	#$160,d6
	bgt.s	loc_1FB730
	tst.w	$2(a3)
	bpl.s	loc_1FB6FE
	movea.l	$8(a6),a0
	tst.b	$10(a0)
	bne.s	loc_1FB730
loc_1FB6FE:
	movea.l	-$1FE6(a5),a0
	moveq	#$0,d1
	move.b	$3(a0),d1
	cmpi.w	#$50,d1
	beq.s	loc_1FB74E
	move.w	d1,-$1FE2(a5)
	move.w	d1,d0
	asl.w	#$3,d0
	lea.l	g_SpriteTable(a5),a0
	adda.w	d0,a0
	move.l	a0,-$1FE6(a5)
	addq.w	#$1,d1
	swap	d6
	move.w	d4,d6
	asl.w	#$7,d6
	move.b	d1,d6
	move.l	d6,(a0)+
	move.l	d7,(a0)
	bra.s	loc_1FB734
loc_1FB730:
	st.b	-$1(a6)
loc_1FB734:
	addq.w	#$6,a3
	addq.w	#$1,d5
loc_1FB738:
	cmp.b	$10(a2),d5
	blt.w	loc_1FB604
loc_1FB740:
	move.b	-$1(a6),d0
	movem.l	-$1C(a6),d4-d7/a2-a3
	unlk	a6
	rts
loc_1FB74E:
	moveq	#-$1,d0
	movem.l	-$1C(a6),d4-d7/a2-a3
	unlk	a6
	rts
