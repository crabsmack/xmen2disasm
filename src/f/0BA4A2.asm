; ---------------------------------------------------------------------------
; sub_0BA4A2	[jt 983]
; ---------------------------------------------------------------------------
sub_0BA4A2:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_0BA4C8
	move.w	#$FF,d7
	bra.s	loc_0BA520
loc_0BA4C8:
	cmpi.w	#$80,d7
	blt.s	loc_0BA4E2
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	lea.l	$3582(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_0BA520
loc_0BA4E2:
	cmpi.w	#$60,d7
	blt.s	loc_0BA4FC
	move.w	d7,d0
	sub.w	#$60,d0
	move.w	d0,d7
	lea.l	$359A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_0BA520
loc_0BA4FC:
	cmpi.w	#$40,d7
	blt.s	loc_0BA516
	move.w	d7,d0
	sub.w	#$40,d0
	move.w	d0,d7
	lea.l	$35A2(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_0BA520
loc_0BA516:
	lea.l	$358A(a5),a0
	move.l	$2(a0),$2(a4)
loc_0BA520:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_0BA534
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_0BA534:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_0BA54E
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_0BA54E
	ori.b	#$20,(a4)
	bra.s	loc_0BA558
loc_0BA54E:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_0BA558:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
