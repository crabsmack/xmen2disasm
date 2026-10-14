; ---------------------------------------------------------------------------
; sub_184158	[jt 2144]
; ---------------------------------------------------------------------------
sub_184158:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_18417E
	move.w	#$FF,d7
	bra.s	loc_1841A2
loc_18417E:
	cmpi.w	#$80,d7
	blt.s	loc_184198
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	lea.l	$434A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1841A2
loc_184198:
	lea.l	$4342(a5),a0
	move.l	$2(a0),$2(a4)
loc_1841A2:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_1841B6
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_1841B6:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1841D0
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1841D0
	ori.b	#$20,(a4)
	bra.s	loc_1841DA
loc_1841D0:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_1841DA:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
