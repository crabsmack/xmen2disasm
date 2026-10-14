; ---------------------------------------------------------------------------
; sub_09687C	[jt 740]
; ---------------------------------------------------------------------------
sub_09687C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$9C(a4)
	addq.w	#$8,a7
	beq.s	loc_0968AA
	movea.l	$9C(a4),a3
	bra.s	loc_0968D4
loc_0968AA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$33F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	lea.l	$14(a7),a7
loc_0968D4:
	move.l	a3,d0
	beq.w	loc_09697C
	move.l	a3,-$3B30(a5)
	pea.l	($F2).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F2).w
	jsr	$521A(a5)	; -> sub_1FE584
	ori.w	#$2,$6(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$84(a4)
	moveq	#$10,d1
	and.b	$2E(a4),d1
	lea.l	$10(a7),a7
	bne.s	loc_09691A
	andi.b	#$EF,$2E(a3)
	bra.s	loc_096920
loc_09691A:
	ori.b	#$10,$2E(a3)
loc_096920:
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$6(a1),a0
	move.l	a0,-(a7)
	move.l	a3,-(a7)
	jsr	$3392(a5)	; -> sub_11F2F2
	lea.l	$1962(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a3)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	move.l	$8(a4),$8(a3)
	move.l	$C(a4),$C(a3)
	lea.l	$32EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	clr.b	$96(a3)
	lea.l	$3362(a5),a0
	move.l	a0,$5C(a3)
	move.w	#$FF,$6C(a3)
	ori.w	#$100,$98(a3)
	move.l	a3,$9C(a4)
	lea.l	$18(a7),a7
loc_09697C:
	clr.w	$6C(a4)
	lea.l	sub_095968(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
