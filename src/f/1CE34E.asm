; ---------------------------------------------------------------------------
; Magneto_StateAim - ground aiming: while B is held the pad picks one of 8 directions (aim pose); releasing B shoots
; In:  8(a6) = player
; Out: d0
; Evidence: airborne -> control; C -> Jump; Up/Down/none x Left/Right choose +$BC (Up 4/5 or 3/6, Down 1/8, level 2/7) and the aim pose (Tbl_MagnetoAnim15 (jt $472A)/$4932/$493A/$4942 data); B released -> Magneto_StartShot
; ---------------------------------------------------------------------------
Magneto_StateAim:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CE37A
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CE60E
loc_1CE37A:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE38E
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1CE396
loc_1CE38E:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1CE396:
	beq.s	loc_1CE406
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE3AC
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE3B4
loc_1CE3AC:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE3B4:
	bne.s	loc_1CE406
	move.l	#$10000,d0
	and.l	$90(a4),d0
	bne.s	loc_1CE406
	tst.b	$9D(a4)
	bne.s	loc_1CE3D8
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CE3E6
loc_1CE3D8:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CE3E6:
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
	bra.w	loc_1CE60E
loc_1CE406:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE41A
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE422
loc_1CE41A:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE422:
	beq.s	loc_1CE42C
	ori.b	#$10,$2E(a4)
	bra.s	loc_1CE450
loc_1CE42C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE440
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE448
loc_1CE440:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE448:
	beq.s	loc_1CE450
	andi.b	#$EF,$2E(a4)
loc_1CE450:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE464
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE46C
loc_1CE464:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE46C:
	beq.w	loc_1CE536
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE484
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE48C
loc_1CE484:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE48C:
	beq.s	loc_1CE4E2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE4A2
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CE4AA
loc_1CE4A2:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CE4AA:
	bne.s	loc_1CE4D6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE4BC
	move.w	#$6,$BC(a4)
	bra.s	loc_1CE4C2
loc_1CE4BC:
	move.w	#$3,$BC(a4)
loc_1CE4C2:
	lea.l	Magneto_StartShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartShot(pc)
	addq.w	#$4,a7
	bra.w	loc_1CE60E
loc_1CE4D6:
	lea.l	$473A(a5),a0
	movea.l	$2(a0),a3
	bra.w	loc_1CE5F2
loc_1CE4E2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE4F6
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CE4FE
loc_1CE4F6:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CE4FE:
	bne.s	loc_1CE52A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE510
	move.w	#$5,$BC(a4)
	bra.s	loc_1CE516
loc_1CE510:
	move.w	#$4,$BC(a4)
loc_1CE516:
	lea.l	Magneto_StartShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartShot(pc)
	addq.w	#$4,a7
	bra.w	loc_1CE60E
loc_1CE52A:
	lea.l	$4732(a5),a0
	movea.l	$2(a0),a3
	bra.w	loc_1CE5F2
loc_1CE536:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE54A
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE552
loc_1CE54A:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE552:
	beq.s	loc_1CE5A4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE568
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CE570
loc_1CE568:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CE570:
	bne.s	loc_1CE59A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE582
	move.w	#$8,$BC(a4)
	bra.s	loc_1CE588
loc_1CE582:
	move.w	#$1,$BC(a4)
loc_1CE588:
	lea.l	Magneto_StartShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartShot(pc)
	addq.w	#$4,a7
	bra.s	loc_1CE60E
loc_1CE59A:
	lea.l	$4742(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_1CE5F2
loc_1CE5A4:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE5B8
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CE5C0
loc_1CE5B8:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CE5C0:
	bne.s	loc_1CE5EA
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE5D2
	move.w	#$7,$BC(a4)
	bra.s	loc_1CE5D8
loc_1CE5D2:
	move.w	#$2,$BC(a4)
loc_1CE5D8:
	lea.l	Magneto_StartShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartShot(pc)
	addq.w	#$4,a7
	bra.s	loc_1CE60E
loc_1CE5EA:
	lea.l	$472A(a5),a0
	movea.l	$2(a0),a3
loc_1CE5F2:
	cmpa.l	$44(a4),a3
	beq.s	loc_1CE60E
	tst.w	$A8(a4)
	bgt.s	loc_1CE60E
	move.w	#$5,$A8(a4)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_1CE60E:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
