; ---------------------------------------------------------------------------
; FluxBomb_StepImplode - implosion phase 1: move the 16 particles toward the centre; phase 2 when all have arrived
; In:  8(a6) = bomb
; Out: d0
; Evidence: particle += step (jt $499A / $49A2 strong); within 8 px -> particle off; none left -> +$100 = 2
; ---------------------------------------------------------------------------
FluxBomb_StepImplode:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$9E(a0),a4
	moveq	#$1,d4
	lea.l	$479A(a5),a0
	movea.l	$2(a0),a3
	movea.l	$8(a6),a0
	tst.b	$FF(a0)
	beq.s	loc_1584A2
	lea.l	$47A2(a5),a0
	movea.l	$2(a0),a0
	bra.s	loc_1584AA
loc_1584A2:
	lea.l	$479A(a5),a0
	movea.l	$2(a0),a0
loc_1584AA:
	movea.l	a0,a3
	clr.w	d5
loc_1584AE:
	move.w	(a4),d0
	btst	#$0,d0
	beq.s	loc_158510
	move.b	(a3),d0
	ext.w	d0
	move.w	d0,d6
	add.w	$2(a4),d6
	move.b	$1(a3),d0
	ext.w	d0
	move.w	d0,d7
	add.w	$4(a4),d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1584DA
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_1584E0
loc_1584DA:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_1584E0:
	moveq	#$8,d1
	cmp.l	d0,d1
	ble.s	loc_158506
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1584F4
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1584FA
loc_1584F4:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1584FA:
	moveq	#$8,d1
	cmp.l	d0,d1
	ble.s	loc_158506
	andi.w	#$FFFE,(a4)
	bra.s	loc_158510
loc_158506:
	move.w	d6,$2(a4)
	move.w	d7,$4(a4)
	clr.b	d4
loc_158510:
	addq.w	#$6,a4
	addq.w	#$4,a3
	move.w	d5,d0
	addq.w	#$1,d5
	cmpi.w	#$10,d5
	blt.s	loc_1584AE
	tst.b	d4
	beq.s	loc_15852C
	movea.l	$8(a6),a0
	move.b	#$2,$100(a0)
loc_15852C:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
