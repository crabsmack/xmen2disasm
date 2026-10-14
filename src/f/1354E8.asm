; ---------------------------------------------------------------------------
; sub_1354E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1354E8:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.w	$AA(a4),d7
	move.w	$12(a4),d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$4,a7
	beq.s	loc_135516
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_135516:
	move.w	d7,$16(a4)
	move.w	d6,$9C(a4)
	clr.w	$AC(a4)
	moveq	#$0,d0
	move.b	-$3B5C(a5),d0
	cmp.w	-$359C(a5),d0
	beq.s	loc_135540
	lea.l	$36C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	bra.s	loc_135550
loc_135540:
	lea.l	$36D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
loc_135550:
	lea.l	sub_13486A(pc),a0
	move.l	a0,$9E(a4)
	ori.w	#$1000,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_13518A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
