; ---------------------------------------------------------------------------
; SmallBrood_Init_SetYLimits - tail of SmallBrood_Init: floor (+$A8) and ceiling (+$AA) y limits, +$AC = $50, frame $FF
; Evidence: with spawn +$E = 0 floor = spawn y, ceiling = y-1; else floor below / ceiling above from Seg_FindBelow / Seg_FindAbove (default ceiling = floor - $A0); then slot +$56 SetFrame($FF)
; ---------------------------------------------------------------------------
SmallBrood_Init_SetYLimits:
	tst.w	$E(a3)
	beq.w	loc_0844D0
	move.w	$2(a3),d6
	move.w	$4(a3),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$20,d0
	sub.l	d0,d7
	pea.l	($3E8).w
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	move.l	d0,-$4(a6)
	lea.l	$C(a7),a7
	beq.s	loc_08447A
	movea.l	-$4(a6),a0
	movea.l	a0,a1
	move.w	$A(a0),d0
	cmp.w	$E(a1),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_08446C
	movea.w	$A(a0),a0
	bra.s	loc_084474
loc_08446C:
	movea.l	-$4(a6),a0
	movea.w	$E(a0),a0
loc_084474:
	move.w	a0,$A8(a4)
	bra.s	loc_084480
loc_08447A:
	move.w	$4(a3),$A8(a4)
loc_084480:
	pea.l	($3E8).w
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3F02(a5)	; -> Seg_FindAbove
	move.l	d0,-$4(a6)
	lea.l	$C(a7),a7
	beq.s	loc_0844C2
	movea.l	-$4(a6),a0
	movea.l	a0,a1
	move.w	$A(a0),d0
	cmp.w	$E(a1),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0844B4
	movea.w	$A(a0),a0
	bra.s	loc_0844BC
loc_0844B4:
	movea.l	-$4(a6),a0
	movea.w	$E(a0),a0
loc_0844BC:
	move.w	a0,$AA(a4)
	bra.s	loc_0844E0
loc_0844C2:
	move.w	$A8(a4),d0
	sub.w	#$A0,d0
	move.w	d0,$AA(a4)
	bra.s	loc_0844E0
loc_0844D0:
	move.w	$4(a3),d7
	move.w	d7,$A8(a4)
	move.w	d7,d0
	subq.w	#$1,d0
	move.w	d0,$AA(a4)
loc_0844E0:
	move.w	#$50,$AC(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movem.l	-$1C(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
