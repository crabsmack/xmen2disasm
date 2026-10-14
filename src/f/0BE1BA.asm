; ---------------------------------------------------------------------------
; sub_0BE1BA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE1BA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$4000,$6(a4)
	move.l	a4,-(a7)
	jsr	sub_0BD894(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BE1EA
	clr.w	$6C(a4)
	lea.l	sub_0BDF9C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE1FE
loc_0BE1EA:
	move.w	#$1E,$6C(a4)
	lea.l	sub_0BE206(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE1FE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
