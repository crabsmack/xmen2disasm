; ---------------------------------------------------------------------------
; Brood_ActApproach - BROOD script action: if not at its preferred distance +$AC (+/-4) from the nearest player and the cooldown allows, walk (speed +$A6) towards that distance
; In:  8(a6) = this
; Out: d0
; Evidence: cooldown +$B0 reloaded from +$AE; walk animation jt $6D0F0; next Brood_StateApproach
; ---------------------------------------------------------------------------
Brood_ActApproach:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_06D73C
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_06D742
loc_06D73C:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_06D742:
	move.w	d0,d7
	ext.l	d7
	move.w	$AC(a4),d0
	ext.l	d0
	subq.l	#$4,d0
	cmp.l	d7,d0
	addq.w	#$4,a7
	bgt.s	loc_06D7A6
	ext.l	d7
	move.w	$AC(a4),d0
	ext.l	d0
	addq.l	#$4,d0
	cmp.l	d7,d0
	blt.s	loc_06D7A6
	tst.l	$98(a4)
	bne.s	loc_06D776
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_06D83E
loc_06D776:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06D78A
	clr.w	$96(a4)
loc_06D78A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_06D83E
loc_06D7A6:
	tst.w	$B0(a4)
	bne.s	loc_06D7F2
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	bne.s	loc_06D7C4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06D83E
loc_06D7C4:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06D7D8
	clr.w	$96(a4)
loc_06D7D8:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06D83E
loc_06D7F2:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_06D810
	ori.b	#$10,$2E(a4)
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_06D81C
loc_06D810:
	andi.b	#$EF,$2E(a4)
	move.w	$A6(a4),$16(a4)
loc_06D81C:
	lea.l	$FF2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Brood_StateApproach(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06D83E:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
