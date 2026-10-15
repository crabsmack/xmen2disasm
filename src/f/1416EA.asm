; ---------------------------------------------------------------------------
; sub_1416EA	[jt 1912]
; ---------------------------------------------------------------------------
sub_1416EA:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3C4A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	lea.l	$3C8A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.w	#$8,$68(a4)
	move.w	-$1A70(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	$3C72(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$94(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$96(a4)
	lea.l	$20(a7),a7
	bne.s	loc_141774
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141790
loc_141774:
	clr.w	$94(a4)
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_141790:
	ori.w	#$80,$6(a4)
	ori.w	#$200,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1417CC
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_1417C4
	ori.b	#$4,$2E(a4)
	bra.s	loc_141812
loc_1417C4:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_141812
loc_1417CC:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1417FC
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_1417F4
	ori.b	#$4,$2E(a4)
	bra.s	loc_141812
loc_1417F4:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_141812
loc_1417FC:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_14180C
	ori.b	#$4,$2E(a4)
	bra.s	loc_141812
loc_14180C:
	andi.b	#$FB,$2E(a4)
loc_141812:
	tst.w	$6(a3)
	beq.s	loc_141834
	pea.l	$9C(a4)
	pea.l	$9A(a4)
	move.w	$6(a3),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1418A4(pc)
	lea.l	$10(a7),a7
	bra.s	loc_14184A
loc_141834:
	pea.l	$9C(a4)
	pea.l	$9A(a4)
	moveq	#$60,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1418A4(pc)
	lea.l	$10(a7),a7
loc_14184A:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.w	$8(a3)
	addq.w	#$8,a7
	bne.s	loc_141874
	move.w	#$100,$9E(a4)
	bra.s	loc_141880
loc_141874:
	move.w	$8(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.w	d0,$9E(a4)
loc_141880:
	tst.w	$C(a3)
	bne.s	loc_14188E
	move.w	#$78,$A0(a4)
	bra.s	loc_141894
loc_14188E:
	move.w	$C(a3),$A0(a4)
loc_141894:
	moveq	#$0,d0
	move.l	d0,$A2(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
