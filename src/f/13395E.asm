; ---------------------------------------------------------------------------
; sub_13395E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13395E:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	beq.s	loc_133986
	moveq	#$4,d0
	and.b	$2E(a3),d0
	beq.s	loc_13398C
	ori.b	#$4,$2E(a4)
	bra.s	loc_13398C
loc_133986:
	ori.b	#$4,$2E(a4)
loc_13398C:
	move.w	d7,$8C(a4)
	bne.s	loc_133998
	addq.l	#$6,$8(a4)
	bra.s	loc_13399C
loc_133998:
	subq.l	#$6,$8(a4)
loc_13399C:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
