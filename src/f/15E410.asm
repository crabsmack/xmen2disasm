; ---------------------------------------------------------------------------
; sub_15E410	[jt 2062]
; ---------------------------------------------------------------------------
sub_15E410:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_15E43E
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_15E43E
	ori.b	#$20,(a4)
	bra.s	loc_15E448
loc_15E43E:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_15E448:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
