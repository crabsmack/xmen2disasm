; ---------------------------------------------------------------------------
; sub_142B54	[jt 1937]
; ---------------------------------------------------------------------------
sub_142B54:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3CBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_142A82(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_142A82(pc),a0
	move.l	a0,$64(a4)
	lea.l	sub_142322(pc),a0
	move.l	a0,$60(a4)
	ori.w	#$80,$6(a4)
	ori.w	#$4000,$6(a4)
	ori.w	#$1,$6(a4)
	lea.l	$3D02(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#$0,d0
	move.b	-$3B66(a5),d0
	cmp.w	-$359C(a5),d0
	lea.l	$10(a7),a7
	bne.s	loc_142BE2
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_142BF0
loc_142BE2:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
loc_142BF0:
	move.w	$6(a3),$9A(a4)
	bne.s	loc_142C10
	andi.b	#$EF,$2E(a4)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_142C66
loc_142C10:
	moveq	#$1,d0
	cmp.w	$9A(a4),d0
	bne.s	loc_142C48
	andi.b	#$EF,$2E(a4)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	sub_142AA6(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_142AA6(pc),a0
	move.l	a0,$64(a4)
	lea.l	sub_142322(pc),a0
	move.l	a0,$60(a4)
	addq.w	#$8,a7
	bra.s	loc_142C66
loc_142C48:
	moveq	#$2,d0
	cmp.w	$9A(a4),d0
	bne.s	loc_142C66
	ori.b	#$10,$2E(a4)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_142C66:
	ori.b	#$4,$2E(a4)
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	move.w	#$28,$9C(a4)
	move.w	#$FA,$9E(a4)
	move.l	d0,$90(a4)
	tst.w	$8(a3)
	beq.s	loc_142C8E
	move.w	$8(a3),d1
	bra.s	loc_142C90
loc_142C8E:
	moveq	#$78,d1
loc_142C90:
	move.w	d1,$98(a4)
	tst.w	$A(a3)
	beq.s	loc_142CA0
	move.w	$A(a3),d0
	bra.s	loc_142CA2
loc_142CA0:
	moveq	#$1,d0
loc_142CA2:
	move.w	d0,$A0(a4)
	tst.w	$C(a3)
	beq.s	loc_142CB2
	move.w	$C(a3),d0
	bra.s	loc_142CB4
loc_142CB2:
	moveq	#$A,d0
loc_142CB4:
	move.w	d0,$A6(a4)
	clr.w	$A2(a4)
	move.w	#$2,$A4(a4)
	lea.l	$3CCA(a5),a0
	move.l	$2(a0),$94(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
