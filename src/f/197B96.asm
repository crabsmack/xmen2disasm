; ---------------------------------------------------------------------------
; sub_197B96	[jt 2176]
; ---------------------------------------------------------------------------
sub_197B96:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_197BBC
	move.w	#$FF,d7
	bra.s	loc_197BE0
loc_197BBC:
	cmpi.w	#$80,d7
	blt.s	loc_197BD6
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	lea.l	$444A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_197BE0
loc_197BD6:
	lea.l	$4442(a5),a0
	move.l	$2(a0),$2(a4)
loc_197BE0:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_197BF4
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_197BF4:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_197C0E
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_197C0E
	ori.b	#$20,(a4)
	bra.s	loc_197C18
loc_197C0E:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_197C18:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
