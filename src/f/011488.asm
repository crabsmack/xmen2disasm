; ---------------------------------------------------------------------------
; sub_011488	[link-after-rts]
; ---------------------------------------------------------------------------
sub_011488:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0114A0
	moveq	#-$32,d0
	bra.s	loc_0114A2
loc_0114A0:
	moveq	#$32,d0
loc_0114A2:
	ext.w	d0
	move.w	d0,d5
	moveq	#-$2E,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0114B8
	moveq	#$0,d0
	bra.s	loc_0114BE
loc_0114B8:
	move.l	#$B4,d0
loc_0114BE:
	moveq	#$0,d7
	move.b	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$1C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$1C2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_011508
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	sub_010098(pc)
	lea.l	$14(a7),a7
loc_011508:
	lea.l	$1D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.b	$A7(a4)
	addq.w	#$8,a7
	beq.s	loc_01157A
	moveq	#$1,d0
	cmp.w	$A0(a4),d0
	bne.s	loc_01153A
	clr.w	$6C(a4)
	lea.l	sub_01163C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_01158E
loc_01153A:
	tst.l	$98(a4)
	bne.s	loc_01154C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01158E
loc_01154C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_011560
	clr.w	$96(a4)
loc_011560:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01158E
loc_01157A:
	move.w	#$3,$6C(a4)
	lea.l	sub_011452(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_01158E:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
