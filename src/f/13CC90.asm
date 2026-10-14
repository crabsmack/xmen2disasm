; ---------------------------------------------------------------------------
; sub_13CC90	[jt 1855]
; ---------------------------------------------------------------------------
sub_13CC90:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3A72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	lea.l	$3ABA(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.w	#$1,$68(a4)
	moveq	#-$1,d0
	cmp.w	-$1A74(a5),d0
	lea.l	$10(a7),a7
	bne.s	loc_13CD0C
	lea.l	$39FA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_13CD1C
loc_13CD0C:
	move.w	-$1A74(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	addq.w	#$8,a7
loc_13CD1C:
	lea.l	$3AA2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	sub_13D2A0(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$80,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.s	loc_13CD70
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_13CD68
	ori.b	#$4,$2E(a4)
	bra.s	loc_13CDB6
loc_13CD68:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_13CDB6
loc_13CD70:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_13CDA0
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_13CD98
	ori.b	#$4,$2E(a4)
	bra.s	loc_13CDB6
loc_13CD98:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_13CDB6
loc_13CDA0:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_13CDB0
	ori.b	#$4,$2E(a4)
	bra.s	loc_13CDB6
loc_13CDB0:
	andi.b	#$FB,$2E(a4)
loc_13CDB6:
	pea.l	($3E9).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$4F42(a5)	; -> sub_1F80CA
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3A7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	tst.w	$6(a3)
	lea.l	$14(a7),a7
	beq.s	loc_13CE20
	pea.l	$9E(a4)
	pea.l	$9C(a4)
	move.w	$6(a3),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_13CC3A(pc)
	lea.l	$10(a7),a7
	bra.s	loc_13CE36
loc_13CE20:
	pea.l	$9E(a4)
	pea.l	$9C(a4)
	pea.l	($A0).w
	move.l	a4,-(a7)
	jsr	sub_13CC3A(pc)
	lea.l	$10(a7),a7
loc_13CE36:
	tst.w	$C(a3)
	bne.s	loc_13CE44
	move.w	#$5A,$A0(a4)
	bra.s	loc_13CE4A
loc_13CE44:
	move.w	$C(a3),$A0(a4)
loc_13CE4A:
	tst.w	$E(a3)
	bne.s	loc_13CE58
	move.w	#$FFFF,$A2(a4)
	bra.s	loc_13CE5E
loc_13CE58:
	move.w	$E(a3),$A2(a4)
loc_13CE5E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
