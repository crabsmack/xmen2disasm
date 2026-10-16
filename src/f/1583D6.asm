; ---------------------------------------------------------------------------
; FluxBomb_StepBurst - explosion phase 3: release one more particle each step and move the released ones outward
; In:  8(a6) = bomb
; Out: none
; Evidence: timer +$6E < 1 -> phase +$100 = 4; +$101 += 100 caps the live count at 16; particle += direction pair (Tbl_FluxBombBurstDirs (jt $47AA) / $49B2 strong)
; ---------------------------------------------------------------------------
FluxBomb_StepBurst:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$9E(a0),a4
	tst.w	$6E(a0)
	bgt.s	loc_1583F4
	move.b	#$4,$100(a0)
	bra.s	loc_15846A
loc_1583F4:
	movea.l	$8(a6),a0
	tst.b	$FF(a0)
	beq.s	loc_158408
	lea.l	$47B2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_158410
loc_158408:
	lea.l	$47AA(a5),a0
	movea.l	$2(a0),a3
loc_158410:
	movea.l	$8(a6),a0
	addi.b	#$64,$101(a0)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$101(a0),d0
	cmpi.b	#$10,d0
	scs.b	d3
	neg.b	d3
	beq.s	loc_158438
	moveq	#$0,d0
	move.b	$101(a0),d0
	tst.l	d0
	bra.s	loc_15843A
loc_158438:
	moveq	#$10,d0
loc_15843A:
	moveq	#$0,d6
	move.b	d0,d6
	tst.l	d6
	clr.w	d7
	bra.s	loc_158466
loc_158444:
	move.w	(a4),d0
	btst	#$0,d0
	beq.s	loc_15845E
	move.b	(a3),d0
	ext.w	d0
	add.w	d0,$2(a4)
	move.b	$1(a3),d0
	ext.w	d0
	add.w	d0,$4(a4)
loc_15845E:
	addq.w	#$6,a4
	addq.w	#$2,a3
	move.w	d7,d0
	addq.w	#$1,d7
loc_158466:
	cmp.w	d7,d6
	bgt.s	loc_158444
loc_15846A:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
