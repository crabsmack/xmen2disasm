; ---------------------------------------------------------------------------
; sub_1CFAD8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFAD8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1CF84A(pc)
	move.w	#$FF,$6C(a4)
	moveq	#$0,d0
	move.b	$C2(a4),d0
	cmpi.w	#$4,d0
	bne.s	loc_1CFB04
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1CFB0C
loc_1CFB04:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
loc_1CFB0C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
