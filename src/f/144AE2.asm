; ---------------------------------------------------------------------------
; sub_144AE2	[jt 1953]
; ---------------------------------------------------------------------------
sub_144AE2:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_144AF8
	moveq	#$2,d0
	bra.s	loc_144AFA
loc_144AF8:
	moveq	#$1,d0
loc_144AFA:
	move.w	d0,d6
	move.l	$8(a4),d5
	move.l	$C(a4),d7
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_144B42
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	tst.w	$68(a4)
	addq.w	#$4,a7
	bgt.s	loc_144B32
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_144B32:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.w	loc_144C6C
loc_144B42:
	tst.w	$6C(a4)
	ble.s	loc_144B4C
	sub.w	d6,$6C(a4)
loc_144B4C:
	tst.w	$6C(a4)
	bge.s	loc_144B56
	clr.w	$6C(a4)
loc_144B56:
	moveq	#$2,d0
	cmp.w	$68(a4),d0
	bge.s	loc_144B70
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_144BE0
loc_144B70:
	tst.w	$68(a4)
	ble.s	loc_144BBA
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$1,d0
	beq.s	loc_144B8A
	clr.w	$6E(a4)
	clr.w	$90(a4)
loc_144B8A:
	pea.l	$90(a4)
	pea.l	$6E(a4)
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	sub_144774(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.s	loc_144BE0
loc_144BBA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.b	$70(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	lea.l	$3D7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AF2(a5)	; -> sub_13EEFA
	lea.l	$14(a7),a7
	bra.w	loc_144C6C
loc_144BE0:
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_144C58
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_144C18
	move.l	$8(a4),d0
	sub.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,-$CA8(a5)
	move.l	$C(a4),d0
	sub.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,-$CAA(a5)
	pea.l	$40C2(a5)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> sub_1F669A
	addq.w	#$8,a7
loc_144C18:
	moveq	#$0,d7
	move.b	$3B(a4),d7
	tst.l	d7
	bra.s	loc_144C52
loc_144C22:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_144C30
	moveq	#$0,d0
	bra.s	loc_144C3E
loc_144C30:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_144C3E:
	movea.l	d0,a3
	moveq	#$0,d7
	move.b	$3C(a3),d7
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_144C52:
	cmpi.w	#$FF,d7
	bne.s	loc_144C22
loc_144C58:
	tst.w	$6A(a4)
	ble.s	loc_144C62
	sub.w	d6,$6A(a4)
loc_144C62:
	tst.w	$6A(a4)
	bge.s	loc_144C6C
	clr.w	$6A(a4)
loc_144C6C:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
