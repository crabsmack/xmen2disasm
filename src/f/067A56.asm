; ---------------------------------------------------------------------------
; sub_067A56	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067A56:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8C(a4),-(a7)
	jsr	sub_064B54(pc)
	movea.l	$8C(a4),a0
	move.b	#$1,$34(a0)
	movea.l	$8C(a4),a0
	move.b	#$1,$35(a0)
	move.l	$8C(a4),-(a7)
	jsr	sub_06489A(pc)
	move.l	d0,$30(a4)
	addq.w	#$8,a7
	beq.s	loc_067A9C
	move.l	$8C(a4),-(a7)
	jsr	sub_064912(pc)
	move.w	d0,$A4(a4)
	addq.w	#$4,a7
	bra.s	loc_067AA2
loc_067A9C:
	move.w	#$FF,$A4(a4)
loc_067AA2:
	move.b	$A5(a4),$2F(a4)
	movea.l	$8C(a4),a0
	move.w	$A(a0),$34(a4)
	move.w	$8(a0),$36(a4)
	ori.b	#$80,$2E(a4)
	move.l	a4,-(a7)
	jsr	sub_067376(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_067AE0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
