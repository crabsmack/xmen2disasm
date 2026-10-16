; ---------------------------------------------------------------------------
; Cyclops_StateGroundAim - standing beam aim: turn and aim with the d-pad while A is held (jump cancels); releasing A fires the beam
; In:  8(a6) = player
; Out: d0
; Evidence: airborne -> StateControl; C press -> +$82 Jump; aim frames $29 level, $32 down, $2C up, $2F up-diagonal; on A release Cyclops_StartBeam(Tbl_CyclopsBeamGroundLevel (jt $4A9A) level / $4C82 v-flipped down-diagonal / $4C92 up / $4C8A up-diagonal), +$5C = Cyclops_StateGroundBeam
; ---------------------------------------------------------------------------
Cyclops_StateGroundAim:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1E35C0
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1E3888
loc_1E35C0:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E35D4
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1E35DC
loc_1E35D4:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1E35DC:
	beq.s	loc_1E364C
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E35F2
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E35FA
loc_1E35F2:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E35FA:
	bne.s	loc_1E364C
	move.l	#$10000,d0
	and.l	$90(a4),d0
	bne.s	loc_1E364C
	tst.b	$9D(a4)
	bne.s	loc_1E361E
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1E362C
loc_1E361E:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1E362C:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_1E3888
loc_1E364C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3660
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E3668
loc_1E3660:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E3668:
	beq.s	loc_1E3672
	ori.b	#$10,$2E(a4)
	bra.s	loc_1E3696
loc_1E3672:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3686
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E368E
loc_1E3686:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E368E:
	beq.s	loc_1E3696
	andi.b	#$EF,$2E(a4)
loc_1E3696:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E36AA
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E36B2
loc_1E36AA:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E36B2:
	beq.w	loc_1E3790
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E36CA
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E36D2
loc_1E36CA:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E36D2:
	beq.s	loc_1E3732
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E36E8
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1E36F0
loc_1E36E8:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1E36F0:
	bne.s	loc_1E372C
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A8A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	Cyclops_StartBeam(pc)
	lea.l	$4A0A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	Cyclops_StateGroundBeam(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1E3888
loc_1E372C:
	moveq	#$2F,d7
	bra.w	loc_1E3862
loc_1E3732:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3746
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1E374E
loc_1E3746:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1E374E:
	bne.s	loc_1E378A
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	Cyclops_StartBeam(pc)
	lea.l	$4A02(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	Cyclops_StateGroundBeam(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1E3888
loc_1E378A:
	moveq	#$2C,d7
	bra.w	loc_1E3862
loc_1E3790:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E37A4
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E37AC
loc_1E37A4:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E37AC:
	beq.s	loc_1E380A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E37C2
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1E37CA
loc_1E37C2:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1E37CA:
	bne.s	loc_1E3806
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$4A82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	Cyclops_StartBeam(pc)
	lea.l	$4A12(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	Cyclops_StateGroundBeam(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1E3888
loc_1E3806:
	moveq	#$32,d7
	bra.s	loc_1E3862
loc_1E380A:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E381E
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1E3826
loc_1E381E:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1E3826:
	bne.s	loc_1E3860
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	Cyclops_StartBeam(pc)
	lea.l	$49FA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	Cyclops_StateGroundBeam(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1E3888
loc_1E3860:
	moveq	#$29,d7
loc_1E3862:
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmp.w	d7,d0
	beq.s	loc_1E3888
	tst.w	$A8(a4)
	bgt.s	loc_1E3888
	move.w	#$5,$A8(a4)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1E3888:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
