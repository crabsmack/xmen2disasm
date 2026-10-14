; ---------------------------------------------------------------------------
; sub_0BDD52	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDD52:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$208A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	clr.w	$20(a4)
	clr.w	$18(a4)
	andi.w	#$BFFF,$6(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_0BDD9C
	move.w	$98(a4),$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BDDC2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDDBA
loc_0BDD9C:
	move.w	$98(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BDE22(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDDBA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
