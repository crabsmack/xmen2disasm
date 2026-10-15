; ---------------------------------------------------------------------------
; Spr_EmitPreClip - like Spr_EmitPre for a frame that crosses the screen edge: skip pieces outside the visible sprite window
; In:  8(a6) = sprite instance   $C(a6)/$10(a6) = word: x, y (+$80)   $14(a6) = word: tile base
; Out: none
; Evidence: same 6-byte pieces; each piece kept only if $60 <= x <= $1C0 and $60 <= y <= $160 (Spr_EmitPreClip_Piece); Tbl_SprWidthPreClip/Tbl_SprHeightPreClip
; ---------------------------------------------------------------------------
Spr_EmitPreClip:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a2-a4,-(a7)
	cmpi.w	#$50,g_SprIndex(a5)
	bge.w	loc_1FBA02
	moveq	#$0,d2
	movea.l	$8(a6),a0
	movea.l	$2(a0),a1
	move.b	(a0),d1
	move.b	$A(a0),d2
	bmi.w	loc_1FBA02
	movea.l	g_SprWritePtr(a5),a4
	moveq	#$0,d5
	move.w	$16(a6),d7
	lea.l	$24(a1),a2
	lsl.w	#$2,d2
	adda.w	d2,a2
	lsl.w	#$2,d2
	adda.w	d2,a2
	move.b	$10(a2),d3
	moveq	#$0,d0
	sf.b	-$1(a6)
	sf.b	-$2(a6)
	move.b	d1,d0
	ror.l	#$3,d0
	swap	d0
	or.w	d0,d7
	btst	#$4,d1
	beq.s	loc_1FB902
	st.b	-$1(a6)
	ori.w	#$800,d7
loc_1FB902:
	btst	#$3,d1
	beq.s	loc_1FB910
	st.b	-$2(a6)
	ori.w	#$1000,d7
loc_1FB910:
	move.w	d7,$16(a6)
	movea.l	a1,a3
	moveq	#$0,d0
	move.w	$12(a2),d0
	adda.l	d0,a3
	moveq	#$40,d1
	moveq	#$0,d5
	bra.w	loc_1FB9EC
loc_1FB926:
	move.w	$4(a3),d7
	move.w	$16(a6),d6
	andi.w	#$F800,d6
	move.w	$2(a3),d4
	move.w	d4,d0
	andi.w	#$1800,d0
	eor.w	d0,d6
	or.w	d6,d7
	swap	d7
	andi.w	#$F,d4
	add.w	d4,d4
	move.b	(a3),d7
	ext.w	d7
	move.b	$1(a3),d6
	add.b	d1,d6
	ext.w	d6
	sub.w	d1,d6
	tst.b	-$1(a6)
	beq.s	loc_1FB962
	neg.w	d7
	sub.w	Tbl_SprWidthPreClip(pc,d4.w),d7
loc_1FB962:
	add.w	$E(a6),d7
	tst.b	-$2(a6)
	beq.s	loc_1FB972
	neg.w	d6
	sub.w	Tbl_SprHeightPreClip(pc,d4.w),d6
loc_1FB972:
	add.w	$12(a6),d6
	bra.s	Spr_EmitPreClip_Piece
