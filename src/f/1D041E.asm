; ---------------------------------------------------------------------------
; sub_1D041E	[jt 2346]
; ---------------------------------------------------------------------------
sub_1D041E:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_1D0444
	move.w	#$FF,d7
	bra.s	loc_1D0482
loc_1D0444:
	cmpi.w	#$96,d7
	blt.s	loc_1D045E
	move.w	d7,d0
	sub.w	#$96,d0
	move.w	d0,d7
	lea.l	$49B2(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1D0482
loc_1D045E:
	cmpi.w	#$64,d7
	blt.s	loc_1D0478
	move.w	d7,d0
	sub.w	#$64,d0
	move.w	d0,d7
	lea.l	$49AA(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1D0482
loc_1D0478:
	lea.l	$49A2(a5),a0
	move.l	$2(a0),$2(a4)
loc_1D0482:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_1D0496
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_1D0496:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1D04B0
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1D04B0
	ori.b	#$20,(a4)
	bra.s	loc_1D04BA
loc_1D04B0:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_1D04BA:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
